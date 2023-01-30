variable "regiao" {
  default = "us-east-1"
}

variable "iam_arn" {
  default = "arn:aws:iam::451237051222:role/AWSGlueServiceRole-admin"
} 

variable "glue_job_name" {
  default = "glue_job_spark_rais"
}

variable "glue_key_path" {
  default = "glue-code/pyspark/"
}

variable "database_name" {
  default = "database-desafio1"
}

variable "glue_crawler_name" {
  default = "glue_crawler_rais"
}

variable "bucket_name" {
  default = "datalake-desafio-algbretao-tf-${var.ambiente}"
}

variable "ambiente" {
  default = "prd"
}