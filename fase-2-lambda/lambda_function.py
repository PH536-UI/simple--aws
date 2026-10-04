def lambda_handler(event, context):
    print(f"Evento recebido: {event}")
    return {
        "statusCode": 200,
        "body": f"Hello Phcavalheiro76! Floci funcionando! Evento: {event}"
    }
