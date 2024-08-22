{{/*
Expand the name of the chart.
*/}}
{{- define "one37id-ibm-studio.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "one37id-ibm-studio.fullname" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "one37id-ibm-studio.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "one37id-ibm-studio.labels" -}}
helm.sh/chart: {{ include "one37id-ibm-studio.chart" . }}
{{ include "one37id-ibm-studio.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "one37id-ibm-studio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "one37id-ibm-studio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "one37id-ibm-studio.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "one37id-ibm-studio.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "one37id-ibm-studio.serviceAccountRoleName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "one37id-ibm-studio.fullname" .) .Values.serviceAccount.roleName }}
{{- else }}
{{- default "default" .Values.serviceAccount.roleName }}
{{- end }}
{{- end }}