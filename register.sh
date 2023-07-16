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
      "Address": "192.168.80.2",
      "Port": 3000,
      "EnableTagOverride": false,
      "Check": {
        "DeregisterCriticalServiceAfter": "90m",
        "HTTP": "http://192.168.80.2:3000/",
        "Interval": "10s"
      }
    }' \
    http://localhost:8500/v1/agent/service/register
