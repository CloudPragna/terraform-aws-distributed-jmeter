variable "source" {
  type        = list
  description = "description"
  default     = [

  ]
}

variable "host" {
  type        = string
  description = "description"
}

variable "user" {
  type        = string
  description = "description"
  default     = "ec2-user"
}

variable "port" {
  type        = number
  description = "description"
  default     = 22
}

variable "private_key" {
  type        = string
  description = "description"
}
