# Stack-sonarqube

Sonarqube Stack

This stack deploys a Sonarqube (Community edition) instance using Helm chart.

# Requirements

In order to run this task, couple elements are required within the infrastructure:

  * Having a Kubernetes running

# Details

**Params**

***s3 compatible***

|Name|Description|Type|Default|Required|
|---|---|:---:|:---:|:---:|
|`s3_access_key`|S3 access key to access the Terraform state file.|`string`|`((aws.access_key))`|`True`|
|`s3_region`|S3 region to access the Terraform state file.|`string`|`eu-west-1`|`True`|
|`s3_secret_key`|S3 secret key to access the Terraform state file.|`string`|`((aws.secret_key))`|`True`|
|`config_git_branch`|The name of the git branch where the config is stored.|`string`|`config`|`True`|
|`config_git_private_key`|SSH key pair to fetch the config git repository.|`string`|`((git_ssh_key.ssh_key))`|`True`|
|`config_git_repository`|Git repository url containing the config of the stack.|`string`|`git@github.com:MyUser/config-sonarqube.git`|`True`|
|`customer`|Name of the Cycloid Organization, used as customer variable name.|`-`|`($ organization_canonical $)`|`True`|
|`env`|Name of the project's environment.|`-`|`($ environment $)`|`True`|
|`kubeconfig`|The KubeConfig file stored in vault to connect on Kubernetes|`string`|`((custom_kubeconfig))`|`True`|
|`plugins_install`|An array of plugins URL, separated by comma.|`array`|`https://cycloid-exchange.s3-eu-west-1.amazonaws.com/sonarqube-community-branch-plugin-1.6.0-SNAPSHOT.jar, https://cycloid-exchange.s3-eu-west-1.amazonaws.com/fake-plugin.jar`|`False`|
|`plugins_lib`|An array of plugins name to copy them on lib directory.|`array`|`sonarqube-community-branch-plugin-1.6.0-SNAPSHOT.jar, fake-plugin.jar`|`False`|
|`postgresql_password`|The Postgresql password to avoid using a public documented one.|`string`|`((custom_postgresql_password))`|`True`|
|`project`|Name of the project.|`-`|`($ project $)`|`True`|
|`sonarqube_admin_password`|The Sonarqube administrator password.|`string`|`((custom_sonarqube_password))`|`True`|
|`sonarqube_domain`|Sonarqube domain to reach.|`string`|`sonarqube.mycompany.tld`|`True`|
|`sonarqube_image_tag`|The Docker image to deploy.|`string`|`8.5-community`|`False`|
|`ssl_secretname`|The name of the secret (has to be created manually) containing the TLS certificate.|`string`|`my-secret-name-in-kubernetes`|`True`|
|`terraform_storage_bucket_name`|The S3 bucket used to store Terraform state file|`string`|`my-bucket-name`|`True`|
|`terraform_storage_bucket_path`|The path in the bucket where is located the Terraform state file.|`string`|`($ project $)/($ environment $)/($ project $)-($ environment $).tfstate`|`True`|
