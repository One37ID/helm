# PostgreSQL Database instance installer for One37 Trust Platform

 | Note:  Targeting IBM Cloud Kubernetes Service

## Introduction

This chart deploys the latest Bitnami v12.x [PostgreSQL]() chart on
 [IBM Kubernetes Service](https://cloud.ibm.com/kubernetes/clusters) that is pre-configured for use by the [One37 Trust Platform]() components.

It is available to execute as a simple Click & Configure installation through the
IBM Cloud Catalog.

## Requirements

- IBM Cloud Kubernetes Service Cluster deployed  v1.19+

> Note:
> Take note of the **instance name** used as this will
> need to be provided when installing the *One37 Business Connector agent*
> or *One37 Business Studio* using this instance.
> Multiple Business Connector agents can be installed using the same database server.

## Installing the software from the IBM Cloud catalog

In IBM Cloud, you can configure your installation by using IBM Cloud Schematics, and
after the installation is complete, you can view the chart instance, update the version,
or uninstall from your Schematics workspace.

## Parameters

### Sub-chart parameters

| Name                             | Description                                                                           | Value                            |
|----------------------------------|---------------------------------------------------------------------------------------|----------------------------------|
| `postgresql.global.storageClass` | Select the StorageClass for the data Persistent Volume(s)                             | "ibmc-vpc-block-general-purpose" |
| `postgresql.fullnameOverride`    | String to fully override the deployed instance name. Must be unique in each namespace | "one37id-pgsql"                  |
| `postgresql.nameOverride`        | same as above                                                                         | "one37id-pgsql"                  |

## Uninstalling the chart

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
