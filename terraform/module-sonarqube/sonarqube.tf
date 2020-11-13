resource "helm_release" "sonarqube-community" {
  name  = "sonarqube-community"
  repository = "https://oteemo.github.io/charts"
  chart = "sonarqube"

  create_namespace = true
  namespace = var.kubernetes_namespace

  values = [templatefile("${path.module}/templates/values.yaml.tpl", {
    domain: var.sonarqube_domain,
    ssl_secretname: var.ssl_secretname,
    plugins_install: var.plugins_install,
    plugins_lib: var.plugins_lib
  })]

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0].name"
    value = var.sonarqube_domain
  }

  set {
    name  = "image.tag"
    value = var.sonarqube_image_tag
  }

  set {
    name  = "account.adminPassword"
    value = var.sonarqube_admin_password
  }

  set {
    name  = "postgresql.postgresqlUsername"
    value = "sonarqube"
  }

  set {
    name  = "postgresql.postgresqlPassword"
    value = var.postgresql_password
  }

  set {
    name  = "postgresql.postgresqlDatabase"
    value = "sonarqube"
  }

  set {
    name  = "persistence.enabled"
    value = true
  }

  set {
    name  = "ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/proxy-body-size"
    value = "15m"
  }
}
