provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
        default = "us-east-1"

}
variable "AWS_REGIONS" {
  type = map(string)
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "ami-id"
    us-east-2 = "ami-0f34c5ae932e6f0e4"
 }
}

resource "aws_instance" "tf-instance-kuldeep" {
  #name                   = "tf-instance-kuldeep"
  instance_type          = "t2.micro"
  key_name               = "terra-test"
  monitoring             = true
  vpc_security_group_ids = ["sg-tf-restricted"]
  subnet_id              = "subnet-eddcdzz4"
  ami                    = var.AMIS[var.AWS_REGIONS["Ohio"]]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    CreatedBy   = "Kuldeep"
  }
}
