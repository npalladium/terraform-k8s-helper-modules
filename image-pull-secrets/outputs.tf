output "secrets" {
  //noinspection HILUnresolvedReference
  value = [for secret in kubernetes_secret_v1.this : "${secret.metadata[0].namespace}/${secret.metadata[0].name}"]
}