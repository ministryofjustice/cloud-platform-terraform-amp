output "amp_endpoint" {
  value = aws_prometheus_workspace.amp.prometheus_endpoint
}

output "amp_id" {
  value = aws_prometheus_workspace.amp.id
}
