resource "aws_s3_bucket_object" "script" {
  bucket     = var.bucket_name
  key        = "landing-zone/enem/scripts/enem_spark_script.py"
  source     = "../jobs_spark/spark_script.py"
  depends_on = [aws_s3_bucket.datalake]
  etag       = filemd5("../jobs_spark/spark_script.py")
}

resource "aws_s3_bucket_object" "data" {
  bucket     = var.bucket_name
  key        = "landing-zone/enem/data/microdados_enem_2019.csv"
  source     = "../data/microdados_enem_2019.csv"
  depends_on = [aws_s3_bucket.datalake]
  etag       = filemd5("../data/microdados_enem_2019.csv")
}
