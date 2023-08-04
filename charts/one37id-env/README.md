# Helm Chart to define Base One37 Kubernetes environment

> This chart **MUST** be installed with a passed in `values.yaml` with edited properties.

Create a local `values.yaml` file with correct secret values:

``` yaml
namespace:
  create: false
  name: "one37id"

image:
  createSecret: true
  secretName: gitlab-auth
  user: ....
  password: ....
  repohost: ....
```

Install the chart:

```bash
helm install one37id-env one37/one37id-env -f values.yaml
```