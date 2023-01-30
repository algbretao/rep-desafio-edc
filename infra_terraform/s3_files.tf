resource "aws_s3_object" "codigo-glue-job" {
  bucket = "${var.bucket_name}-${var.ambiente}"
  key    = "s3://${var.bucket_name}-${var.ambiente}/scripts/glue_job_from_tf.py"
  source = "../jobs/glue_job.py"          # Arquivo com o job que vai subir
  etag   = filemd5("../jobs/glue_job.py") # Define qual é o objeto de parâmetro
} 