variable "iam_role_arn" {
  type    = string
  default = "arn:aws:iam::629681583073:role/AWSGlueServiceRole"
}

variable "bucket_name" {
  type    = string
  default = "datalake-tf-wallas"
}
