{{- define "environment.vars" -}}
          {{- if eq .Values.local_env true }}
          - name: LOCAL_ENV
            value: "true"
          {{ end }}
{{- end }}

{{- define "local.volumes" -}}
{{- if eq .Values.local_env true }}
      volumes:
          - name: env-file
            hostPath:
                path: {{ .Values.tilt_dir}}/local.env
                type: File
{{ end }}
{{ end }}

{{- define "local.volume_mounts" -}}
{{- if eq .Values.local_env true }}
            volumeMounts:
              - name: env-file
                mountPath: /app/.env
{{ end }}
{{ end }}