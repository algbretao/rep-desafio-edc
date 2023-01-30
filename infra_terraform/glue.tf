resource "aws_glue_job" "glue_job_rais" {
  name     = "${var.glue_job_name}"
  role_arn = "${var.iam_arn}"
  max_retries = "1"
  timeout = 2880
  command {
    script_location = "s3://${var.bucket_name}-${var.ambiente}/scripts/glue_job_from_tf.py"
    # spark_ui_url = "s3://${var.bucket_name}-${var.ambiente}/sparkHistoryLogs/"
    # temp_dir = "s3://${var.bucket_name}-${var.ambiente}/glue-scripts/temporary"
    python_version = "3"
  }
  execution_property {
    max_concurrent_runs = 1
  }
  glue_version = "3.0"
}

resource "aws_glue_crawler" "glue_crawler_rais" {
  database_name = "${var.database_name}"
  name          = "${var.glue_crawler_name}"
  role          = "${var.iam_arn}"

  s3_target {
    path = "s3://${var.bucket_name}-${var.ambiente}/desafio_zona_staging/result_glue_test_silver/"
  }
}

# resource "aws_iam_role" "glue_role_rais" {
#   name = "test_role"

#   # Terraform's "jsonencode" function converts a Terraform expression result to valid JSON syntax.
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

#   tags = {
#     tag-key = "tag-value"
#   }
# }