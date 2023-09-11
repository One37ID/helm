# Helm Chart Repository Test

## Add Helm Repositories

``` bash
# One37 ID Helm Charts
helm repo add fedoraman137 https://fedoraman137.github.io/helm-test
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

### Pull the chart to you local environment

In a working folder in your setup, download the complete chart and it template files.

```bash
helm pull fedoraman137/one37id-bcagent --untar
```

### One37 Licensing & Secrets

Update the 2 template files in `charts/one37secrets/templates/` with the values you where provided during the registration of the product.

### Configure the included 3rd Party packages

> OpenShift Note: <br/>
> The Redis & PostgreSQL components need to be installed using OpenShift certified Operators? The component folders should be removed from the `charts` folder and the Operators installed using the OpenShift console.

#### REDIS

This chart includes a default install of a replicated [Redis&reg;](https://github.com/bitnami/containers/tree/main/bitnami/redis) deployment using the Bitnami Redis sub-chart.
The `charts/redis/values.yaml` file includes the following parameters to configure the Redis&reg; installation:

##### Global parameters section

| Name                    | Description                                            | Value |
|-------------------------|--------------------------------------------------------|-------|
| `global.storageClass`   | Global StorageClass for Persistent Volume(s). You must configure this according to the available classes defined in the k8s environment.          | `""`  |
| `global.redis.password` | Global Redis&reg; password (overrides `auth.password`). Leave blank to have a random password generated and stored in a secret. | `""`  |

#### PostgreSQL

This chart includes a default install of a single instance [PostgreSQL](https://github.com/bitnami/containers/tree/main/bitnami/postgresql) as defined in the Bitnami postgresql sub-chart.
The `charts/postgresql/values.yaml` file includes the following parameters to configure the PostgreSQL installation:

##### Global parameters

| Name                    | Description                                            | Value |
|-------------------------|--------------------------------------------------------|-------|
| `global.storageClass`   | StorageClass for Persistent Volume(s). You must configure this according to the available classes defined in the k8s environment.          | `""`  |
| `global.postgresql.auth.postgresPassword` | 'postgres' user password override. Leave blank to have a random password generated and stored in a secret. | `""`  |

#### 3. Database Admin Tool [optional]

In non-production environments, you may want to manually install a database admin tool to simplify the process of managing your databases.

For more information please refer to the [bitnami/phpmyadmin](https://github.com/bitnami/containers/tree/main/bitnami/phpmyadmin) image documentation.

## One37 Component Configuration

Please refer to the chart **README** for additional component configuration parameter documentation.

 > **Note:** <br>
 > A local `values.yaml` file of instance specific parameters **MUST** be specified in your installation command

### One37 Business Studio&reg;

One [Business Studio&reg;](https://github.com/FedoraMan137/helm-test/tree/main/charts/one37id-studio) instance is required to manage all your locally deployed Business Connector Agents.

Edit the `charts/one37id-studio/values.yaml` file as required.

### Configure the One37 Business Connector&reg; (Agent)

The command deploys the [BusinessConnector&reg;](https://github.com/FedoraMan137/helm-test/tree/main/charts/one37id-bcagent) agent on the cluster.

Using values you where given by One37 Support during the registration of your product, edit the `charts/values.yaml` file

## Install the One37 Platform

```bash
helm upgrade --install -f values.yaml [RELEASE_NAME]  one37id-bcagent
```

 > **Note**: <br />
 > The [RELEASE_NAME] is the name you want to give to your installation. This name will be used to create and manage the Helm deployment.
 If this will be only unique instance of the One37 Platform, you can use the default name of `one37id-bcagent`

## Uninstallation

To uninstall/delete the `[RELEASE_NAME]` deployment:

``` bash
helm uninstall [RELEASE_NAME]
```

 > **Note**: <br />
 > This command removes ALL the Kubernetes components, including any data stores, associated with the chart and deletes the release.
