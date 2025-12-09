module "version" {
  source = "project-init/version-manager/aws"
  # Project Init recommends pinning every module to a specific version
  # version = "vX.X.X"

  environment     = "staging"
  service_name    = "service"
  service_version = "" # If the version exists and you just want to use the existing one leave this string empty.
}