variable "vpc" {
  description = "VPC name for Test environment"
}

variable "listener-arn-80" {
    description = "Listen ARN for Port 80"
}

variable "domainame" {
    description = "Endpoint Domian Apex name"
}

variable "priority" {
    description = "Listener Rule Priority"
    default = 3
}