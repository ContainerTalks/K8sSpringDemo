{{/* vim: set filetype=mustache: */}}
{{/*
postgresql customisation
*/}}
{{- define "postgresql.name" -}}
{{- default "k8sspringdemo-postgresql" -}}
{{- end -}}

{{- define "postgresql.fullname" -}}
{{- default "k8sspringdemo-postgresql" -}}
{{- end -}}
