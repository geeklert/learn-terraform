variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "AWS_REGIONS" {
 type = map(string)
 default = {
   "Ohio"     = "us-east-2"
   "Virginia" = "us-east-1"

  }
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-id"
    us-east-2 = "ami-02a89066c48741345"
 }
}

variable "path_to_private_key" {
    default = "chaabi.pem"  
}

variable "path_to_public_key" {
    default = "chaabi.pub"
}

variable "instance-username" {
    default = "ec2-user"
}