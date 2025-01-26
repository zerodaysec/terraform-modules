variable "appname" {
  type        = string
  default     = ""
  description = "Application Name"
}

variable "envname" {
  type        = string
  default     = ""
  description = "Environment name - sbox, dev, test, prod"
}

variable "custname" {
  type        = string
  default     = ""
  description = "Customer name"
}


variable "public_service" {
  type        = bool
  default     = false
  description = "Public or private"
}

variable "internal_proxy_ip" {
  type        = string
  default     = "10.0.0.233"
  description = "Internal Proxy IP"
}

variable "external_proxy_ip" {
  type        = string
  default     = "10.0.0.233"
  description = "External Proxy IP"
}
