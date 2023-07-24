# One37 ID Base Environment

This chart sets up base configuration environment and is required before installing any individual One37 Platform component.

Before installation, make sure your CLI namespace is set to `default`

## Installation

``` bash
helm install one37-env fedoraman137/one37id-env
```

## Uninstalling the Chart

To uninstall/delete the `one37-env` deployment:
```bash
helm delete one37-env
```