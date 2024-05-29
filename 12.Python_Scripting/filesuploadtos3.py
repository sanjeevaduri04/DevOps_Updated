import boto3

def upload_to_s3(file_name, bucket_name, object_name=None):
    """
    Uploads a file to an S3 bucket.

    :param file_name: File to upload
    :param bucket_name: S3 bucket to upload to
    :param object_name: S3 object name. If not specified then file_name is used
    :return: True if file was uploaded, else False
    """
    # If S3 object_name was not specified, use file_name
    if object_name is None:
        object_name = file_name

    # Initialize the S3 client
    s3_client = boto3.client('s3')

    try:
        # Upload the file
        s3_client.upload_file(file_name, bucket_name, object_name)
        print(f"File {file_name} uploaded to {bucket_name}/{object_name}")
        return True
    except Exception as e:
        print(f"An error occurred: {e}")
        return False

if __name__ == "__main__":
    # Example usage
    file_name = 'path/to/your/file.txt'
    bucket_name = 'your-s3-bucket-name'
    object_name = 'desired/path/in/s3/file.txt'  # Optional, if you want a specific name/path in the bucket

    success = upload_to_s3(file_name, bucket_name, object_name)
    if success:
        print("File uploaded successfully.")
    else:
        print("File upload failed.")

