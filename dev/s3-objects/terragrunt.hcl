include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:terraform-aws-modules/terraform-aws-s3-bucket.git//modules/object"
}

# Get Remote state from this deployment, same as: data "terraform_remote_state" "s3"
dependency "s3" {
  config_path = "../s3"
  

 
  mock_outputs = {
    s3_bucket_id = "jai-dummy-s3-id"
  }
  # skip_outputs = true

}

inputs = {
  bucket  = dependency.s3.outputs.s3_bucket_id
  key     = "test_file.txt"
  content = "Hello, this is test text inside the file!"
  tags = {
    Owner       = "Denis Astahov"
    Environment = "dev"
  }
}

# What need to be deployed first (before this) useful for `terragrunt run-all apply`
#dependencies {
 # paths = ["../s3"]
#}
