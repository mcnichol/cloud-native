regions=$(eval 'for region in '$(aws ec2 describe-regions | jq '.Regions[].RegionName')'; do echo $region; done')

for region in $regions; do
    az_count=$(aws ec2 describe-availability-zones --region=$region | jq '.AvailabilityZones | length')

    echo "$region, $az_count"
done
