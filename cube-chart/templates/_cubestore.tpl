{{/*
Create the name of cubestore router service account to use
*/}}
{{- define "cubestore.router.serviceAccountName" -}}
{{- if .Values.router.serviceAccount.create -}}
  {{ default (printf "%s-cubestore-router" (include "cube.fullname" .)) .Values.router.serviceAccount.name }}
{{- else -}}
  {{ default "default" .Values.router.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of cubestore workers service account to use
*/}}
{{- define "cubestore.workers.serviceAccountName" -}}
{{- if .Values.workers.serviceAccount.create -}}
  {{ default (printf "%s-cubestore-workers" (include "cube.fullname" .)) .Values.workers.serviceAccount.name }}
{{- else -}}
  {{ default "default" .Values.workers.serviceAccount.name }}
{{- end -}}
{{- end -}}