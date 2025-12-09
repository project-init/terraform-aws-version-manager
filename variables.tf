variable "service_version" {
  type        = string
  nullable    = false
  description = "The version of the service."

  validation {
    error_message = "Must be valid semantic version or empty string."
    condition     = var.service_version == "" || can(regex("^v(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(?:-((?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\\.(?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\\+([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?$", var.service_version))
  }
}

variable "environment" {
  type        = string
  nullable    = false
  description = "The environment being deployed to."

  validation {
    condition     = contains(["qa", "staging", "stg", "uat", "prod", "production"], var.environment)
    error_message = "Invalid input, options: \"qa\", \"staging\", \"stg\", \"uat\", \"prod\", \"production\"."
  }
}

variable "service_name" {
  type        = string
  nullable    = false
  description = "The name of the service."

  validation {
    condition     = length(var.service_name) > 1
    error_message = "Invalid input, can't be an empty or 1 letter string."
  }
}