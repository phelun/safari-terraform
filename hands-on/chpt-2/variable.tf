variable "number_example" {
  description = "An example of a number variable in Terraform"
  type        = number
  default     = 42
}

# And here’s an example of a variable that checks the value is a list:
variable "list_example" {
  description = "An example of a list in Terraform"
  type        = list
  default     = ["a", "b", "c"]
}

# You can combine type constraints, too. For example, here’s a list input variable that requires all the items in the list to be numbers:
variable "list_numeric_example" {
  description = "An example of a numeric list in Terraform"
  type        = list(number)
  default     = [1, 2, 3]
}

# And here’s a map that requires all the values to be strings:
variable "map_example" {
  description = "An example of a map in Terraform"
  type        = map(string)

  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

# You can also create more complicated structural types using the object and tuple type constraints:
variable "object_example" {
  description = "An example of a structural type in Terraform"
  type        = object({
    name    = string
    age     = number
    tags    = list(string)
    enabled = bool
  })

  default = {
    name    = "value1"
    age     = 42
    tags    = ["a", "b", "c"]
    enabled = true
  }
}

##############################################
# OUR WEBSEVER SAMPLE 
##############################################
variable "server_port" {
  description = "Port used for http req"
  type        = number
  default     = 80
}
