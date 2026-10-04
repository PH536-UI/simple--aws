#!/bin/bash
set -e
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
ENDPOINT="http://localhost:4566"
TABELA="phcavalheiro76-tabela-usuarios"
echo "=== $TABELA ==="
aws --endpoint-url $ENDPOINT --region us-east-1 dynamodb create-table --table-name $TABELA --attribute-definitions AttributeName=id,AttributeType=S --key-schema AttributeName=id,KeyType=HASH --billing-mode PAY_PER_REQUEST || true
aws --endpoint-url $ENDPOINT --region us-east-1 dynamodb put-item --table-name $TABELA --item '{"id":{"S":"1"},"nome":{"S":"Phcavalheiro76"}}'
aws --endpoint-url $ENDPOINT --region us-east-1 dynamodb scan --table-name $TABELA
echo "OK Fase 3!"
