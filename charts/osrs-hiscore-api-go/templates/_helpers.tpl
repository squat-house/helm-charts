{{- define "environment.vars" -}}
          - name: AWS_REGION
            value: us-east-1
          {{- if eq .Values.local_env true }}
          - name: LOCAL_ENV
            value: "true"
          {{ end }}
{{- end }}

{{- define "local.volumes" -}}
{{- if eq .Values.local_env true }}
      volumes:
          - name: aws-creds
            hostPath:
                path: {{ .Values.home_dir}}/.aws/
                type: Directory
          - name: env-file
            hostPath:
                path: {{ .Values.tilt_dir}}/.env
                type: File
{{ end }}
{{ end }}

{{- define "local.volume_mounts" -}}
{{- if eq .Values.local_env true }}
            volumeMounts:
              - name: env-file
                mountPath: /app/.env
              - name: aws-creds
                mountPath: /root/.aws
{{ end }}
{{ end }}