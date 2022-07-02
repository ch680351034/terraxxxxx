include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:dod-iac/terraform-aws-s3-kms-key.git//."
  
}

inputs = {
  description = "kmskeyfromterragrunt"
  enable_key_rotation = true
  key_deletion_window_in_days = "7"
  name = "alias/kmssamplekeyfromterragrunt"
  principals = ["*"]
  tags = {
    Owner       = "charan"
    Environment = "dev"
  }
}
