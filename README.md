# Options

Simple options management tool

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
  version = "1.0.0"
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

More examples in [test](test) directory

## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| override | Options map | `any` | `{}` | no |
| read | Path to options file (.yaml) | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| this | Merged options |

