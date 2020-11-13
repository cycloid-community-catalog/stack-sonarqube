variable customer {
  type = string
}

variable env {
  type = string
}

variable project {
  type = string
}

variable sonarqube_admin_password {
  type = string
}

variable postgresql_password {
  type = string
}

variable sonarqube_image_tag {
  type = string
  default = "8.5-community"
}

variable sonarqube_domain {
  type = string
}

variable kubernetes_namespace {
  type = string
  default = "sonarqube-community"
}

variable ssl_secretname {
  type = string
  default = ""
}

variable plugins_install {
  type = list(string)
  default = []
}

variable plugins_lib {
  type = list(string)
  default = []
}