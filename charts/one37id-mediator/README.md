<!--- app-name: one37id-mediator -->

# One37ID package for Aries Mediator DotNet

The One37 Mediator is an open source, advanced store and forward handler to intermediate between Aries based Agents and connected edge wallets. 

## TL;DR


```bash
git clone https://github.com/one37id/charts
cd charts
helm install mediator one37id-mediator
```

## Introduction

This chart bootstraps a [Mediator]() deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

One37 charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

[Mediator Helm Chart]() will deploy a auto-scalable Mediator.

The main features of the chart are the following:

| Single Instance Mediator                               | Scaled Out Mediator Cluster                                            |
|--------------------------------------------------------|------------------------------------------------------------------------|
| Single instance for smaller volume                     | Multiple instances for higher processing volume                        |
| ![Mediator Topology](img/mediator-single.png)          | ![Mediator Cluster Topology](img/mediator-scaled.png)                  |


## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- Pre installed PostgreSQL database and Redis cache. You can use the [One37ID PostgreSQL]() and [One37ID Redis]() charts to deploy them in your cluster.
- [Optional] Kubernetes Ingress Controller up and running in the cluster with optional external load balancer to auto-scalar support. 

## Installing the Chart

To install the chart with the release name `mediator`:

```bash
git clone https://github.com/one37id/charts
cd charts
helm install mediator one37id-mediator
```

The command deploys Mediator on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation. These parameters can be edited in the `values.yaml` file before installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `mediator` deployment:

```console
helm delete mediator
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

<!-- TODO - replace with actual params -->

| Name                      | Description                                            | Value |
| ------------------------- | ------------------------------------------------------ | ----- |
| `global.imageRegistry`    | Global Docker image registry                           | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array        | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)           | `""`  |
| `global.Mediatorword`     | Global Mediator password (overrides `auth.password`)   | `""`  |

### Common parameters

| Name                      | Description                                                                                                    | Value           |
| ------------------------- | -------------------------------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`             | Override Kubernetes version                                                                                    | `""`            |
| `nameOverride`            | String to partially override common.names.fullname                                                             | `""`            |

### Mediator Image parameters

