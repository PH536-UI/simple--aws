# Simple AWS - Estudo com Floci (LocalStack)

Projeto baseado na newsletter https://newsletter.simpleaws.dev

## Fases
- Fase 1: S3
- Fase 2: Lambda
- Fase 3: DynamoDB
- Fase 4: API Gateway
- Fase 5: Event-Driven (S3 -> SNS -> Lambda -> DynamoDB)

## Rodar local
floci start
aws --endpoint-url=http://localhost:4566 s3 ls
