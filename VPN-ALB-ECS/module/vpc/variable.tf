variable "vpc_cidr" {
    description = "VPC cidr block. Example: 10.0.0.0/16"
    default = "10.0.0.0/16"
}
variable "public_cidr1of2" {
    description = "Public Subnet cidr block. Example: 10.0.1.0/24"
    default = "10.0.1.0/24"
}
variable "public_cidr2of2" {
    description = "Public Subnet cidr block. Example: 10.0.2.0/24"
    default = "10.0.2.0/24"
}
variable "private_cidr" {
    description = "Public Subnet cidr block. Example: 10.0.3.0/24"
    default = "10.0.3.0/24"
}
variable "availability_zone1" {
    description = "Name of availabilty zone where you want ot create public and private subnet depending upon region"
    default = "us-west-2a"
}
variable "availability_zone2" {
    description = "Name of availabilty zone where you want ot create public and private subnet depending upon region"
    default = "us-west-2b"
}

