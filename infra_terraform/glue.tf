resource "aws_glue_job" "glue_job_rais" {
  name     = "${var.glue_job_name}"
  role_arn = "${var.iam_arn}"
  max_retries = "1"
  timeout = 2880
  command {
    script_location = "s3://${var.bucket_name}/scripts/glue_job_from_tf.py"
    # spark_ui_url = "s3://${var.bucket_name}/sparkHistoryLogs/"
    # temp_dir = "s3://${var.bucket_name}/glue-scripts/temporary"
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
    path = "s3://${var.bucket_name}/RAIS-2020/staging/"
  }
}