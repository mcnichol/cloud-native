#!/usr/bin/env bash

set -e

SCRIPT_DIR=${BASH_SOURCE%/*}

source $SCRIPT_DIR/../../config/functions.sh
source $SCRIPT_DIR/../../config/styles.sh
source $SCRIPT_DIR/../../common/jq_guard.sh

regions=$(eval 'for region in '$(aws ec2 describe-regions | jq '.Regions[].RegionName')'; do echo $region; done')

echo "Region, AZ-Count"
for region in $regions; do
    az_count=$(aws ec2 describe-availability-zones --region=$region | jq '.AvailabilityZones | length')

    echo "$region, $az_count"
done
