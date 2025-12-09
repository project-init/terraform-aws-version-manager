locals {
  service_version = var.service_version == "" ? data.aws_ssm_parameter.service_version[0].insecure_value : var.service_version
}

data "aws_ssm_parameter" "service_version" {
  count = var.service_version == "" ? 1 : 0
  name  = "/${var.environment}/service/${var.service_name}/version"
}

resource "aws_ssm_parameter" "service_version" {
  name  = "/${var.environment}/service/${var.service_name}/version"
  type  = "String"
  value = local.service_version
}