variable "base64_encoded_dockerconfigjson" {
  type        = string
  description = "Base64 Encoded .dockerconfigjson."
  nullable    = false
  validation {
    condition     = can(base64decode(var.base64_encoded_dockerconfigjson))
    error_message = "Looks like you have not supplied a valid base64 encoded string."
  }
}

variable "namespaces" {
  type        = list(string)
  default     = ["*"]
  description = <<EOF
  List of namespaces to which the image pull secret must be added.
Supply a list containing just '*' (`["*"]` to add to all namespaces.
If `namespaces` has elements in common with `restricted_namespaces`, `restricted_namespaces` will take priority.
EOF
  nullable    = false
}

variable "restricted_namespaces" {
  type        = list(string)
  default     = ["kube-system", "default", "cert-manager"]
  description = <<EOF
  List of namespaces to which the image pull secret must NOT be added.
If `namespaces` has elements in common with `restricted_namespaces`, `restricted_namespaces` will take priority.
EOF
  nullable    = false
}

variable "secret_name" {
  type        = string
  description = "Name of the secret."
  nullable    = false
}