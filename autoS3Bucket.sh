#! /usr/bin/bash

echo "Please make sure AWS CLI has been installed and configured properly."

if ! grep aws_access_key_id ~/.aws/config; then
   if ! grep aws_access_key_id ~/.aws/credentials; then
   echo "AWS CLI not configured properly."
   exit 1
   fi
fi
 
read -r -p  "Enter the name of the bucket:" bucketname


function createbucket()
   {
    aws s3 mb s3://$bucketname
   }
 
echo "Creating the AWS S3 bucket... "
echo ""
createbucket   
echo "Successfully created AWS S3 bucket $bucketname"