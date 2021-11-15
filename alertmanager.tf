resource "aws_prometheus_alert_manager_definition" "alertmanager" {
  provider     = aws.ireland
  workspace_id = aws_prometheus_workspace.amp.id
  definition   = <<EOF
alertmanager_config: |
  route:
    receiver: 'sns-demo'
  receivers:
    - name: 'sns-demo'
      sns_configs:
      - topic_arn: ${module.prometheus_sns_topic.topic_arn}
        sigv4:
          region: eu-west-1
        attributes:
          key: severity
          value: critical
EOF
}
