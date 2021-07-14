# variables.tf
variable "access_key" {
     default = "AKIAXSCMYSMF6QIL2DP2"
}
variable "secret_key" {
     default = "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"
}
variable "region" {
     default = "us-west-1"
}
variable "availabilityZone" {
     default = "us-west-1a"
}
variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "vpcCIDRblock" {
    default = "10.0.0.0/16"
}
variable "subnetCIDRblock" {
    default = "10.0.1.0/24"
}
variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}
# end of variables.

