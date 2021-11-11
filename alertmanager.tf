resource "aws_prometheus_alert_manager_definition" "alertmanager" {
  workspace_id = aws_prometheus_workspace.amp.id
  definition   = <<EOF
alertmanager_config: |
  route:
    receiver: 'slack'
  receivers:
    - name: 'slack'
      slack_configs:
      - api_url: "$${webhook}"
        channel: "$${channel}"
        send_resolved: True
        title: '{{ template "slack.cp.title" . }}'
        text: '{{ template "slack.cp.text" . }}'
        actions:
        - type: button
          text: 'Runbook :blue_book:'
          url: '{{ (index .Alerts 0).Annotations.runbook_url }}'
        - type: button
          text: 'Query :mag:'
          url: '{{ (index .Alerts 0).GeneratorURL }}'
        - type: button
          text: 'Dashboard :chart_with_upwards_trend:'
          url: '{{ (index .Alerts 0).Annotations.dashboard_url }}'
        - type: button
          text: 'Silence :no_bell:'
          url: '{{ template "__alert_silence_link" . }}'
EOF
}