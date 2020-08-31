resource "tls_private_key" "this" {
  algorithm   = "RSA"
  rsa_bits = "2048"
}

resource "aws_key_pair" "deployer" {
  key_name   = "${var.name}-key"
  public_key = tls_private_key.this.public_key_pem 
}


resource "null_resource" "example1" {

  provisioner "file" {
    content     = tls_private_key.this.private_key_pem
    destination = "${path.module}/${var.name}-key"
  }

}