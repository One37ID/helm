# One37 Business Connector Controller package for IBM Cloud Kubernetes Service

v 2.2408.22-1

The One37 Business Connector is a Verifiable Credentials exchange platform.

## Introduction

This chart bootstraps a **Business Connector Controller** deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

This chart should not be used in isolation. It is designed to be called as a subchart from the One37 Business Connector JS chart. The Business Connector JS chart will install the Business Connector Controller as a dependency.

## Requirements

- IBM Cloud Kubernetes Service Cluster deployed  v1.19+
- PostgreSQL database
- Redis cache
- One37 Business Studio

> These are available as a Click & Configure installations through the IBM Cloud Catalog.

## Installing the software from the IBM Cloud catalog

In IBM Cloud, you can configure your installation by using IBM Cloud Schematics, and after the installation is complete, you can view the chart instance, update the version, or uninstall from your Schematics workspace.

## Parameters

The following table lists the configurable parameters of the One37 Business Connector chart and their default values.

| Name                     | Description                                                                               | Value                            |
|--------------------------|-------------------------------------------------------------------------------------------|----------------------------------|
| `nameOverride`           | String to partially override the Kubernetes instance name.                                | "one37-bc-ctrl"                |
| `tlsSecret`              | Provide the name of the secret for installed TLS Certificate to use for external access.  | "__NOT_SET__"                    |
| `agentHostname`          | Provide the public DNS host name where the service will be accessed. (Not a URL)          | "__NOT_SET__"          |
| `postgresName`           | Instance Name of the installed PostgreSQL database chart                                  | "one37id-pgsql"                  |
| `redisName`              | Instance Name of the installed REDIS database chart                                       | "one37id-redis"                  |
| `environment.AGENT_NAME` | String value to set the public name of the Agent                                          | "__NOT_SET__"                    |
| `volume.storageClass`    | Select the StorageClass for the App Persistent Volume                                     | "ibmc-vpc-block-general-purpose" |

## Upgrading to a new version

When a new version of a Helm Chart is available, you're alerted in your Schematics workspace.

To upgrade to a new version, complete the following steps:

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

Copyright &copy; 2024 One37 Solutions, Inc.

[LICENSE](https://raw.githubusercontent.com/One37ID/helm-ibm/main/LICENSE.md)

Portions of the codebase are licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
