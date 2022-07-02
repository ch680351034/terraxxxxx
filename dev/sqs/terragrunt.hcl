include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:terraform-aws-modules/terraform-aws-sqs.git//."
 
}

inputs = {
  name = "sqsfromterragrunt"
  policy = "${file("policy.json")}"
  tags = {
    Owner       = "Denis Astahov"
    Environment = "dev"
  }
}
