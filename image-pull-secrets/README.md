# Image Pull Secrets Helper

[![unstable](http://badges.github.io/stability-badges/dist/unstable.svg)](http://github.com/badges/stability-badges)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.2 |
| kubernetes | >=2.10.0 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | >=2.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_secret_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [kubernetes_all_namespaces.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/all_namespaces) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| base64\_encoded\_dockerconfigjson | Base64 Encoded .dockerconfigjson. | `string` | n/a | yes |
| namespaces | List of namespaces to which the image pull secret must be added.<br>Supply a list containing just '*' (`["*"]` to add to all namespaces.<br>If `namespaces` has elements in common with `restricted_namespaces`, `restricted_namespaces` will take priority. | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| restricted\_namespaces | List of namespaces to which the image pull secret must NOT be added.<br>If `namespaces` has elements in common with `restricted_namespaces`, `restricted_namespaces` will take priority. | `list(string)` | <pre>[<br>  "kube-system",<br>  "default",<br>  "cert-manager"<br>]</pre> | no |
| secret\_name | Name of the secret. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| secrets | n/a |
<!-- END_TF_DOCS -->
