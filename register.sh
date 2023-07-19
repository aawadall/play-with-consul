#!/bin/bash
#Register Service in Consul 


curl \
    --request PUT \
    --data '{
      "ID": "web1",
      "Name": "web",
      "Tags": [
        "web",
        "docker"
      ],
      "Address": "127.0.0.1",
      "Port": 3000,
      "EnableTagOverride": false,
      "Check": {
        "DeregisterCriticalServiceAfter": "90m",
        "HTTP": "http://127.0.0.1:3000/health",
        "Interval": "10s"
      }
    }' \
    http://localhost:8500/v1/agent/service/register
