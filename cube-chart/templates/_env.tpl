{{- define "cube.env" -}}
{{- include "cube.env.config" . }}
{{- include "cube.env.jwt" . }}
{{- include "cube.env.redis" . }}
{{- include "cube.env.cubestore" . }}

{{- $datasources := list }}
{{- range $e, $i := $.Values.datasources }}
{{- $datasources = append $datasources $e }}
{{- if not $i.type }}
{{- fail (printf "database.%s.type is required" $e) }}
{{- end }}
{{- include "cube.env.database.common" (set $i "datasource" $e) }}
{{- end }}
{{- if gt (len $datasources) 1 }}
- name: CUBEJS_DATASOURCES
  value: {{ join "," $datasources | quote }}
{{- end }}
{{- end }}