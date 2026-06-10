terraform {
  backend "s3" {
    bucket = "tf-state-git-ops-project"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
