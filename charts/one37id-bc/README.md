# One37 Business Connector JS package for IBM Cloud Kubernetes Service

v 2.2408.22

The One37ID Business Connector is a Verifiable Credentials exchange platform.

## Introduction

This chart bootstraps a [Business Connector v2]() deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It is available to execute as a simple Click & Configure installation through the IBM Cloud Catalog.

It will also deploy the following sub-charts:
 - one37id-ibm-agent

## Requirements

- IBM Cloud Kubernetes Service Cluster deployed  v1.19+
- PostgreSQL database and Redis cache. **
- A valid TLS certificate, configured as a secret, for the Agent and Controller services.
- At least one instance of the _**One37 Business Studio**_ must be installed to manage this Agent. **

> The provided PostgreSQL and Redis catalog charts are not configured for high-availability or disaster recovery. Please consult the documentation for those charts to configure them for your specific needs.

## Installing the software from the IBM Cloud catalog

In IBM Cloud, you can configure your installation by using IBM Cloud Schematics, and after the installation is complete, you can view the chart instance, update the version, or uninstall from your Schematics workspace.

## Parameters

The following table lists the configurable parameters of the One37 Business Connector chart and their default values.

| Name                            | Description                                                                              | Value                            |
|---------------------------------|------------------------------------------------------------------------------------------|----------------------------------|
| `nameOverride`                  | Name to use for the Business Connector Kubernetes instance.                              | "one37id-bc"                     |
| `agentHostname`                 | Public DNS host name where the Business Connector services will be accessed. (Not a URL) | "agent.example.com"              |
| `one37id-bc-ctrl.nameOverride`  | Name to use for the Controller Kubernetes instance.                                      | "one37id-bc-ctrl"                |
| `one37id-bc-ctrl.agentHostname` | Public DNS host name where the Controller services will be accessed. (Not a URL)         | "agent-ctrl.example.com"         |
| `global.tlsSecret`              | Name if the Secret for installed TLS Certificate to use.                                 | "__NOT_SET__"                    |
| `global.postgresName`           | Instance Name of the installed PostgreSQL database chart                                 | "one37id-pgsql"                  |
| `global.redisName`              | Instance Name of the installed REDIS database chart                                      | "one37id-redis"                  |
| `volume.storageClass`           | Select the StorageClass for the App Persistent Volume                                    | "ibmc-vpc-block-general-purpose" |
| `configmap.SMTP_HOST`           | The SMTP server HOST to use when sending Email verification messages                     | "__NOT_SET__"                    |
| `configmap.SMTP_PORT`           | The SMTP server PORT to use when sending Email verification messages                     | "__NOT_SET__"                    |
| `configmap.EMAIL_FROM`          | The SMTP FROM address to use when sending Email verification messages                    | "__NOT_SET__"                    |
| `configmap.SMTP_USER`           | The SMTP authentication USER ACCOUNT to use when sending Email verification messages     | "__NOT_SET__"                    |
| `secrets.app.SMTP_PSWD`         | The SMTP account password                                                                | "__NOT_SET__"                    |
| `secrets.app.DB_ENCRYPTION_KEY` | The Wallet Encryption Key                                                                | "__NOT_SET__"                    |
| `environment.ALIAS_REALM`       | The REALM to which user ALIASES will be associated. See Docs.                            | "com.example"                    |
| `environment.LINKED_DOMAIN`     | Full URL of the Business Connector Agent service.                                        | "__NOT_SET__"                    |
| `environment.LOG_LEVEL`         | 'debug', 'information', 'warning'                                                        | "debug"                          |

ALIAS_REALM

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
