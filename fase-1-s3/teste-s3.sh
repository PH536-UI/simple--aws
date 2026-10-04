#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/../scripts/config.sh"
BUCKET="phcavalheiro76-bucket-estudo"
echo "=== Fase 1: S3 no Floci === Bucket=$BUCKET ENDPOINT=$ENDPOINT"
aws --endpoint-url $ENDPOINT s3 mb s3://$BUCKET --region us-east-1 || true
aws --endpoint-url $ENDPOINT s3 ls
echo "hello Phcavalheiro76 no Floci $(date)" > "$SCRIPT_DIR/hello.txt"
aws --endpoint-url $ENDPOINT s3 cp "$SCRIPT_DIR/hello.txt" s3://$BUCKET/
aws --endpoint-url $ENDPOINT s3 ls s3://$BUCKET/ --recursive
echo "OK Fase 1! Bucket $BUCKET criado"
