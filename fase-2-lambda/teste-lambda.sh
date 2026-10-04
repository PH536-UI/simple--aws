#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/../scripts/config.sh"
LAMBDA_NAME="phcavalheiro76-lambda-hello"
ROLE_NAME="phcavalheiro76-lambda-role"

echo "=== Fase 2: $LAMBDA_NAME no Floci ==="

# 1. Role fake pro Floci
aws --endpoint-url $ENDPOINT iam create-role \
  --role-name $ROLE_NAME \
  --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"lambda.amazonaws.com"},"Action":"sts:AssumeRole"}]}' || true

ROLE_ARN=$(aws --endpoint-url $ENDPOINT iam get-role --role-name $ROLE_NAME --query 'Role.Arn' --output text)

# 2. Zipar
cd "$SCRIPT_DIR"
zip -q function.zip lambda_function.py

# 3. Criar ou atualizar lambda
aws --endpoint-url $ENDPOINT lambda create-function \
  --function-name $LAMBDA_NAME \
  --runtime python3.11 \
  --role $ROLE_ARN \
  --handler lambda_function.lambda_handler \
  --zip-file fileb://function.zip || \
aws --endpoint-url $ENDPOINT lambda update-function-code \
  --function-name $LAMBDA_NAME \
  --zip-file fileb://function.zip

# 4. Invocar
echo "Invocando..."
aws --endpoint-url $ENDPOINT lambda invoke \
  --function-name $LAMBDA_NAME \
  --payload '{"nome":"Phcavalheiro76"}' \
  output.json

cat output.json
echo ""
echo "OK Fase 2! - 100% LOCAL"
