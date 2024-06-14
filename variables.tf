# variables realted to assume_role 
variable "role_name" {
  default     = ""
  type        = string
  description = "name of the role"
}

variable "role-service" {
  type = string
  default = ""
  description = "service which is we are goinig to access s3 buckets from"
}
# variables realted to bucket

variable "resource-s3bucket" {
  type        = string
  default     = ""
  description = "s3bucket name which has to access"
}

variable "policy_name" {
  type        = string
  default     = ""
  description = "policy-name that is attaching to role"
}