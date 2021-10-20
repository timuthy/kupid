{{- define "name" -}}
gardener-extension-kupid
{{- end -}}

{{- define "labels.app.key" -}}
app.kubernetes.io/name
{{- end -}}
{{- define "labels.app.value" -}}
{{ include "name" . }}
{{- end -}}

{{- define "labels" -}}
{{ include "labels.app.key" . }}: {{ include "labels.app.value" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{-  define "image" -}}
  {{- if hasPrefix "sha256:" .Values.image.tag }}
  {{- printf "%s@%s" .Values.image.repository .Values.image.tag }}
  {{- else }}
  {{- printf "%s:%s" .Values.image.repository .Values.image.tag }}
  {{- end }}
{{- end }}

{{- define "deploymentversion" -}}
apps/v1
{{- end -}}

{{- define "policy-name" -}}
kupid-policy-{{ . }}
{{- end -}}

{{- define "policy-label-name" -}}
app.kubernetes.io/name: {{ include "policy-name" . }}
{{- end -}}

{{- define "policy-label-release" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "priorityclassversion" -}}
scheduling.k8s.io/v1
{{- end -}}
