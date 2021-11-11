resource "aws_prometheus_rule_group_namespace" "self_check" {
  name         = "self-check"
  workspace_id = module.test_prometheus.amp_id
  data         = <<EOF
groups:
  - name: prometheus
    rules:
    - alert: PrometheusBadConfig
      annotations:
        description: Prometheus {{$labels.namespace}}/{{$labels.pod}} has failed to
          reload its configuration.
        runbook_url: https://github.com/kubernetes-monitoring/kubernetes-mixin/tree/master/runbook.md#alert-name-prometheusbadconfig
        summary: Failed Prometheus configuration reload.
      expr: |-
        # Without max_over_time, failed scrapes could create false negatives, see
        # https://www.robustperception.io/alerting-on-gauges-in-prometheus-2-0 for details.
        max_over_time(prometheus_config_last_reload_successful{job="prometheus-server",namespace="${var.namespace}"}[5m]) == 0
      for: 10m
      labels:
        severity: critical
EOF
}
