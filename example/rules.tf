resource "aws_prometheus_rule_group_namespace" "raz_demo" {
  provider     = aws.ireland
  name         = "raz-demo"
  workspace_id = module.test_prometheus.amp_id
  data         = <<EOF
groups:
  - name: cpu-record
    rules:
    - record: metric:recording_rule
      expr: avg(rate(container_cpu_usage_seconds_total[2m]))
  - name: cpu-alert
    rules:
    - alert: metric:alerting_rule
      expr: avg(rate(container_cpu_usage_seconds_total[2m])) > 0
      for: 1m
EOF
}
