# Cria um bucket no S3
resource "aws_s3_bucket" "datalake" {
  bucket = "${var.bucket_name}"
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}

# Configurações de rules do bucket criado
resource "aws_s3_bucket_server_side_encryption_configuration" "datalake-configuration" {
  bucket = aws_s3_bucket.datalake.id

  rule {
    apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
    }
    bucket_key_enabled = true
  }
}

# Define as permissões de acesso do bucket 
resource "aws_s3_bucket_acl" "datalake-acl" {
  bucket = aws_s3_bucket.datalake.id
  acl    = "private"
}

# Configura regras para bloquear o acesso anônimo ao conteúdo do bucket
resource "aws_s3_bucket_public_access_block" "datalake_public_access_block" {
  bucket = aws_s3_bucket.datalake.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
} 