{{- define "cubestore.common-env" -}}
{{- if .Values.config.logLevel }}
- name: CUBESTORE_LOG_LEVEL
  value: {{ .Values.config.logLevel | quote }}
{{- end }}
{{- if .Values.config.noUpload }}
- name: CUBESTORE_NO_UPLOAD
  value: {{ .Values.config.noUpload | quote }}
{{- end }}
- name: CUBESTORE_TELEMETRY
  value: {{ .Values.config.telemetry | quote }}
{{- if .Values.config.jobRunners }}
- name: CUBESTORE_JOB_RUNNERS
  value: {{ .Values.config.jobRunners | quote }}
{{- end }}
{{- if .Values.config.queryTimeout }}
- name: CUBESTORE_QUERY_TIMEOUT
  value: {{ .Values.config.queryTimeout | quote }}
{{- end }}
{{- if .Values.config.walSplitThreshold }}
- name: CUBESTORE_WAL_SPLIT_THRESHOLD
  value: {{ .Values.config.walSplitThreshold | quote }}
{{- end }}
{{- if .Values.cloudStorage.aws.accessKeyID }}
- name: CUBESTORE_AWS_ACCESS_KEY_ID
  value: {{ .Values.cloudStorage.aws.accessKeyID | quote }}
{{- end }}
{{- if .Values.cloudStorage.aws.secretKey }}
- name: CUBESTORE_AWS_SECRET_ACCESS_KEY
  value: {{ .Values.cloudStorage.aws.secretKey | quote }}
{{- else if .Values.cloudStorage.aws.secretKeyFromSecret }}
- name: CUBESTORE_AWS_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.cloudStorage.aws.secretKeyFromSecret.name | required "cloudStorage.aws.secretKeyFromSecret.name is required" }}
      key: {{ .Values.cloudStorage.aws.secretKeyFromSecret.key | required "cloudStorage.aws.secretKeyFromSecret.key is required" }}
{{- end }}
{{- if .Values.cloudStorage.aws.bucket }}
- name: CUBESTORE_S3_BUCKET
  value: {{ .Values.cloudStorage.aws.bucket | quote }}
{{- end }}
{{- if .Values.cloudStorage.aws.region }}
- name: CUBESTORE_S3_REGION
  value: {{ .Values.cloudStorage.aws.region | quote }}
{{- end }}
{{- if .Values.cloudStorage.aws.subPath }}
- name: CUBESTORE_S3_SUB_PATH
  value: {{ .Values.cloudStorage.aws.subPath | quote }}
{{- end }}
{{- if .Values.cloudStorage.aws.refreshCredsEveryMinutes }}
- name: CUBESTORE_AWS_CREDS_REFRESH_EVERY_MINS
  value: {{ .Values.cloudStorage.aws.refreshCredsEveryMinutes | quote }}
{{- end }}
{{- if .Values.cubestore.metrics.format }}
- name: CUBESTORE_METRICS_FORMAT
  value: {{ .Values.cubestore.metrics.format | quote }}
{{- end }}
{{- if .Values.cubestore.metrics.address }}
- name: CUBESTORE_METRICS_ADDRESS
  value: {{ .Values.cubestore.metrics.address | quote }}
{{- end }}
{{- if .Values.cubestore.metrics.port }}
- name: CUBESTORE_METRICS_PORT
  value: {{ .Values.cubestore.metrics.port | quote }}
{{- end }}
{{- end }}
