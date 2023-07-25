# Helm Chart Repository Test

## Add Helm Repositories

``` bash
# One37 ID Helm Charts
helm repo add fedoraman137 https://fedoraman137.github.io/helm-test
```

``` bash
# 3rd Party Helm Charts
# When deploying to Azure Kubernetes, use the official marketplace versions.
helm repo add azure-marketplace https://marketplace.azurecr.io/helm/v1/repo

helm repo update
```

``` bash
# List the charts available from One37
helm search repo fedoraman137
```

## Pre-Requisite Installation Steps

### Create One37 namespace

#### OpenShift

```bash
oc new-project one37 --display-name 'One37 Platform'
oc project one37
```

#### Other Kubernetes

``` bash
kubectl create namespace one37
kubectl config set-context --current --namespace=one37
```

## Install 3rd Party packages

> OpenShift Note: The Redis & PostgreSQL components need to be installed using OpenShift certified Operators

### REDIS

This chart bootstraps a [Redis&reg;](https://github.com/bitnami/containers/tree/main/bitnami/redis) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can also be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

#### Global parameters

| Name                    | Description                                            | Value |
|-------------------------|--------------------------------------------------------|-------|
| `global.storageClass`   | Global StorageClass for Persistent Volume(s)           | `""`  |
| `global.redis.password` | Global Redis&reg; password (overrides `auth.password`) | `""`  |

#### On AKS from the marketplace

``` bash
helm install one37-redis --set global.redis.password=secretpassword azure-marketplace/redis
```

#### Other K8s

``` bash
helm install one37-redis --set global.redis.password=secretpassword oci://registry-1.docker.io/bitnamicharts/redis
```

These commands set the specified password to be used when accessing the REDIS&reg; instance.

### PostgreSQL

This chart bootstraps a [PostgreSQL](https://github.com/bitnami/containers/tree/main/bitnami/postgresql) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.
For HA, please see [this repo](https://github.com/bitnami/charts/tree/main/bitnami/postgresql-ha)

#### On AKS from the Azure Marketplace

``` bash
helm install one37-pg --set auth.postgresPassword=secretpassword azure-marketplace/postgresql-ha
```

#### Other K8s

``` bash
helm install one37-pg --set auth.postgresPassword=secretpassword oci://registry-1.docker.io/bitnamicharts/postgresql-ha
```

The above command sets the PostgreSQL `postgres` account password to `secretpassword`.

> **NOTE:** Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

> **Warning** Setting a password will be ignored on new installation in case when previous PostgreSQL release was deleted through the helm command. In that case, old PVC will have an old password, and setting it through helm won't take effect. Deleting persistent volumes (PVs) will solve the issue. Refer to [issue 2061](https://github.com/bitnami/charts/issues/2061) for more details

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

``` bash
helm install one37-pg -f values.yaml bitnami/postgresql-ha
```

### 3. Database Admin Tool [optional]

For more information please refer to the [bitnami/phpmyadmin](https://github.com/bitnami/containers/tree/main/bitnami/phpmyadmin) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
helm install one37-dbadmin bitnami/phpmyadmin
```

## One37 Component Installation

### One37 Licensing & Secrets

``` bash
helm install one37-env fedoraman137/one37id-env
```

### One37 Mediator [optional]

If your users are using a *white labelled* **Upa! App**, you can run your own Mediator Service.

``` bash
helm install [my-mediator] fedoraman137/one37id-mediator
```

### One37 Business Studio&reg;

One [Business Studio&reg;](https://github.com/FedoraMan137/helm-test/tree/main/charts/one37id-studio) instance is required to manage all your locally deployed Business Connector Agents.

``` bash
helm install [my-studio] fedoraman137/one37id-studio
```

### One37 Business Connector&reg; (Agent)

The command deploys the [BusinessConnector&reg;](https://github.com/FedoraMan137/helm-test/tree/main/charts/one37id-bcagent) agent on the cluster.

Please refer to the chart **README** for configuration parameter documentation.

 > **Note:** A local `values.yaml` file of instance specific parameters **MUST** be specified in your installation command

Download the `values.yaml` template.

```bash
wget https://github.com/FedoraMan137/helm-test/raw/main/charts/one37id-bcagent/values.yaml
```

Edit the file as required.

```bash
helm install [AGENTNAME] -f values.yaml  fedoraman137/one37id-bcagent
```

## Uninstallation

### One37 Charts

``` bash
helm delete --purge [chart-name]
```

### 3rd Party Charts

#### PostgreSQL HA

```bash
helm delete --purge one37-pg
```

Additionally, if `persistence.resourcePolicy` is set to keep, you should manually delete the PVCs.

#### Redis

``` bash
helm delete --purge one37-redis
```
