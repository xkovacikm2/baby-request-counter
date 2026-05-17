{{/*
Expand the name of the chart.
*/}}
{{- define "baby-counter.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "baby-counter.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "baby-counter.labels" -}}
helm.sh/chart: {{ include "baby-counter.name" . }}-{{ .Chart.Version | replace "+" "_" }}
{{ include "baby-counter.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "baby-counter.selectorLabels" -}}
app.kubernetes.io/name: {{ include "baby-counter.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
PostgreSQL host
*/}}
{{- define "baby-counter.postgresqlHost" -}}
{{- printf "%s-postgresql" (include "baby-counter.fullname" .) }}
{{- end }}
