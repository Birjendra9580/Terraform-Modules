variable "bucket_name" {
    description = "Provide the bucket name"
    type        = string
}

variable "force_destroy" {
    description = "Allow bucket deletion even if it contains objects"
    type        = bool
    default     = false 
}

variable "versioning_enabled" {
    description = "Enable versioning for s3 bucket"
    type        = bool
    default     = true
}

variable "encryption_type" {
    description = "Encryption type (AES256 or aws:kms)"
    type        = string
    default     = "AES256"
}

variable "kms_key_id" {
    description = "KMS key ID if using aws kms"
    type        = bool
    default     = null
}

variable "block_public_access" {
    description = "Block all public access"
    type        = bool
    default     = true
}

variable "lifecycle_rules" {
    description = "Lifecycle for s3 buckets"
    type        = list(object({
      id              = string
      enabled         = bool
      prefix          = string
      expiration_days = number
    }))
    default = []  
}

variable "logging" {
    description = "Enable access logging"
    type = object({
      target_bucket = string
      target_prefix = string
    })
    default = null
}

variable "bucket_policy" {
    description = "backet policy in json"
    type        = string
    default     = null
}

variable "tags" {
    description = "Tags for s3 bucket"
    type        = map(string)
}

