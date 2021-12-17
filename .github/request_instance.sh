#!/bin/bash

# Start a spot request to AWS
aws ec2 request-spot-instances --spot-price "0.75" --instance-count 1 --type "one-time" --launch-specification file://.github/aws_ec2_config.json > spot_request_resp.json
# Check if the spot request was successfull - If not exit with our error code
if [ $? != 0 ]; then
    echo "Failed to request spot instance (${$?})"
    exit $?
fi
# Retrieve the Spot Request ID from our resp.json file
SPOT_REQ_ID=$(cat spot_request_resp.json | jq '.SpotInstanceRequests[0].SpotInstanceRequestId' --raw-output)
echo "Received Spot Request ID: ${SPOT_REQ_ID}"
# Create our Instance ID variable and set it to an empty string
INSTANCE_ID=""

# Give AWS 5 seconds before we check if an instance exists
sleep 5

# Repeatedly check our request and see if it goes through and returns an Instance ID, Timeout after 1min
max=20
for i in `seq 1 $max`
do
    # Retrieve the Spot request info
    aws ec2 describe-spot-instance-requests --spot-instance-request-ids ${SPOT_REQ_ID} > spot_request_info.json
    # Check if the instance ID is set
    INSTANCE_ID=$(cat spot_request_info.json | jq '.SpotInstanceRequests[0].InstanceId // empty' --raw-output)
    if [ "$INSTANCE_ID" == "" ]; then
        echo "Waiting for an instance id.. Sleep for 5s"
        # Sleep for 5 seconds
        sleep 5
    else
        echo "Instance ${INSTANCE_ID} is staring up."
        break
    fi
done

if [ "$INSTANCE_ID" == "" ]; then
    exit 1
fi

# Set out outputs for our Github Actions step
echo "::set-output name=spotReqID::${SPOT_REQ_ID}"
echo "::set-output name=instanceID::${INSTANCE_ID}"

exit 0