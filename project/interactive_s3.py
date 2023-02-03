import os
import boto3
from tqdm import tqdm 

s3 = boto3.client('s3')

bucket_s3 = "datalake-desafio-algbretao-tf-prd"
path_s3 = "RAIS-2020/raw/"
path_local = '../data/'
file_names = [f for f in os.listdir(path_local) if 'git' not in f]

for arq in tqdm(file_names):
    s3.upload_file(path_local + arq, bucket_s3, path_s3 + arq)

print("Os arquivos foram carregados:")
for item in file_names:
    print("-> " + item)