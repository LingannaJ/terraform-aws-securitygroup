variable "project_name" {
    type = string
  
}

variable "environment" {
    type = string
    default = "dev"
}


variable "sg_name" {
    type = string
  
}

variable "sg_description" {
    type = string

  
}

variable "vpc_id" {
    type = string
  
}

variable "common_tags" {
    type = map
  
}

variable "sg_tags" {
    type = map
  default = { }
}

variable "outbound_rules" {
    type = list
  default = [
    {
    from_port = 0
    to_port = 0
    protocal = -1  # -1 ante all protocals open 
    cidr_blocks = ["0.0.0.0/0"]

  }
  ]
}

variable "ingress_rules" {
    type = list
  default = [ ]
    
}