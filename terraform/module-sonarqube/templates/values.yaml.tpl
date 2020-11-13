ingress:
  tls:
  - hosts:
    - ${domain}
    secretName: ${ssl_secretname}
plugins:
  install:%{ for pluginToInstall in plugins_install }
    - ${pluginToInstall}
    %{ endfor }
  lib:%{ for pluginToCopy in plugins_lib }
    - ${pluginToCopy}
    %{ endfor }
