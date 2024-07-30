resource "aws_cloudtrail" "this" {
  name                       = var.name
  s3_bucket_name             = var.s3_bucket_name
  s3_key_prefix              = var.s3_key_prefix
  is_multi_region_trail      = var.is_multi_region
  enable_log_file_validation = var.log_file_validation_enabled

  dynamic "event_selector" {
    for_each = var.event_selector
    content {
      include_management_events        = event_selector.value.include_management_events
      read_write_type                  = event_selector.value.read_write_type
      exclude_management_event_sources = event_selector.value.exclude_management_event_sources

      dynamic "data_resource" {
        for_each = event_selector.value.data_resource
        content {
          type   = data_resource.value.type
          values = data_resource.value.values
        }
      }
    }
  }
}
