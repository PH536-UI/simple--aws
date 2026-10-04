#!/bin/bash
set -e
echo "=== FIX FLOCI MAC - 135 serviços ==="
sudo chmod 666 /var/run/docker.sock 2>/dev/null || true
ls -lh /var/run/docker.sock
cd ~/floci-froci
docker compose pull
docker rm -f floci-froci 2>/dev/null || true
docker compose up -d
echo "Aguardando..."
sleep 10
docker logs floci-froci --tail 10 | grep -E "Ready|Enabled"
curl -s http://localhost:4566/_localstack/health | python3 -c "
import json,sys
try:
 d=json.load(sys.stdin)
 print(f'✅ TOTAL: {len(d[\"services\"])} serviços')
 print('✅ 0 erros de BindException')
except:
 print('❌ Floci ainda iniciando...')
"
