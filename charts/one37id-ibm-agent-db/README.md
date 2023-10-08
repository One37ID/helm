# One37 Business Connector package for IBM Cloud Kubernetes Service

The One37 Business Connector is a Verifiable Credentials exchange platform.

## Introduction

This chart bootstraps a [Business Connector v1.2]() deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It is available to execute as a simple Click & Configure installation through the IBM Cloud Catalog.

## Requirements

- IBM Cloud Kubernetes Service Cluster deployed  v1.19+
- PostgreSQL database and Redis cache. The chart includes [Bitnami PostgreSQL]() and [Bitnami Redis]() charts and will automatically deploy pre-configured instances of them in your cluster.
- At least one installed instance of the [One37 Business Studio](). This is also available as a Click & Configure installation through the IBM Cloud Catalog.

## Installing the software from the IBM Cloud catalog

In IBM Cloud, you can configure your installation by using IBM Cloud Schematics, and after the installation is complete, you can view the chart instance, update the version, or uninstall from your Schematics workspace.

## Parameters

### Global parameters (common to the included PostgreSql & Redis charts)

| Name                  | Description                                                                | Value |
|-----------------------|----------------------------------------------------------------------------|-------|
| `global.storageClass` | Select the preferred StorageClass to use for the data Persistent Volume(s) | `""`  |

### Required parameters for the BusinessConnector Agent

| Name                                   | Description                                                                                      | Value |
|----------------------------------------|--------------------------------------------------------------------------------------------------|-------|
| `fullnameOverride`                     | String to fully override the Kubernetes instance name. Must be unique in each namespace          | `""`  |
| `nameOverride`                         | String to partially override the Kubernetes instance name. Must be unique in each namespace      | `""`  |
| `environment.AGENT_NAME`               | String value to set the public name of the Agent                                                 | `""`  |
| `ingress.secret.secretname`            | String value of the name if the installed Ingress certificate to use for external access.        | `""`  |

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