| Name                | Description                                                                           | Value                  |
| ------------------- | ------------------------------------------------------------------------------------- | ---------------------- |
| `image.registry`    | Mediator image registry                                                               | `docker.io`            |
| `image.repository`  | Mediator image repository                                                             | `bitnami/Mediator      |
| `image.tag`         | Mediator image tag (immutable tags are recommended)                                   | `latest`               |
| `image.pullPolicy`  | Mediator image pull policy                                                            | `IfNotPresent`         |
| `image.debug`       | Enable image debug mode                                                               | `false`                |




### Mediator replicas configuration parameters

| Name                                                  | Description                                                                                             | Value                    |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------ |
| `replica.replicaCount`                                | Number of Mediator replicas to deploy                                                                 | `3`                      |
| `replica.configuration`                               | Configuration for Mediator replicas nodes                                                             | `""`                     |
| `replica.disableCommands`                             | Array with Mediator commands to disable on replicas nodes                                             | `["FLUSHDB","FLUSHALL"]` |
| `replica.command`                                     | Override default container command (useful when using custom images)                                    | `[]`                     |
| `replica.args`                                        | Override default container args (useful when using custom images)                                       | `[]`                     |
| `replica.preExecCmds`                                 | Additional commands to run prior to starting Mediator replicas                                        | `[]`                     |
| `replica.extraFlags`                                  | Array with additional command line flags for Mediator replicas                                        | `[]`                     |
| `replica.extraEnvVars`                                | Array with extra environment variables to add to Mediator replicas nodes                              | `[]`                     |
| `replica.extraEnvVarsCM`                              | Name of existing ConfigMap containing extra env vars for Mediator replicas nodes                      | `""`                     |
| `replica.extraEnvVarsSecret`                          | Name of existing Secret containing extra env vars for Mediator replicas nodes                         | `""`                     |
| `replica.externalMaster.enabled`                      | Use external master for bootstrapping                                                                   | `false`                  |
| `replica.externalMaster.host`                         | External master host to bootstrap from                                                                  | `""`                     |
| `replica.externalMaster.port`                         | Port for Mediatorice external master host                                                             | `6379`                   |
| `replica.containerPorts.Mediator                    | Container port to open on Mediator replicas nodes                                                     | `6379`                   |
| `replica.startupProbe.enabled`                        | Enable startupProbe on Mediator replicas nodes                                                        | `true`                   |
| `replica.startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                                  | `10`                     |
| `replica.startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                                         | `10`                     |
| `replica.startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                                        | `5`                      |
| `replica.startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                                      | `22`                     |
| `replica.startupProbe.successThreshold`               | Success threshold for startupProbe                                                                      | `1`                      |
| `replica.livenessProbe.enabled`                       | Enable livenessProbe on Mediator replicas nodes                                                       | `true`                   |
| `replica.livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                                 | `20`                     |
| `replica.livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                                        | `5`                      |
| `replica.livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                                       | `5`                      |
| `replica.livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                                     | `5`                      |
| `replica.livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                                     | `1`                      |
| `replica.readinessProbe.enabled`                      | Enable readinessProbe on Mediator replicas nodes                                                      | `true`                   |
| `replica.readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                                | `20`                     |
| `replica.readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                                       | `5`                      |
| `replica.readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                                      | `1`                      |
| `replica.readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                                    | `5`                      |
| `replica.readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                                    | `1`                      |
| `replica.customStartupProbe`                          | Custom startupProbe that overrides the default one                                                      | `{}`                     |
| `replica.customLivenessProbe`                         | Custom livenessProbe that overrides the default one                                                     | `{}`                     |
| `replica.customReadinessProbe`                        | Custom readinessProbe that overrides the default one                                                    | `{}`                     |
| `replica.resources.limits`                            | The resources limits for the Mediator replicas containers                                             | `{}`                     |
| `replica.resources.requests`                          | The requested resources for the Mediator replicas containers                                          | `{}`                     |
| `replica.podSecurityContext.enabled`                  | Enabled Mediator replicas pods' Security Context                                                      | `true`                   |
| `replica.podSecurityContext.fsGroup`                  | Set Mediator replicas pod's Security Context fsGroup                                                  | `1001`                   |
| `replica.containerSecurityContext.enabled`            | Enabled Mediator replicas containers' Security Context                                                | `true`                   |
| `replica.containerSecurityContext.runAsUser`          | Set Mediator replicas containers' Security Context runAsUser                                          | `1001`                   |
| `replica.schedulerName`                               | Alternate scheduler for Mediator replicas pods                                                        | `""`                     |
| `replica.updateStrategy.type`                         | Mediator replicas statefulset strategy type                                                           | `RollingUpdate`          |
| `replica.minReadySeconds`                             | How many seconds a pod needs to be ready before killing the next, during update                         | `0`                      |
| `replica.priorityClassName`                           | Mediator replicas pods' priorityClassName                                                             | `""`                     |
| `replica.podManagementPolicy`                         | podManagementPolicy to manage scaling operation of %%MAIN_CONTAINER_NAME%% pods                         | `""`                     |
| `replica.hostAliases`                                 | Mediator replicas pods host aliases                                                                   | `[]`                     |
| `replica.podLabels`                                   | Extra labels for Mediator replicas pods                                                               | `{}`                     |
| `replica.podAnnotations`                              | Annotations for Mediator replicas pods                                                                | `{}`                     |
| `replica.shareProcessNamespace`                       | Share a single process namespace between all of the containers in Mediator replicas pods              | `false`                  |
| `replica.podAffinityPreset`                           | Pod affinity preset. Ignored if `replica.affinity` is set. Allowed values: `soft` or `hard`             | `""`                     |
| `replica.podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `replica.affinity` is set. Allowed values: `soft` or `hard`        | `soft`                   |
| `replica.nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `replica.affinity` is set. Allowed values: `soft` or `hard`       | `""`                     |
| `replica.nodeAffinityPreset.key`                      | Node label key to match. Ignored if `replica.affinity` is set                                           | `""`                     |
| `replica.nodeAffinityPreset.values`                   | Node label values to match. Ignored if `replica.affinity` is set                                        | `[]`                     |
| `replica.affinity`                                    | Affinity for Mediator replicas pods assignment                                                        | `{}`                     |
| `replica.nodeSelector`                                | Node labels for Mediator replicas pods assignment                                                     | `{}`                     |
| `replica.tolerations`                                 | Tolerations for Mediator replicas pods assignment                                                     | `[]`                     |
| `replica.topologySpreadConstraints`                   | Spread Constraints for Mediator replicas pod assignment                                               | `[]`                     |
| `replica.dnsPolicy`                                   | DNS Policy for Mediator replica pods                                                                  | `""`                     |
| `replica.dnsConfig`                                   | DNS Configuration for Mediator replica pods                                                           | `{}`                     |
| `replica.lifecycleHooks`                              | for the Mediator replica container(s) to automate configuration before or after startup               | `{}`                     |
| `replica.extraVolumes`                                | Optionally specify extra list of additional volumes for the Mediator replicas pod(s)                  | `[]`                     |
| `replica.extraVolumeMounts`                           | Optionally specify extra list of additional volumeMounts for the Mediator replicas container(s)       | `[]`                     |
| `replica.sidecars`                                    | Add additional sidecar containers to the Mediator replicas pod(s)                                     | `[]`                     |
| `replica.initContainers`                              | Add additional init containers to the Mediator replicas pod(s)                                        | `[]`                     |

