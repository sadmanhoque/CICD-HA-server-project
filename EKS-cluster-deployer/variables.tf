variable "name" {
  description = "(Required) Creates a unique cluster name"
  type        = string
  default     = "my-eks-cluster"
}

variable "environment" {
  description = "(Required) Creates a unique cluster name"
  type        = string
  default     = "test"
}