resource "aws_prometheus_workspace" "amp" {
  provider = aws.ireland
  alias    = var.amp_alias

  tags = {
    Name        = var.amp_alias
    Description = "Managed by Terraform"
    Owner       = var.team_name
  }
}
