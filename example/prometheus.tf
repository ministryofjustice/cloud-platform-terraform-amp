module "test_prometheus" {
  source              = "../"
  amp_alias           = "test-prometheus"
  team_name           = "test-team"
  oidc_provider_url   = "https://oidc/etc"
  cluster_domain_name = "test.cloud-platform.service.justice.gov.uk"
  alertmanager_slack_receivers = [
    {
      severity = "warning"
      webhook  = "https://hooks.slack.com/services/dummy"
      channel  = "#lower-priority-alarms"
    }
  ]
}
