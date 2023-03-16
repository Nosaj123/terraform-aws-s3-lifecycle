variable "bucket_name" {
  description = "Bucket Name"
  type        = string
  default     = "nosajsolomon-876" #Enter Bucket Name Here. Leaving blank will generate a default name
}

variable "region_name" {
  description = "Specify the region if needed"
  type        = string
  default     = ""
}
