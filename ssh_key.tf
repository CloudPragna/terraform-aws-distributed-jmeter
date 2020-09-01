resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

resource "local_file" "private_key" {
  content  = tls_private_key.this.private_key_pem
  filename = "${path.module}/${var.name}-key"
}

resource "local_file" "public_key" {
  content  = tls_private_key.this.public_key_pem
  filename = "${path.module}/${var.name}-key.pub"
}

resource "aws_key_pair" "this" {
  key_name   = "${var.name}-key"
  public_key = tls_private_key.this.public_key_openssh
}
