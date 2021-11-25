# general
env_short = "d"
env       = "dev"
location = "germanywestcentral"
tags = {
  CreatedBy   = "Terraform"
  Environment = "Dev"
  Owner       = "UserRegistry"
  Source      = "https://github.com/pagopa/userregistry-infra"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}
lock_enable = false

# 🔐 key vault
key_vault_name    = "usrreg-d-kv"
key_vault_rg_name = "usrreg-d-sec-rg"

# ☁️ networking
cidr_vnet               = ["10.1.0.0/16"]
cidr_subnet_azdoa       = ["10.1.130.0/24"]
cidr_subnet_postgres    = ["10.1.129.0/24"]
cidr_subnet_appgateway  = ["10.1.128.0/24"]
cidr_subnet_apim        = ["10.1.136.0/24"]
cidr_subnet_k8s         = ["10.1.0.0/17"]

# dns
dns_zone_prefix = "dev.userregistry"
external_domain = "pagopa.it"

# azure devops
enable_azdoa             = true
enable_iac_pipeline      = true

# ❇️ app_gateway
app_gateway_sku_name = "Standard_v2"
app_gateway_sku_tier = "Standard_v2"
app_gateway_api_certificate_name = "api-dev-userregistry-pagopa-it"

app_gateway_alerts_enabled=false
app_gateway_waf_enabled=false

# 🗄 postgresql
postgres_sku_name       = "GP_Gen5_2"
postgres_enable_replica = false
postgres_public_network_access_enabled = true
postgres_configuration = {
  autovacuum_work_mem         = "-1"
  effective_cache_size        = "655360"
  log_autovacuum_min_duration = "5000"
  log_connections             = "off"
  log_line_prefix             = "%t [%p apps:%a host:%r]: [%l-1] db=%d,user=%u"
  log_temp_files              = "4096"
  maintenance_work_mem        = "524288"
  max_wal_size                = "4096"
  log_connections             = "on"
  log_checkpoints             = "on"
  connection_throttling       = "on"
}
postgres_alerts_enabled = false

#
# 🗺 APIM
#
apim_publisher_name = "PagoPA SelfCare DEV"
apim_sku            = "Developer_1"
apim_api_internal_certificate_name = "api-internal-dev-userregistry-pagopa-it"

#
# ⛴ AKS
#
aks_private_cluster_enabled = false
aks_alerts_enabled          = false
# This is the k8s ingress controller ip. It must be in the aks subnet range.
reverse_proxy_ip            = "10.1.0.250"
aks_max_pods                = 100
aks_enable_auto_scaling     = false
aks_node_min_count          = null
aks_node_max_count          = null
aks_vm_size                 = "Standard_B4ms"