### Mediator Sentinel configuration parameters

| Name                                          | Description                                                                                                                                 | Value                    |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `sentinel.enabled`                            | Use Mediator Sentinel on Mediator pods.                                                                                                 | `false`                  |
| `sentinel.image.registry`                     | Mediator Sentinel image registry                                                                                                          | `docker.io`              |
| `sentinel.image.repository`                   | Mediator Sentinel image repository                                                                                                        | `bitnami/Mediatorinel` |
| `sentinel.image.tag`                          | Mediator Sentinel image tag (immutable tags are recommended)                                                                              | `7.0.11-debian-11-r18`   |
| `sentinel.image.digest`                       | Mediator Sentinel image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                         | `""`                     |
| `sentinel.image.pullPolicy`                   | Mediator Sentinel image pull policy                                                                                                       | `IfNotPresent`           |
| `sentinel.image.pullSecrets`                  | Mediator Sentinel image pull secrets                                                                                                      | `[]`                     |
| `sentinel.image.debug`                        | Enable image debug mode                                                                                                                     | `false`                  |
| `sentinel.annotations`                        | Additional custom annotations for Mediator Sentinel resource                                                                              | `{}`                     |
| `sentinel.masterSet`                          | Master set name                                                                                                                             | `mymaster`               |
| `sentinel.quorum`                             | Sentinel Quorum                                                                                                                             | `2`                      |
| `sentinel.getMasterTimeout`                   | Amount of time to allow before get_sentinel_master_info() times out.                                                                        | `220`                    |
| `sentinel.automateClusterRecovery`            | Automate cluster recovery in cases where the last replica is not considered a good replica and Sentinel won't automatically failover to it. | `false`                  |
| `sentinel.MediatorownWaitFailover`          | Whether the Mediator master container waits for the failover at shutdown (in addition to the Mediator Sentinel container).              | `true`                   |
| `sentinel.downAfterMilliseconds`              | Timeout for detecting a Mediator node is down                                                                                             | `60000`                  |
| `sentinel.failoverTimeout`                    | Timeout for performing a election failover                                                                                                  | `180000`                 |
| `sentinel.parallelSyncs`                      | Number of replicas that can be reconfigured in parallel to use the new master after a failover                                              | `1`                      |
| `sentinel.configuration`                      | Configuration for Mediator Sentinel nodes                                                                                                 | `""`                     |
| `sentinel.command`                            | Override default container command (useful when using custom images)                                                                        | `[]`                     |
| `sentinel.args`                               | Override default container args (useful when using custom images)                                                                           | `[]`                     |
| `sentinel.preExecCmds`                        | Additional commands to run prior to starting Mediator Sentinel                                                                            | `[]`                     |
| `sentinel.extraEnvVars`                       | Array with extra environment variables to add to Mediator Sentinel nodes                                                                  | `[]`                     |
| `sentinel.extraEnvVarsCM`                     | Name of existing ConfigMap containing extra env vars for Mediator Sentinel nodes                                                          | `""`                     |
| `sentinel.extraEnvVarsSecret`                 | Name of existing Secret containing extra env vars for Mediator Sentinel nodes                                                             | `""`                     |
| `sentinel.externalMaster.enabled`             | Use external master for bootstrapping                                                                                                       | `false`                  |
| `sentinel.externalMaster.host`                | External master host to bootstrap from                                                                                                      | `""`                     |
| `sentinel.externalMaster.port`                | Port for Mediatorice external master host                                                                                                 | `6379`                   |
| `sentinel.containerPorts.sentinel`            | Container port to open on Mediator Sentinel nodes                                                                                         | `26379`                  |
| `sentinel.startupProbe.enabled`               | Enable startupProbe on Mediator Sentinel nodes                                                                                            | `true`                   |
| `sentinel.startupProbe.initialDelaySeconds`   | Initial delay seconds for startupProbe                                                                                                      | `10`                     |
| `sentinel.startupProbe.periodSeconds`         | Period seconds for startupProbe                                                                                                             | `10`                     |
| `sentinel.startupProbe.timeoutSeconds`        | Timeout seconds for startupProbe                                                                                                            | `5`                      |
| `sentinel.startupProbe.failureThreshold`      | Failure threshold for startupProbe                                                                                                          | `22`                     |
| `sentinel.startupProbe.successThreshold`      | Success threshold for startupProbe                                                                                                          | `1`                      |
| `sentinel.livenessProbe.enabled`              | Enable livenessProbe on Mediator Sentinel nodes                                                                                           | `true`                   |
| `sentinel.livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe                                                                                                     | `20`                     |
| `sentinel.livenessProbe.periodSeconds`        | Period seconds for livenessProbe                                                                                                            | `10`                     |
| `sentinel.livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe                                                                                                           | `5`                      |
| `sentinel.livenessProbe.failureThreshold`     | Failure threshold for livenessProbe                                                                                                         | `6`                      |
| `sentinel.livenessProbe.successThreshold`     | Success threshold for livenessProbe                                                                                                         | `1`                      |
| `sentinel.readinessProbe.enabled`             | Enable readinessProbe on Mediator Sentinel nodes                                                                                          | `true`                   |
| `sentinel.readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe                                                                                                    | `20`                     |
| `sentinel.readinessProbe.periodSeconds`       | Period seconds for readinessProbe                                                                                                           | `5`                      |
| `sentinel.readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe                                                                                                          | `1`                      |
| `sentinel.readinessProbe.failureThreshold`    | Failure threshold for readinessProbe                                                                                                        | `6`                      |
| `sentinel.readinessProbe.successThreshold`    | Success threshold for readinessProbe                                                                                                        | `1`                      |
| `sentinel.customStartupProbe`                 | Custom startupProbe that overrides the default one                                                                                          | `{}`                     |
| `sentinel.customLivenessProbe`                | Custom livenessProbe that overrides the default one                                                                                         | `{}`                     |
| `sentinel.customReadinessProbe`               | Custom readinessProbe that overrides the default one                                                                                        | `{}`                     |
| `sentinel.persistence.enabled`                | Enable persistence on Mediator sentinel nodes using Persistent Volume Claims (Experimental)                                               | `false`                  |
| `sentinel.persistence.storageClass`           | Persistent Volume storage class                                                                                                             | `""`                     |
| `sentinel.persistence.accessModes`            | Persistent Volume access modes                                                                                                              | `["ReadWriteOnce"]`      |
| `sentinel.persistence.size`                   | Persistent Volume size                                                                                                                      | `100Mi`                  |
| `sentinel.persistence.annotations`            | Additional custom annotations for the PVC                                                                                                   | `{}`                     |
| `sentinel.persistence.labels`                 | Additional custom labels for the PVC                                                                                                        | `{}`                     |
| `sentinel.persistence.selector`               | Additional labels to match for the PVC                                                                                                      | `{}`                     |
| `sentinel.persistence.dataSource`             | Custom PVC data source                                                                                                                      | `{}`                     |
| `sentinel.persistence.medium`                 | Provide a medium for `emptyDir` volumes.                                                                                                    | `""`                     |
| `sentinel.persistence.sizeLimit`              | Set this to enable a size limit for `emptyDir` volumes.                                                                                     | `""`                     |
| `sentinel.resources.limits`                   | The resources limits for the Mediator Sentinel containers                                                                                 | `{}`                     |
| `sentinel.resources.requests`                 | The requested resources for the Mediator Sentinel containers                                                                              | `{}`                     |
| `sentinel.containerSecurityContext.enabled`   | Enabled Mediator Sentinel containers' Security Context                                                                                    | `true`                   |
| `sentinel.containerSecurityContext.runAsUser` | Set Mediator Sentinel containers' Security Context runAsUser                                                                              | `1001`                   |
| `sentinel.lifecycleHooks`                     | for the Mediator sentinel container(s) to automate configuration before or after startup                                                  | `{}`                     |
| `sentinel.extraVolumes`                       | Optionally specify extra list of additional volumes for the Mediator Sentinel                                                             | `[]`                     |
| `sentinel.extraVolumeMounts`                  | Optionally specify extra list of additional volumeMounts for the Mediator Sentinel container(s)                                           | `[]`                     |
| `sentinel.service.type`                       | Mediator Sentinel service type                                                                                                            | `ClusterIP`              |
| `sentinel.service.ports.Mediator            | Mediator service port for Mediator                                                                                                      | `6379`                   |
| `sentinel.service.ports.sentinel`             | Mediator service port for Mediator Sentinel                                                                                             | `26379`                  |
| `sentinel.service.nodePorts.Mediator        | Node port for Mediator                                                                                                                    | `""`                     |
| `sentinel.service.nodePorts.sentinel`         | Node port for Sentinel                                                                                                                      | `""`                     |
| `sentinel.service.externalTrafficPolicy`      | Mediator Sentinel service external traffic policy                                                                                         | `Cluster`                |
| `sentinel.service.extraPorts`                 | Extra ports to expose (normally used with the `sidecar` value)                                                                              | `[]`                     |
| `sentinel.service.clusterIP`                  | Mediator Sentinel service Cluster IP                                                                                                      | `""`                     |
| `sentinel.service.loadBalancerIP`             | Mediator Sentinel service Load Balancer IP                                                                                                | `""`                     |
| `sentinel.service.loadBalancerSourceRanges`   | Mediator Sentinel service Load Balancer sources                                                                                           | `[]`                     |
| `sentinel.service.annotations`                | Additional custom annotations for Mediator Sentinel service                                                                               | `{}`                     |
| `sentinel.service.sessionAffinity`            | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                                        | `None`                   |
| `sentinel.service.sessionAffinityConfig`      | Additional settings for the sessionAffinity                                                                                                 | `{}`                     |
| `sentinel.service.headless.annotations`       | Annotations for the headless service.                                                                                                       | `{}`                     |
| `sentinel.terminationGracePeriodSeconds`      | Integer setting the termination grace period for the Mediator pods                                                                        | `30`                     |



