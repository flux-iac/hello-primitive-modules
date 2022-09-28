terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.32.0"
    }
  }
}

provider "aws" {
}

variable "values" {

  type = object({
    greeting = optional(string)
    subject = optional(string)
  })

  default = {
    greeting = "Hello"
    subject  = "world"
  }

}

output "hello_world" {
  value = "${var.values.greeting}, ${var.values.subject}!"
}
