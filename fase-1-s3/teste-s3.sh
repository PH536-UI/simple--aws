#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/../scripts/config.sh"
echo "=== Fase 1: S3 no Floci ==="
aws --endpoint-url $ENDPOINT --region $AWS_DEFAULT_REGION s3 mb s3://phcavalheiro76-bucket-estudo --region $AWS_DEFAULT_REGION || true
aws --endpoint-url $ENDPOINT --region $AWS_DEFAULT_REGION s3 ls
echo "hello floci" > /tmp/hello.txt
aws --endpoint-url $ENDPOINT --region $AWS_DEFAULT_REGION s3 cp /tmp/hello.txt s3://phcavalheiro76-bucket-estudo/
aws --endpoint-url $ENDPOINT --region $AWS_DEFAULT_REGION s3 ls s3://phcavalheiro76-bucket-estudo/
echo "OK Fase 1!"
