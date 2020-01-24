variable "name" {
  
}

variable "acl" { //access control list
  default = "private"
}

variable "versioning" {
  default = false
}

variable "tags" {
   type = "map"
   default = {} 
}

variable "create_object" {
  default = false
}

variable "object_key" {
  default = ""
}

variable "object_source" {
  default = ""
}

