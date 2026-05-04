terraform {
  required_providers {

    template = {
      version = "2.2.0"
    }

    random = {
      version = "2.2"
    }

    archive = {
      version = "1.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
  required_version = ">=0.14.8"
}
