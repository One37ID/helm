{{/*
Expand the name of the chart.
*/}}
{{- define "one37id-mediator.name" -}}
{{- default .Chart.Name .Values.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "one37id-mediator.fullname" -}}
{{- if .Values.fullname }}
{{- .Values.fullname | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.name }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "one37id-mediator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "one37id-mediator.labels" -}}
helm.sh/chart: {{ include "one37id-mediator.chart" . }}
{{ include "one37id-mediator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "one37id-mediator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "one37id-mediator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app: {{ include "one37id-mediator.name" . }}
{{- end }}

{{/*
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "one37id-mediator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "one37id-mediator.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
