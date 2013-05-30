#!/bin/bash
curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST' \
-d '{"auth":{"RAX-KSKEY:apiKeyCredentials":{"username":"ekingsford", "apiKey":"05e92bf21f1555899c2b0ed3c5321944"}}}' \
-H "Content-Type: application/json"

