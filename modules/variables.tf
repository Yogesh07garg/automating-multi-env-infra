variable "env" {
  description = "enter the environment"
  type = string
}

variable "ec2_key_name" {
  description = "enter the key pair name"
  type = string
}

variable "ec2_security_group" {
  description = "enter the security group name"
  type = string
}

variable "ec2_instance_type" {
  default = "t2.micro"
type = string
}

variable "ec2_instance_name" {
   description = "enter the instance name"
  type = string
}

variable "ec2_volume_size" {
  description = "enter the volume you want"
  type = number
}

variable "ec2_ami" {
  default = "ami-0f918f7e67a3323f0"
  type = string
}



