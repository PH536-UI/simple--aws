def lambda_handler(event, context):
    nome = event.get('nome', 'Phcavalheiro76') if isinstance(event, dict) else 'Phcavalheiro76'
    return {'statusCode': 200, 'body': f'Ola {nome} - Floci 127 servicos - lambda fake OK'}
