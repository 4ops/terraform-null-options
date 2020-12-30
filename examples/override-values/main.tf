terraform {
  required_version = ">= 0.12"
}

module "example" {
  source    = "4ops/options/null"
  version   = "1.1.0"

  read_from = "${path.root}/options.yaml"

  override = {
    test_array = [
      "override_1",
      "override_2",
    ]

    test_map = {
      test_key_1 = "override_1"
    }

    new_key = "new_value"
  }
}
