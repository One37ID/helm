# Helm Chart Repository Test

## Add Repo

``` bash
helm repo add fedoraman137 https://fedoraman137.github.io/helm-test
helm repo update
helm search repo fedoraman137
```

## Pre-Requisite Installations

Start with the 3rd Party pre-requisites

### 1. REDIS

See bitnami/redis chart for full install configuration parameters
``` bash
helm install redis \
  --set auth.password=secretpassword \
    fedoraman137/redis
```
The above command sets the Redis&reg; server password to `secretpassword`.

### 2. PostgreSQL
This chart bootstraps a [PostgreSQL](https://github.com/bitnami/containers/tree/main/bitnami/postgresql) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.
For HA, please see [this repo](https://github.com/bitnami/charts/tree/main/bitnami/postgresql-ha)

``` bash
helm install postgres \
  --set auth.postgresPassword=secretpassword
    fedoraman137/postgresql
```

The above command sets the PostgreSQL `postgres` account password to `secretpassword`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.
> **Warning** Setting a password will be ignored on new installation in case when previous Posgresql release was deleted through the helm command. In that case, old PVC will have an old password, and setting it through helm won't take effect. Deleting persistent volumes (PVs) will solve the issue. Refer to [issue 2061](https://github.com/bitnami/charts/issues/2061) for more details

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

``` bash
helm install postgres -f values.yaml fedoraman137/postgresql
```

### 3. Database Admin Tool [optional]
For more information please refer to the [bitnami/phpmyadmin](https://github.com/bitnami/containers/tree/main/bitnami/phpmyadmin) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
helm install dbadmin fedoraman137/phpmyadmin
```

The above command sets the phpMyAdmin to connect to a database in `postgres` host and `5432` port respectively.

## One37 Component Installation.

### 1. One37 Namespaces & Secrets

``` bash
helm install one37-env fedoraman137/one37id-env
```

### 4. One37 Mediator [optional]

``` bash
helm install [my-mediator] fedoraman137/one37id-mediator
```

### 5. One37 Business Studio
This chart bootstraps a [Business Studio]() deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

``` bash
helm install [my-studio] fedoraman137/one37id-studio
```

### 6. One37 Business Connector (Agent)
This chart bootstraps a [Business Connector]() deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

The command deploys the BusinessConnector Agent on the Kubernetes cluster. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

## NOTE: Parameters MUST be edited and specified in your `values.yaml` file before installation.
```bash
helm install [AGENTNAME] -f values.yaml  fedoraman137/one37id-bcagent
```
