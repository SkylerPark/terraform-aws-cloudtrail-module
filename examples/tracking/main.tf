locals {
  region = "ap-northeast-2"
}

module "tracking" {
  source = "../../modules/tracking"

  name = "parksm-test"

  s3_bucket_name = "tail-log"
  s3_key_prefix  = "parksm-live"

  is_multi_region             = true
  log_file_validation_enabled = true

  event_selector = [
    {
      "include_management_events" = true
      "read_write_type"           = "WriteOnly"
    }
  ]
}
