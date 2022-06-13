data "kubernetes_all_namespaces" "this" {}

locals {
  namespaces_initial_list = var.namespaces == ["*"] ? data.kubernetes_all_namespaces.this.namespaces : var.namespaces
  namespaces_filtered_set = setsubtract(local.namespaces_initial_list, var.restricted_namespaces)
}

resource "kubernetes_secret_v1" "this" {
  for_each = local.namespaces_filtered_set
  metadata {
    name      = var.secret_name
    namespace = each.value
  }
  data = {
    ".dockerconfigjson" = var.base64_encoded_dockerconfigjson
  }
  type = "kubernetes.io/dockerconfigjson"
}