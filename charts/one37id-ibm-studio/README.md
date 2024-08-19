# One37 Business Studio package for IBM Cloud Kubernetes Service

v 2.2408.14-1

The One37 Business Studio is the web-based tool for the configuration and management of the One37 Business Connector agents.

## Introduction

This chart bootstraps a *Business Studio* deployment on an IBM [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It is available to execute as a simple Click & Configure installation through the IBM Cloud Catalog.

## Requirements

- IBM Cloud Kubernetes Service Cluster deployed  v1.19+
- PostgreSQL database. **

> ** The One37 Business Studio requires a PostgreSQL database instance to store its configuration data.
> One37 also provides a IBM Cloud Catalog item for easy deployment of a pre-configured PostgreSQL database instance.

## Installing the software from the IBM Cloud catalog

In IBM Cloud, you can configure your installation by using IBM Cloud Schematics, and after the installation is complete, you can view the chart instance, update the version, or uninstall from your Schematics workspace.

## Parameters

The following table lists the configurable parameters of the One37 Business Studio chart and their default values.
| Name               | Description                                                                  | Value                    |
|--------------------|------------------------------------------------------------------------------|--------------------------|
| `nameOverride`     | String to partially override the Kubernetes instance name.                   | "one37-ibm-studio"       |
| `fullnameOverride` | String to partially override the Kubernetes instance name.                   | "one37-ibm-studio"       |
| `tlsSecret`        | Name if the installed Ingress certificate secret to use for external access. | ""                       |
| `postgresName`     | Name if the installed Postgres database to use.                              | "one37id-pgsql"          |
| `studioHostname`   | Public Hostname for the service to use for external access. (Not URL)        | "ibm-studio.example.com" |

## Uninstalling the chart

Complete the following steps to uninstall a Helm Chart from your account.

1. Go to the **Menu** > **Schematics**.
2. Select your workspace name.
3. Click **Actions** > **Destroy resources**. All resources in your workspace are deleted.
4. Click **Update**.
5. To delete your workspace, click **Actions** > **Delete workspace**.

## License

Copyright &copy; 2023 One37 Solutions, Inc.
One37 Business Studio is licensed under the [One37 EULA]([Title](https://www.one37id.com/resources/BC-EULA.html)).

Portions of the codebase are licensed under the Apache 2.0 License. See [LICENSE]([Title](https://www.apache.org/licenses/LICENSE-2.0)) for details.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
