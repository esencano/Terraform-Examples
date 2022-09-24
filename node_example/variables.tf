variable "token" {
  type        = string
  description = "Linode token"
}

variable "root_pass" {
  type        = string
  description = "Root user pass for node"
  default     = "test1234"
}