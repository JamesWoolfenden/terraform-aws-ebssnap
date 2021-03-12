terraform {
  required_providers {
    aws = {
      version = "3.32.0"
      source  = "hashicorp/aws"
    }

    template = {
      version = "2.1"
    }

    random = {
      version = "2.1"
    }

    archive = {
      version = "1.2"
    }
  }
}
