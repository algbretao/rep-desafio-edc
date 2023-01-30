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

variable "bucket_names" {
  description = "Nome dos buckets"
  type        = list(string)
  default = [
    "datalake-desafio-algbretao-tf-${var.ambientes[1]}",
    "datalake-desafio-algbretao-tf-${var.ambientes[2]}",
    "datalake-desafio-algbretao-tf-${var.ambientes[3]}",
  ]
}

variable "ambientes" {
  description = "Ambientes"
  type        = list(string)
  default = [
    "prd",
    "hml",
    "dev",
  ]
}