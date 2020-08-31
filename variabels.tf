variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "cidr_blocks" {
  type        = list
  description = "VPC CIDR"
}

variable "key_name" {
  type        = string
  description = "Key Name"
}

variable "ami" {
  type        = string
  description = "AMI image for Jmeter"
}

variable "instance_type" {
  type        = string
  description = "description"
  default     = "m5.large"
}
variable "subnet_id" {
  type        = string
  description = "Subnet IDs"
}


variable "slaves_instance_count" {
  type        = number
  description = "Slave count"
  default     = 1
}
