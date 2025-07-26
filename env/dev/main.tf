module "dev-ec2" {
    source = "../../modules"
    env = "dev"
    ec2_key_name = "terraform-key-pair-new"
    ec2_security_group = "terraform-sg-new"
    ec2_instance_name = "terraform-instance"
    ec2_volume_size = 15
}
