# tracking

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.10 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_event_selector"></a> [event\_selector](#input\_event\_selector) | (선택) 이벤트 로깅 활성화를 위한 이벤트 선택 설정. `event_selector` 블록내용.<br>    (선택) `data_resource` - 데이터 이벤트에 대한 블록 내용. `data_resource` 블록내용.<br>      (필수) `type` - 데이터 이벤트를 기록하려는 리소스 유형. 다음값만 지정 가능. `AWS::S3::Object`, `AWS::Lambda::Function`, `AWS::DynamoDB::Table`<br>      (필수) `values` - 데이터 리소스 감사 이벤트에 대한 ARN 목록.<br>    (선택) `include_management_events` - 트레일 관리 이벤트 포함 여부. Default: `true`.<br>    (선택) `exclude_management_event_sources` - 제외할 이벤트 소스 세트. 다음값만 지정 가능. `kms.amazonaws.com`, `rdsdata.amazonaws.com`.<br>    (선택) `read_write_type` - 기록할 이벤트 유형. 다음값만 지정 가능. `WriteOnly`, `ReadOnly`, `All`. Default: `All`. | <pre>list(object({<br>    include_management_events        = optional(bool, true)<br>    exclude_management_event_sources = optional(set(string), [])<br>    read_write_type                  = optional(string, "all")<br><br>    data_resource = optional(list(object({<br>      type   = optional(string, null)<br>      values = optional(set(string), [])<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_is_multi_region"></a> [is\_multi\_region](#input\_is\_multi\_region) | (선택) Trail Multi region 활성화 여부. Default: `false` | `bool` | `false` | no |
| <a name="input_log_file_validation_enabled"></a> [log\_file\_validation\_enabled](#input\_log\_file\_validation\_enabled) | (선택) Trail Log 에 무결성 검증 활성화 여부. Default: `false` | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) Trail 이름 | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | (필수) Trail 추적을 저장할 S3 버킷 이름. | `string` | n/a | yes |
| <a name="input_s3_key_prefix"></a> [s3\_key\_prefix](#input\_s3\_key\_prefix) | (선택) Trail 추적을 저장할 S3 버킷 경로 이름. | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
