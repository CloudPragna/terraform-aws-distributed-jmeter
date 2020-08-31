module "jmeter" {
  source        = "../"
  key_name      = "rajeev"
  ami           = "ami-0873b46c45c11058d"
  instance_type = "t2.medium"
  subnet_id     = "subnet-09808b21017d191ae"
  cidr_blocks   = ["10.101.0.0/16"]
  vpc_id        = "vpc-0c0aef4acc92bf793"
}
