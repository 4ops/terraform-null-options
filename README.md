# Options

Simple options helper.

## Usage

example `config.yaml`:

```YAML
region: us-ewst-1
env: testing
name: test-cluster

nodes:
  - server-1
  - server-2
  - server-3
```

module syntax example:

```Terraform
module options {
  source  = "4ops/options/null"
  version = "1.1.0"
  read    = "path/to/config.yaml"

  override = {
    env  = "staging"
    name = "cluster-42"
  }
}
```

Merged config:

```
region = "us-ewst-1"
env    = "staging"
name   = "cluster-42"
nodes  = [
  "server-1"
  "server-2"
  "server-3"
]
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| override | Overrides options from YAML. | `any` | `{}` | no |
| read\_from | Path to options file (only `.yaml` format supported). | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| checksum | Checksum of merged options. |
| this | Merged options object. |

