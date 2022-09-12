terraform {
  backend "s3" {
    bucket = "terraform-state-enem-file"
    key    = "tf_state/terraform.tfstate"
    region = "us-east-1"
  }
}

