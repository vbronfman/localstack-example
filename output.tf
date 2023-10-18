output "port" {
  description = "Container port"
  value       = "${docker_container.localstack.*.ports}"
  # value = "out"
}