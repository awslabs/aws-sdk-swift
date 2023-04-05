#!/bin/sh

# FROM https://github.com/sebsto/amplify-ios-getting-started/tree/main/code

REGION=us-west-2

# REPLACE THE IP ADDRESS IN THE COMMAND BELOW
# Use the EC2 Instance Public IP
EBS_VOLUME_ID=$(aws ec2 --region $REGION describe-instances --query 'Reservations[].Instances[?PublicIpAddress==`REPLACE_WITH_YOUR_EC2_IP_ADDR`].BlockDeviceMappings[][].Ebs.VolumeId' --output text)

# REPLACE THE DESCRIPTION IN THE COMMAND BELOW
aws ec2 create-snapshot --region $REGION --volume-id $EBS_VOLUME_ID --description "REPLACE_WITH_YOUR_DESCRIPTION"
