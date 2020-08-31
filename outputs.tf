output "private_key" {
  description = "SSH private key data"
  value       = tls_private_key.this.private_key_pem
}

output "public_key" {
  description = "SSH public Key data"
  value       = tls_private_key.this.public_key_pem
}

output "master_ip" {
  description = "Jmeter Master IP addr"
  value       = jmeter_master.public_ip
}
