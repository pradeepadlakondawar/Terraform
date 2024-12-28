variable "cidr_block" {}
variable "dns_support" {}
variable "dns_hostnames" {}
variable "tags" {
  type = map(string)
}
