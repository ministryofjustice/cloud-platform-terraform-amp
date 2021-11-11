module "prometheus_sns_topic" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-sns-topic?ref=4.3"

  team_name          = var.team_name
  topic_display_name = "${var.amp_alias}-prometheus"

  providers = {
    aws = aws.ireland
  }
}
