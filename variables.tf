variable "bucket_name" {
  description = "Bucket Name"
  type    = list(string)
  default = ["", "", ""]
}

variable "region_name" {
  description = "Specify the region if needed"
  type        = string
  default     = ""
}
