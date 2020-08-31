module "jmeter_master" {
  source = "./modules/ec2-instance"

  instance_count = 1

  name                        = "jmeter-master"
  key_name                    = aws_key_pair.this.id
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.jmeter.id]
  associate_public_ip_address = true

  user_data_base64 = base64encode(local.master_user_data)

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 40
    },
  ]

  tags = {
    "Role" = "Master"
  }
}



module "jmeter_slave" {
  source = "./modules/ec2-instance"

  instance_count = var.slaves_instance_count

  name                        = "jmeter-slave"
  key_name                    = aws_key_pair.this.id
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.jmeter.id]
  associate_public_ip_address = true

  user_data_base64 = base64encode(local.slave_user_data)

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 40
    },
  ]

  tags = {
    "Role" = "Slave"
  }
}
