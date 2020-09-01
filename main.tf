module "jmeter_master" {
  source = "./modules/ec2-instance"

  instance_count = 1

  name                        = "${var.name}-master"
  key_name                    = aws_key_pair.this.key_name
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  subnet_ids                  = var.subnet_ids
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

  name                        = "${var.name}-slave"
  key_name                    = aws_key_pair.this.key_name
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  subnet_ids                  = var.subnet_ids
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


module "load_test" {
  source      = "./modules/load-test"
  source_jmx  = var.source_jmx
  host        = module.jmeter_master.master_ip[0]
  private_key = tls_private_key.this.private_key_pem
  slave_ips   = join(",", module.jmeter_slave.slave_ips)
}
