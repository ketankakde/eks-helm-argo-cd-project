variable "ami" {
 default = "ami-091138d0f0d41ff90"
}

variable "instance_type" {
 default = "t3.micro"
}

variable "key_name" {
 default = "new-key"
}

variable "vpc_id" {}
variable "subnet_id" {}
variable "instance_profile_name" {}
