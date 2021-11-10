module "test_prometheus" {
  source            = "../"
  amp_alias         = "test-prometheus"
  team_name         = "test-team"
  oidc_provider_url = "https://oidc/etc"
}
