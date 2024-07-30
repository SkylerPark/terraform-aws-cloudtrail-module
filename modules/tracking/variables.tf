variable "name" {
  description = "(필수) Trail 이름"
  type        = string
  nullable    = false
}

variable "s3_bucket_name" {
  description = "(필수) Trail 추적을 저장할 S3 버킷 이름."
  type        = string
  nullable    = false
}

variable "s3_key_prefix" {
  description = "(선택) Trail 추적을 저장할 S3 버킷 경로 이름."
  type        = string
  default     = ""
  nullable    = false
}

variable "is_multi_region" {
  description = "(선택) Trail Multi region 활성화 여부. Default: `false`"
  type        = bool
  default     = false
  nullable    = false
}

variable "log_file_validation_enabled" {
  description = "(선택) Trail Log 에 무결성 검증 활성화 여부. Default: `false`"
  type        = bool
  default     = false
  nullable    = false
}

variable "event_selector" {
  description = <<EOF
  (선택) 이벤트 로깅 활성화를 위한 이벤트 선택 설정. `event_selector` 블록내용.
    (선택) `data_resource` - 데이터 이벤트에 대한 블록 내용. `data_resource` 블록내용.
      (필수) `type` - 데이터 이벤트를 기록하려는 리소스 유형. 다음값만 지정 가능. `AWS::S3::Object`, `AWS::Lambda::Function`, `AWS::DynamoDB::Table`
      (필수) `values` - 데이터 리소스 감사 이벤트에 대한 ARN 목록.
    (선택) `include_management_events` - 트레일 관리 이벤트 포함 여부. Default: `true`.
    (선택) `exclude_management_event_sources` - 제외할 이벤트 소스 세트. 다음값만 지정 가능. `kms.amazonaws.com`, `rdsdata.amazonaws.com`.
    (선택) `read_write_type` - 기록할 이벤트 유형. 다음값만 지정 가능. `WriteOnly`, `ReadOnly`, `All`. Default: `All`.
  EOF
  type = list(object({
    include_management_events        = optional(bool, true)
    exclude_management_event_sources = optional(set(string), [])
    read_write_type                  = optional(string, "all")

    data_resource = optional(list(object({
      type   = optional(string, null)
      values = optional(set(string), [])
    })), [])
  }))

  default = []
}
