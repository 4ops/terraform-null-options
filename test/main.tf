# --- No file

module test_no_read {
  source = "../"
  override = {
    test_key = "no_read"
  }
}

output test_no_read {
  value = module.test_no_read.this
}

# --- Default file

module test_default {
  source = "../"
  read   = "${path.root}/default.yaml"
}

output test_default {
  value = module.test_default.this
}

# --- Override simple

module test_override_simple {
  source = "../"
  read   = "${path.root}/default.yaml"

  override = {
    test_key = "custom_value"
  }
}

output test_override_simple {
  value = module.test_override_simple.this
}

# --- Override collections

module test_override_collections {
  source = "../"
  read   = "${path.root}/collections.yaml"

  override = {
    custom_array = [
      "custom_value_1",
      "custom_value_2",
    ]

    test_array = [
      "custom_value_1",
      "custom_value_2",
    ]

    test_map = {
      custom_key_1 = "custom_value_1"
    }
  }
}

output test_override_collections {
  value = module.test_override_collections.this
}
