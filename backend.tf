terraform {
  backend "s3" {
    bucket = "reeds-terraform-state"
    key    = "terraform"
    region = "us-west-2"
  }
}
