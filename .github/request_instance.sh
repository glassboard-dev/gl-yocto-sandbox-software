#!/bin/bash

# Start a spot request to AWS
aws ec2 request-spot-instances --spot-price "0.75" --instance-count 1 --type "one-time" --launch-specification file://aws_ec2_config.json > spot_request_resp.json
SPOT_REQ_RESP=$(echo $?)
SPOT_REQ_ID=$(cat spot_request_resp.json | jq '.SpotInstanceRequests[0].SpotInstanceRequestId' --raw-output)

echo "Resp (${SPOT_REQ_RESP}) - Received Spot Request ID: ${SPOT_REQ_ID}"

return ${SPOT_REQ_RESP}