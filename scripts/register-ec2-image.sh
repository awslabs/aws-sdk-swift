#!/bin/sh

# FROM https://github.com/sebsto/amplify-ios-getting-started/tree/main/code

REGION=us-west-2
SNAPSHOT_ID=REPLACE_WITH_YOUR_SNAPSHOT_ID
aws ec2 register-image --region=$REGION --name "REPLACE_WITH_YOUR_NAME" --description "REPLACE_WITH_YOUR_DESCRIPTION" --architecture x86_64_mac --virtualization-type hvm --block-device-mappings DeviceName="/dev/sda1",Ebs=\{SnapshotId=$SNAPSHOT_ID,VolumeType=gp3\} --root-device-name "/dev/sda1"
