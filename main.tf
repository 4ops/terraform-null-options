terraform {
  required_version = ">= 0.12"
}

locals {
  is_json = length(regexall(".json$", var.read_from)) > 0
  content = var.read_from != "" ? file(var.read_from) : ""
  parsed  = local.is_json ? jsondecode(local.content) : yamldecode(local.content)
  merged  = merge(local.parsed, var.override)
}
