import boto3
import requests




def upload_file_to_s3(file_name, bucket_name, folder):
    base_url= 'https://data.gharchive.org/'
    print(f'Getting the {file_name} from gharchive')
    
    res = requests.get(base_url+file_name)
    print(f'Uploading {file_name} to s3 under s3://{bucket_name}/{folder}')
    if res.status_code == 200:
        s3_client = boto3.client('s3')
        upload_res = s3_client.put_object(
            Bucket = bucket_name,
            Key = folder+file_name,
            Body = res.content 
        )

        return {
            'last_run_file_name': f's3://{bucket_name}/{folder}/{file_name}',
            'status_code': upload_res['ResponseMetadata']['HTTPStatusCode']
        }