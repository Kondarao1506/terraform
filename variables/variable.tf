variable "ami_id" {
  type = "string"
  default = "ami-09c813fb71547fc4f"
  description = "This is the AMI id of devops-practice which is redhat 9"
}

variable "instance_type" {
  type = "string"
  default = "t3.micro"
}

variable "tags" {
    type = "map"
    default = {
        Name = "backend"
        Project = "expence"
        Component = "backend"
        Environment = "Dev"
        Terraform = "true"

    }
  
}

variable "sg_name" {
    default = "allow_ssh"
  }
  
variable "sg_desc" {
    default = "allow port number 22 for ssh access"
  }

variable "port" {
  type = number
  default = 22
}

variable "cidr_blocks" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "ipv6_cidr_blocks" {
    type = list(string)
    default = [ "::/0" ]
  
}
