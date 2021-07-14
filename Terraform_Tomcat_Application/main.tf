provider "aws" {
  region = "us-west-1"
  access_key = "AKIAXSCMYSMF6QIL2DP2"
  secret_key = "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"

}

module "my_vpc" {
  source = "/home/ec2-user/test/vpc"
}
module "my_ec2" {
  source = "/home/ec2-user/test/ec2"
  subnet-id = "${module.my_vpc.subnet_id}"
  sg-groups = "${module.my_vpc.sg_id}"
}
