terraform {
  required_version = ">= 0.12"
}

module "example" {
  source    = "4ops/options/null"
  version   = "1.0.0"

  read_from = "${path.root}/options.yaml"
}
