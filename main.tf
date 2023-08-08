module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "tf-instance-kuldeep"

  instance_type          = "t2.micro"
  key_name               = "terra-test"
  monitoring             = true
  vpc_security_group_ids = ["sg-tf-restricted"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    CreatedBy   = "Kuldeep"
  }
}
