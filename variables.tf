variable "AWS_REGION" {
  default = "us-east-1"
}

variable "Security_Group"{
  default = "sg-0fce23046afdb205a"
}

variable "AMI_ID" {
  default = "	ami-043cd015712d3f90c"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}