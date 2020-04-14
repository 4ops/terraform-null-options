locals {
  from_file = lookup({ for k, v in {
    options = var.read != "" ? yamldecode(file(var.read)) : null
  } : k => v if v != null }, "options", {})

  options = merge(local.from_file, var.override)
}
