<h4>A simple script that creates an S3 bucket/ add files into a bucket/ removes files from a bucket/ deletes a bucket.</h4>

**NOTE**: there are some prerequisites the user needs before running the script and some things to think about, such as:

- AWS CLI needs to be installed

- AWC access key id is located in ~/.aws/credentials
	
- Sandpit account needs to be configured
	
- Note:  potential issues with mismatch of AWS profiles when running script from another users computer
	
- Note: issues with creating a duplicate S3 bucket 

If permission denied, run:
    chmod u+x ultraS3Bucket.sh

Creating a bucket:

- Press 1 to create a bucket

- **NOTE**: Ensure the bucket you want to add has a unique name

Adding files into a bucket:

- Press 2 to add a file into a bucket

- **NOTE**: The file you want to add has to be in the current working directory

- Enter the bucket name and then the file name

- This only lets you add one file at a time

Removing files from a bucket:

- Press 3 to remove a file from a bucket

- Enter the bucket name and then the file name

- Only lets you remove one file at a time

Deleting a bucket:

- Press 4 to delete a bucket

- Enter the name of the bucket you want to delete

- **NOTE**: Also deletes all the contents of the bucket