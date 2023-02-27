#! /usr/bin/bash

echo "Please make sure AWS CLI has been installed and configured properly."

if ! grep aws_access_key_id ~/.aws/config; then
   if ! grep aws_access_key_id ~/.aws/credentials; then
   echo "AWS CLI not configured properly."
   exit 1
   fi
fi

var1="yes"

read -r -p "Would you like to create a bucket? " bucketAnswer

function makeBucket()
   {
    aws s3 mb s3://$bucketname
   }

if [ "$bucketAnswer" = "$var1" ]; then
   read -r -p  "Enter the name of the bucket: " bucketname
   echo "Creating the AWS S3 bucket... "
   echo ""
   makeBucket   
   echo "Successfully created AWS S3 bucket $bucketname"
else
   echo "Okay"
fi

read -r -p "Would you like to upload a file? " answer

function addFile()
    {
        aws s3 mv $filename s3://$bucketname
    }


if [ "$answer" = "$var1" ]; then
   read -r -p "Enter the file you would like to move into the bucket: " filename
   echo "Moving $filename into $bucketname"
   echo ""
   addFile
   echo "Successfully moved $filename into $bucketname"
      
else 
   echo "See ya"
fi
