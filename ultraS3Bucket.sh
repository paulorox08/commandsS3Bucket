#! /usr/bin/bash

echo "Please make sure AWS CLI has been installed and configured properly."

if ! grep aws_access_key_id ~/.aws/config; then
   if ! grep aws_access_key_id ~/.aws/credentials; then
   echo "AWS CLI not configured properly."
   exit 1
   fi
fi

function makeBucket()
   {
    aws s3 mb s3://$bucketname
   }

function addFile()
    {
        aws s3 mv $filename s3://$bucketname
    }

function removeFile()
    {
        aws s3 rm s3://$bucketname/$filename
    }
function deleteBucket()
    {
        aws s3 rb s3://$bucketname --force
    }


var1="yes"

echo -e "Choose from the following:\n1. Create a bucket\n2. Upload files to a bucket\n3. Remove files from a bucket\n4. Delete a bucket.\nPress any other key to quit."
read -r -p "" answer

if [ $answer = 1 ]; then
    read -r -p  "Enter the name of the bucket: " bucketname
    echo "Creating the AWS S3 bucket... "
    echo ""
    makeBucket   
    echo "Successfully created AWS S3 bucket $bucketname"
elif [ $answer = 2 ]; then
    read -r -p  "Enter the name of the bucket you want to move the file into: " bucketname
    read -r -p "Which file from the current directory would you like to move into the bucket? " filename
    echo ""
    addFile   
    echo "Successfully moved $filename into $bucketname"
elif [ $answer = 3 ]; then
    read -r -p  "Enter the name of the bucket you want to remove the file from: " bucketname
    read -r -p "Which file from the current directory would you like to delete from the bucket? " filename
    echo ""
    removeFile   
    echo "Successfully removed $filename from $bucketname"
elif [ $answer = 4 ]; then
    read -r -p  "Enter the name of the bucket you want to delete: " bucketname
    echo "Deleting the AWS S3 bucket... "
    echo ""
    deleteBucket   
    echo "Successfully deleted AWS S3 $bucketname"
else
    echo "See ya."
fi