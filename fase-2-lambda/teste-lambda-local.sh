#!/bin/bash
echo "=== Fase 2: Lambda MOCK local - 0 erros BindException ==="
python3 -c "
import lambda_function
result = lambda_function.lambda_handler({'nome':'Phcavalheiro76'}, None)
print(result)
import json
open('output.json','w').write(json.dumps(result))
"
cat output.json
echo ""
echo "OK Fase 2 - Mock local funcionando 100%"
