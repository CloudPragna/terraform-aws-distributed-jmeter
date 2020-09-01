variable "name" {
  description = "description"
  default     = "default"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "cidr_blocks" {
  type        = list
  description = "VPC CIDR"
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

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  type        = list(string)
  default     = []
}

variable "slaves_instance_count" {
  type        = number
  description = "Slave count"
  default     = 1
}


variable "source_jmx" {
  type        = list
  description = "description"
  default = [

  ]
}