# One37 Business Studio package for IBM Cloud Kubernetes Service

The One37 Business Studio is the web-based tool for the configuration and management of the One37 Business Connector agents.

## Introduction

This chart bootstraps a [Business Studio v2]() deployment on an IBM [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It is available to execute as a simple Click & Configure installation through the IBM Cloud Catalog.

## Requirements

- IBM Cloud Kubernetes Service Cluster deployed  v1.19+
- PostgreSQL database. This chart includes the necessary [Bitnami PostgreSQL]() charts and will automatically deploy pre-configured instance in your cluster.

Note: The One37 Business Connector agent mentioned above does not need to be installed in the same cluster as the Business Studio unless you want to share the same database instance.

## Installing the software from the IBM Cloud catalog

In IBM Cloud, you can configure your installation by using IBM Cloud Schematics, and after the installation is complete, you can view the chart instance, update the version, or uninstall from your Schematics workspace.

## Parameters

### Global parameters (common to the included PostgreSql & Redis charts)

| Name                  | Description                                                                | Value |
|-----------------------|----------------------------------------------------------------------------|-------|
| `global.storageClass` | Select the preferred StorageClass to use for the data Persistent Volume(s) | `""`  |

### Required parameters for the Business Studio

| Name                        | Description                                                                                 | Value    |
|-----------------------------|---------------------------------------------------------------------------------------------|----------|
| `fullnameOverride`          | String to fully override the Kubernetes instance name. Must be unique in each namespace     | `""`     |
| `nameOverride`              | String to partially override the Kubernetes instance name. Must be unique in each namespace | `""`     |
| `useDedicateDB`             | String (true/false) value to indicate if the Studio installs its own dedicate PG instance   | `"true"` |
| `ingress.secret.secretname` | String value of the name if the installed Ingress certificate to use for external access.   | `""`     |
