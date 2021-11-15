resource "aws_prometheus_workspace" "amp" {
  provider = aws.ireland
  alias    = var.amp_alias
}
