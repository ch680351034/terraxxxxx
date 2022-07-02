include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:terraform-aws-modules/terraform-aws-s3-bucket.git//."
}

inputs = {
  bucket = "terragrunt-ch-121243-dev"
  tags = {
    Owner       = "Denis Astahov"
    Environment = "dev"
  }
}
