#!/bin/bash
SPOT_REQ_ID=$1
INSTANCE_ID=$2

# Cancel our spot request
echo "Canceling spot request ID ${SPOT_REQ_ID}"
aws ec2 cancel-spot-instance-requests --spot-instance-request-ids ${SPOT_REQ_ID} > spot_cancel_info.json

# Terminate the instance
echo "Terminating instance ID ${INSTANCE_ID}"
aws ec2 terminate-instances --instance-ids ${INSTANCE_ID} > instance_cancel_info.json