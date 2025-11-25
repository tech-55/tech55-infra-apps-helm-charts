{{- define "app.envName" -}}
{{- default "default" .Values.environmentName | lower -}}
{{- end -}}

{{- define "app.appName" -}}
{{- default "app" .Values.appName | lower -}}
{{- end -}}

{{- define "app.envValue" -}}
{{- $env := .Env | default "default" -}}
{{- $values := .Values -}}
{{- $key := .Key -}}
{{- $section := (index $values $key | default dict) -}}
{{- $value := (index $section $env | default (index $section "default")) -}}
{{- toYaml $value -}}
{{- end -}}