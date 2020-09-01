module "jmeter" {
  source        = "../"
  name          = "jmeter"
  ami           = "ami-0873b46c45c11058d"
  instance_type = "t2.medium"
  subnet_id     = "subnet-xxxx"
  cidr_blocks   = ["10.101.0.0/16"]
  vpc_id        = "vpc-xxxx"
  source_jmx    = ["${path.module}/test.jmx", "${path.module}/test2.jmx"]
}
