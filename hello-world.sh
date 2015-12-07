#!/bin/bash
curl -X POST http://192.168.33.10:8080/v2/apps -H "Content-type: application/json" -d @./hello-world.json