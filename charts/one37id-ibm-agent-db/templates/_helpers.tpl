{{/*
Expand the name of the chart.
*/}}
{{- define "one37id-ibm-agent-db.name" -}}
{{- default .Chart.Name .Values.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "one37id-ibm-agent-db.fullname" -}}
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
{{- define "one37id-ibm-agent-db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "one37id-ibm-agent-db.labels" -}}
helm.sh/chart: {{ include "one37id-ibm-agent-db.chart" . }}
{{ include "one37id-ibm-agent-db.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "one37id-ibm-agent-db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "one37id-ibm-agent-db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app: {{ include "one37id-ibm-agent-db.name" . }}
{{- end }}

{{/*
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "one37id-ibm-agent-db.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "one37id-ibm-agent-db.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
