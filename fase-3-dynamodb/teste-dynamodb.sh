#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/../scripts/config.sh"
TABELA="phcavalheiro76-tabela-usuarios"
echo "=== $TABELA ==="
aws --endpoint-url $ENDPOINT --region $AWS_DEFAULT_REGION dynamodb create-table --table-name $TABELA --attribute-definitions AttributeName=id,AttributeType=S --key-schema AttributeName=id,KeyType=HASH --billing-mode PAY_PER_REQUEST || true
aws --endpoint-url $ENDPOINT --region $AWS_DEFAULT_REGION dynamodb put-item --table-name $TABELA --item '{"id":{"S":"1"},"nome":{"S":"Phcavalheiro76"}}'
aws --endpoint-url $ENDPOINT --region $AWS_DEFAULT_REGION dynamodb scan --table-name $TABELA
echo "OK Fase 3!"
