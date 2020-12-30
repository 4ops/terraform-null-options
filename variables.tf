variable "override" {
  type        = any
  default     = {}

  description = "Overrides options from YAML."
}

variable "read_from" {
  type        = string
  default     = ""

  description = "Path to options file (only `.yaml` format supported)."
}
