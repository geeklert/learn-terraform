resource "aws_key_pair" "chaabi" {
  key_name = "chaabi"
  public_key = "${file("${var.path_to_public_key}")}"
}

resource "aws_instance" "tf-instance-kuldeep" {
  #name                   = "tf-instance-kuldeep"
  instance_type          = "t2.micro"
  #key_name               = "terra-test"
  key_name               = "${aws_key_pair.chaabi.key_name}"
  monitoring             = true
  vpc_security_group_ids = ["sg-00a832bffec35051b"]
  subnet_id              = "subnet-02a00537fa286caac"
  ami                    = "${lookup(var.AMIS,var.AWS_REGIONS["Ohio"])}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    CreatedBy   = "Kuldeep"
  }


    provisioner "file" {
        source = "appscript.sh"
        destination = "/tmp/appscript.sh"
        }
    connection {
        type = "ssh"
        port = 22
        host = self.public_ip
        user = "${var.instance-username}"
        #password = "${var.instance-password}"
        #password = "${file("${var.path_to_private_key}")}"
        private_key = "${file("${var.path_to_private_key}")}"
        }
  
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/appscript.sh",
            "sudo /tmp/appscript.sh "
            ]
        }
}
