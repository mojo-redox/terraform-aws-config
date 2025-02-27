#
# AWS Config Logs Bucket
#

module "config_logs" {
  source  = "trussworks/logs/aws"
  version = "~> 3"

  s3_bucket_name     = "${var.config_logs_bucket}"
  region             = "${var.region}"
  allow_config       = "true"
  config_logs_prefix = "config"
}

module "config" {
  source = "../../"

  config_logs_bucket = "${module.config_logs.aws_logs_bucket}"
  config_logs_prefix = "config"
}
