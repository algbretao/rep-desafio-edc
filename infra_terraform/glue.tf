# Cria o Job Glue com os parâmetros necessários, a execução do Job é manual, através do AWS Console.
resource "aws_glue_job" "glue_job_rais" {
  name     = "${var.glue_job_name}" # Nome do Job que será exibido no console.
  role_arn = "${var.iam_arn}" # Está sendo selecionada a IAM role já existente, criada anteriormemte.
  max_retries = "1" # Máximo de tentativas de execução
  timeout = 2880 
  command {
    # Path do bucket S3 onde está gravado o arquivo pyspark com o código do glue job a ser executado.
    script_location = "s3://${var.bucket_name}/scripts/glue_job_from_tf.py" 
    python_version = "3"
  }
  execution_property {
    max_concurrent_runs = 1
  }
  glue_version = "3.0"
}

# Cria o Crawler para indexar os dados em catálogos de dados do AWS Glue.
# Necessário dar um 'run' no Crowler através do console AWS.
resource "aws_glue_crawler" "glue_crawler_rais" {
  database_name = "${var.database_name}"
  name          = "${var.glue_crawler_name}"
  role          = "${var.iam_arn}"

  s3_target {
    # Path onde o Crowler irá ler o dado já tratado no formato parquet.
    # Este path foi definido no glue job, para gravar os dados já tratados.
    path = "s3://${var.bucket_name}/RAIS-2020/staging/"
  }
}