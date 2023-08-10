resource "aws_instance" "tf-instance-kuldeep" {
  #name                   = "tf-instance-kuldeep"
  instance_type          = "t2.micro"
  key_name               = "terra-test"
  monitoring             = true
  vpc_security_group_ids = ["sg-00a832bffec35051b"]
  subnet_id              = "subnet-0e823bf55d349307f"
  ami                    = "${lookup(var.AMIS,var.AWS_REGIONS["Ohio"])}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    CreatedBy   = "Kuldeep"
  }
}
