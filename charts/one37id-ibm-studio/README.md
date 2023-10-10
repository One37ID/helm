# One37 Business Studio package for IBM Cloud Kubernetes Service

v 2.2310.10-2

The One37 Business Studio is the web-based tool for the configuration and management
of the One37 Business Connector agents.

## Introduction

This chart bootstraps a [Business Studio v2]() deployment on an IBM [Kubernetes](https://kubernetes.io)
cluster using the [Helm](https://helm.sh) package manager.

It is available to execute as a simple Click & Configure installation through the
IBM Cloud Catalog.

## Requirements

- IBM Cloud Kubernetes Service Cluster deployed  v1.19+
- PostgreSQL database. This chart includes the necessary [Bitnami PostgreSQL]() charts and
- will automatically deploy pre-configured instance in your cluster.

Note: The One37 Business Connector agent mentioned above does not need to be installed
in the same cluster as the Business Studio unless you want to share the same database instance.

## Installing the software from the IBM Cloud catalog

In IBM Cloud, you can configure your installation by using IBM Cloud Schematics, and
after the installation is complete, you can view the chart instance, update the version,
or uninstall from your Schematics workspace.

## Parameters

### Sub-chart parameters

| Name                             | Description                                                                     | Value                            |
|----------------------------------|---------------------------------------------------------------------------------|----------------------------------|
| `postgresql.global.storageClass` | Select the StorageClass for the data Persistent Volume(s)                       | "ibmc-vpc-block-general-purpose" |

### Required parameters for the Business Studio

| Name                        | Description                                                                                 | Value              |
|-----------------------------|---------------------------------------------------------------------------------------------|--------------------|
| `fullnameOverride`          | String to partially override the Kubernetes instance name. Must be unique in each namespace | "one37-ibm-studio" |
| `ingress.secret.secretname` | String value of the name if the installed Ingress certificate to use for external access.   | ""                 |

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