### Metrics Parameters

| Name                                         | Description                                                                                                         | Value                    |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `metrics.enabled`                            | Start a sidecar prometheus exporter to expose Mediator metrics                                                    | `false`                  |
| `metrics.image.registry`                     | Mediator Exporter image registry                                                                                  | `docker.io`              |
| `metrics.image.repository`                   | Mediator Exporter image repository                                                                                | `bitnami/Mediatorrter` |
| `metrics.image.tag`                          | Mediator Exporter image tag (immutable tags are recommended)                                                      | `1.50.0-debian-11-r21`   |
| `metrics.image.digest`                       | Mediator Exporter image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                     |
| `metrics.image.pullPolicy`                   | Mediator Exporter image pull policy                                                                               | `IfNotPresent`           |
| `metrics.image.pullSecrets`                  | Mediator Exporter image pull secrets                                                                              | `[]`                     |
| `metrics.startupProbe.enabled`               | Enable startupProbe on Mediator replicas nodes                                                                    | `false`                  |
| `metrics.startupProbe.initialDelaySeconds`   | Initial delay seconds for startupProbe                                                                              | `10`                     |
| `metrics.startupProbe.periodSeconds`         | Period seconds for startupProbe                                                                                     | `10`                     |
| `metrics.startupProbe.timeoutSeconds`        | Timeout seconds for startupProbe                                                                                    | `5`                      |
| `metrics.startupProbe.failureThreshold`      | Failure threshold for startupProbe                                                                                  | `5`                      |
| `metrics.startupProbe.successThreshold`      | Success threshold for startupProbe                                                                                  | `1`                      |
| `metrics.livenessProbe.enabled`              | Enable livenessProbe on Mediator replicas nodes                                                                   | `true`                   |
| `metrics.livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe                                                                             | `10`                     |
| `metrics.livenessProbe.periodSeconds`        | Period seconds for livenessProbe                                                                                    | `10`                     |
| `metrics.livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe                                                                                   | `5`                      |
| `metrics.livenessProbe.failureThreshold`     | Failure threshold for livenessProbe                                                                                 | `5`                      |
| `metrics.livenessProbe.successThreshold`     | Success threshold for livenessProbe                                                                                 | `1`                      |
| `metrics.readinessProbe.enabled`             | Enable readinessProbe on Mediator replicas nodes                                                                  | `true`                   |
| `metrics.readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe                                                                            | `5`                      |
| `metrics.readinessProbe.periodSeconds`       | Period seconds for readinessProbe                                                                                   | `10`                     |
| `metrics.readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe                                                                                  | `1`                      |
| `metrics.readinessProbe.failureThreshold`    | Failure threshold for readinessProbe                                                                                | `3`                      |
| `metrics.readinessProbe.successThreshold`    | Success threshold for readinessProbe                                                                                | `1`                      |
| `metrics.customStartupProbe`                 | Custom startupProbe that overrides the default one                                                                  | `{}`                     |
| `metrics.customLivenessProbe`                | Custom livenessProbe that overrides the default one                                                                 | `{}`                     |
| `metrics.customReadinessProbe`               | Custom readinessProbe that overrides the default one                                                                | `{}`                     |
| `metrics.command`                            | Override default metrics container init command (useful when using custom images)                                   | `[]`                     |
| `metrics.MediatortHost`                    | A way to specify an alternative Mediator hostname                                                                 | `localhost`              |
| `metrics.extraArgs`                          | Extra arguments for Mediator exporter, for example:                                                               | `{}`                     |
| `metrics.extraEnvVars`                       | Array with extra environment variables to add to Mediator exporter                                                | `[]`                     |
| `metrics.containerSecurityContext.enabled`   | Enabled Mediator exporter containers' Security Context                                                            | `true`                   |
| `metrics.containerSecurityContext.runAsUser` | Set Mediator exporter containers' Security Context runAsUser                                                      | `1001`                   |
| `metrics.extraVolumes`                       | Optionally specify extra list of additional volumes for the Mediator metrics sidecar                              | `[]`                     |
| `metrics.extraVolumeMounts`                  | Optionally specify extra list of additional volumeMounts for the Mediator metrics sidecar                         | `[]`                     |
| `metrics.resources.limits`                   | The resources limits for the Mediator exporter container                                                          | `{}`                     |
| `metrics.resources.requests`                 | The requested resources for the Mediator exporter container                                                       | `{}`                     |
| `metrics.podLabels`                          | Extra labels for Mediator exporter pods                                                                           | `{}`                     |
| `metrics.podAnnotations`                     | Annotations for Mediator exporter pods                                                                            | `{}`                     |
| `metrics.service.type`                       | Mediator exporter service type                                                                                    | `ClusterIP`              |
| `metrics.service.port`                       | Mediator exporter service port                                                                                    | `9121`                   |
| `metrics.service.externalTrafficPolicy`      | Mediator exporter service external traffic policy                                                                 | `Cluster`                |
| `metrics.service.extraPorts`                 | Extra ports to expose (normally used with the `sidecar` value)                                                      | `[]`                     |
| `metrics.service.loadBalancerIP`             | Mediator exporter service Load Balancer IP                                                                        | `""`                     |
| `metrics.service.loadBalancerSourceRanges`   | Mediator exporter service Load Balancer sources                                                                   | `[]`                     |
| `metrics.service.annotations`                | Additional custom annotations for Mediator exporter service                                                       | `{}`                     |
| `metrics.service.clusterIP`                  | Mediator exporter service Cluster IP                                                                              | `""`                     |
| `metrics.serviceMonitor.enabled`             | Create ServiceMonitor resource(s) for scraping metrics using PrometheusOperator                                     | `false`                  |
| `metrics.serviceMonitor.namespace`           | The namespace in which the ServiceMonitor will be created                                                           | `""`                     |
| `metrics.serviceMonitor.interval`            | The interval at which metrics should be scraped                                                                     | `30s`                    |
| `metrics.serviceMonitor.scrapeTimeout`       | The timeout after which the scrape is ended                                                                         | `""`                     |
| `metrics.serviceMonitor.relabellings`        | Metrics RelabelConfigs to apply to samples before scraping.                                                         | `[]`                     |
| `metrics.serviceMonitor.metricRelabelings`   | Metrics RelabelConfigs to apply to samples before ingestion.                                                        | `[]`                     |
| `metrics.serviceMonitor.honorLabels`         | Specify honorLabels parameter to add the scrape endpoint                                                            | `false`                  |
| `metrics.serviceMonitor.additionalLabels`    | Additional labels that can be used so ServiceMonitor resource(s) can be discovered by Prometheus                    | `{}`                     |
| `metrics.serviceMonitor.podTargetLabels`     | Labels from the Kubernetes pod to be transferred to the created metrics                                             | `[]`                     |
| `metrics.prometheusRule.enabled`             | Create a custom prometheusRule Resource for scraping metrics using PrometheusOperator                               | `false`                  |
| `metrics.prometheusRule.namespace`           | The namespace in which the prometheusRule will be created                                                           | `""`                     |
| `metrics.prometheusRule.additionalLabels`    | Additional labels for the prometheusRule                                                                            | `{}`                     |
| `metrics.prometheusRule.rules`               | Custom Prometheus rules                                                                                             | `[]`                     |



A YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/Mediator
> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

One37 will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Use a different Mediator version

To modify the application version used in this chart, specify a different version of the image using the `image.tag` parameter and/or a different repository using the `image.repository` parameter. Refer to the [chart documentation for more information on these parameters and how to use them with images from a private registry](https://docs.bitnami.com/kubernetes/infrastructure/Mediatoriguration/change-image-version/).


On a cluster where the name of the Helm release is `a`, the hostname of a Pod is generated as: `a-Mediator-0.a-Mediator.example.org`. The IP of that FQDN will match that of the associated Pod. This modifies the following parameters of the Mediatorinel configuration using this new FQDN:


### Cluster topologies

####  Scaled Instances (Manual or Autoscaled)

When installing the chart with `architecture=scaled`, it will deploy a Mediator StatefulSet with a configurable number of replicas. A single service will be exposed:

#### Default: Standalone

When installing the chart with `architecture=standalone`, it will deploy a standalone Mediator StatefulSet. A single service will be exposed:

- Mediator Master service: Points to the master, where read-write operations can be performed



### Securing traffic using TLS

TLS support can be enabled in the chart by specifying the `tls.` parameters while creating a release. The following parameters should be configured to properly enable the TLS support in the chart:

- `tls.enabled`: Enable TLS support. Defaults to `false`
- `tls.existingSecret`: Name of the secret that contains the certificates. No defaults.
- `tls.certFilename`: Certificate filename. No defaults.
- `tls.certKeyFilename`: Certificate key filename. No defaults.
- `tls.certCAFilename`: CA Certificate filename. No defaults.

Refer to the chart documentation for more information on [creating the secret and a TLS deployment example](https://docs.bitnami.com/kubernetes/infrastructure/Mediatornistration/enable-tls/).

### Metrics

The chart optionally can start a metrics exporter for [prometheus](https://prometheus.io). The metrics endpoint (port 9121) is exposed in the service. Metrics can be scraped from within the cluster using something similar as the described in the [example Prometheus scrape configuration](https://github.com/prometheus/prometheus/blob/master/documentation/examples/prometheus-kubernetes.yml). If metrics are to be scraped from outside the cluster, the Kubernetes API proxy can be utilized to access the endpoint.

If you have enabled TLS by specifying `tls.enabled=true` you also need to specify TLS option to the metrics exporter. You can do that via `metrics.extraArgs`. You can find the metrics exporter CLI flags for TLS [here](https://github.com/oliver006/Mediatorrter#command-line-flags). For example:

You can either specify `metrics.extraArgs.skip-tls-verification=true` to skip TLS verification or providing the following values under `metrics.extraArgs` for TLS client authentication:

```console
tls-client-key-file
tls-client-cert-file
tls-ca-cert-file
```

## NetworkPolicy

To enable network policy for Mediator, install [a networking plugin that implements the Kubernetes NetworkPolicy spec](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy#before-you-begin), and set `networkPolicy.enabled` to `true`.

Refer to the chart documenation for more information on [enabling the network policy in Mediator deployments](https://docs.bitnami.com/kubernetes/infrastructure/Mediatornistration/enable-network-policy/).

### Setting Pod's affinity

This chart allows you to set your custom affinity using the `XXX.affinity` parameter(s). Find more information about Pod's affinity in the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, you can use of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `XXX.podAffinityPreset`, `XXX.podAntiAffinityPreset`, or `XXX.nodeAffinityPreset` parameters.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

A major chart version change (like v1.2.3 -> v2.0.0) indicates that there is an incompatible breaking change needing manual actions.



## License

Copyright &copy; 2023 One37 Solutions, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.