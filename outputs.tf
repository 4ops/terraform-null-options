output "this" {
  value       = local.merged
  description = "Merged options object."
}

output "checksum" {
  value       = sha256(yamlencode(local.merged))
  description = "Checksum of merged options."
}
