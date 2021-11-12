rbac:
  create: true
  pspEnabled: false
  pspUseAppArmor: false
serviceAccount:
  create: false
  name: prometheus-server
ingress:
  enabled: true
  annotations: {
    external-dns.alpha.kubernetes.io/aws-weight: "100",
    external-dns.alpha.kubernetes.io/set-identifier: "dns-${clusterName}",
    cloud-platform.justice.gov.uk/ignore-external-dns-weight: "true"
  }
  hosts:
  - "${ grafana_ingress }"
  tls:
    - hosts:
      - "${ grafana_ingress }"
env:
  GF_SERVER_ROOT_URL: "${ grafana_root }"
  GF_ANALYTICS_REPORTING_ENABLED: "false"
  GF_USERS_ALLOW_SIGN_UP: "false"
  GF_INSTALL_PLUGINS: "camptocamp-prometheus-alertmanager-datasource"
  GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS: "camptocamp-prometheus-alertmanager-datasource"
