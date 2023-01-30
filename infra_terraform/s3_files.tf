resource "aws_s3_object" "codigo-glue-job" {
  bucket = "${var.bucket_names[1]}"
  key    = "${var.bucket_names[1]}/scripts/glue_job_from_tf.py" # Diretório onde será gravado o arquivo
  source = "../jobs/glue_job.py"          # Arquivo com o job que vai subir
  etag   = filemd5("../jobs/glue_job.py") # Define qual é o objeto de parâmetro
} 