resource "aws_glue_job" "glue_job_enem" {
  name     = "glue_job_enem"
  role_arn = var.iam_role_arn
  number_of_workers = 5
  worker_type = "Standard"
  timeout = 60
  max_retries = 0
  glue_version = "3.0"

  command {
    script_location = "s3://datalake-tf-wallas/landing-zone/enem/scripts/enem_spark_script.py"
    python_version = 3
  }

 execution_property {
    max_concurrent_runs = 10
  }

  provisioner "local-exec" {
    command = "aws glue start-job-run --job-name glue_job_enem"
  }

}