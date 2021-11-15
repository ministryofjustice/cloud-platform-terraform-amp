module "test_prometheus" {
  source                        = "../"
  amp_alias                     = "test-prometheus"
  team_name                     = "test-team"
  oidc_provider_url             = "https://oidc/etc"
  cluster_domain_name           = "test.cloud-platform.service.justice.gov.uk"
  oidc_components_client_id     = "dummy"
  oidc_components_client_secret = "dummy"
  oidc_issuer_url               = "https://dummy"
  alertmanager_slack_receivers = [
    {
      severity = "warning"
      webhook  = "https://hooks.slack.com/services/dummy"
      channel  = "#lower-priority-alarms"
    }
  ]
}
