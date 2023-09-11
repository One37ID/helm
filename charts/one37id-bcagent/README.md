# One37 Business Connector package for Kubernetes

The One37 Business Connector is Verifiable Credentials base data exchange platform.

## TL;DR

```bash
helm repo add fedoraman137 https://fedoraman137.github.io/helm-test
helm repo update
helm pull fedoraman137/one37id-bcagent
helm install [RELEASE_NAME] fedoraman137/one37id-bcagent -f values.yaml
```

## Introduction

This chart bootstraps a [Business Connector v1]() deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PostgreSQL database and Redis cache. You can use the included [Bitnami PostgreSQL]() and [Bitnami Redis]() charts to deploy them in your cluster.
- [Optional] Kubernetes Ingress Controller up and running in the cluster with optional external load balancer to auto-scalar support.

## Manually Installing the Chart

To install the chart with the release name `one37id-bcagent`:

```bash
git clone https://github.com/one37id/charts
cd charts
helm upgrade --install one37id-bcagent one37id-bcagent -f values.yaml
```

The command deploys the BusinessConnector Agent on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

## NOTE: These parameters MUST be edited in the `values.yaml` file before installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `one37id-bcagent` deployment:

```console
helm uninstall one37id-bcagent
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters (common to the PostgreSql & Redis charts)

| Name                      | Description                                            | Value |
| ------------------------- | ------------------------------------------------------ | ----- |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)           | `""`  |

### Required parameters for the BusinessConnector Agent

| Name                                  | Description                                                                                       | Value           |
| --------------------------------------| --------------------------------------------------------------------------------------------------| --------------- |
| `fullnameOverride`                    | String to fully override common.names.fullname template                                           | `""`            |
| `nameOverride`                        | String to partially override common.names.fullname template (will maintain the release name)      | `""`            |
| `secrets.app.WALLET_KEY`              | String value to use as a salt for the Wallet Encryption                                           | `""`            |
| `secrets.app.AGENT_NYM`               | Public DID (aka NYM) as registered on the ledger for this buisiness                               | `""`            |
| `secrets.app.STUDIO_CONTACT_ID`       | String value that identifies this Business. Generated during the registration process             | `""`            |
| `secrets.app.CONFIGURATION_SECRET_KEY`| Salt value for the encrpyted Agent Configuration data. Generated during the registration process  | `""`            |
| `secrets.app.STUDIO_RSA_PRIVATE_KEY`  | Configuration data transmission encryption key. Generated during the registration process         | `""`            |

## Installing the software from the IBM Cloud catalog

In IBM Cloud, you can configure your installation from the Create tab, and then install it with a single click instead of executing the Helm installation directly. Your Helm Chart is installed by using IBM Cloud Schematics, and after the installation is complete, you can view the chart instance, update the version, or uninstall from your Schematics workspace.

## Upgrading to a new version

When a new version of a Helm Chart is available, you're alerted in your Schematics workspace. To upgrade to a new version, complete the following steps:

1. Go to the **Menu** > **Schematics**.
2. Select your workspace name.
3. Click **Settings**. In the Summary section, your version number is displayed.
4. Click **Update**.
5. Select a version, and click **Update**.

## Uninstalling the software

Complete the following steps to uninstall a Helm Chart from your account.

1. Go to the **Menu** > **Schematics**.
2. Select your workspace name.
3. Click **Actions** > **Destroy resources**. All resources in your workspace are deleted.
4. Click **Update**.
5. To delete your workspace, click **Actions** > **Delete workspace**.

## License

Copyright &copy; 2023 One37 Solutions, Inc.

Portions of the codebase are licensed under the Apache 2.0 License. See [LICENSE](LICENSE) for details.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
