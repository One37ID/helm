# One37 Asset Access Secrets

This chart deploys secrets within the BusinessConnector namespace to support retrieval of the container image from the One37 private repository.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Manually Installing the Chart

To install the chart with the release name `one37secrets`:

```bash
git clone https://github.com/one37id/charts
cd charts
helm upgrade --install one37secrets one37secrets -f values.yaml
```

The command deploys the secrets on the Kubernetes cluster in the current namespace.
The [Parameters](#parameters) section lists the parameters that can be configured during installation.

 > NOTE: These parameters MUST be edited in the `values.yaml` file before installation.


## Uninstalling the Chart

To uninstall/delete the `one37secrets` deployment:

```console
helm uninstall one37secrets
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters (common to the PostgreSql & Redis charts)

| Name               | Description                                                               | Value |
| -------------------| --------------------------------------------------------------------------| ----- |
| `dockerconfigjson` | Base64 encoded dockeconfig json with Image repository access credentials  | `""`  |
| `tls.key`          | Base64 encoded TLS certificate key data                                   | `""`  |
| `tls.crt`          | Base64 encoded TLS certificate data                                       | `""`  |

## Installing the software from the IBM Cloud catalog

The chart will be installed as a dependency of the One37 Business Connector catalog app.

## License

Copyright &copy; 2023 One37 Solutions, Inc.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
