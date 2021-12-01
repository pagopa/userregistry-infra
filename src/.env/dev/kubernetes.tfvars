prefix = "usrreg"

# ingress
nginx_helm_version="4.0.12"
ingress_replica_count    = "2"
ingress_load_balancer_ip = "20.82.206.96"

# Gateway
api_gateway_url  = "https://api.dev.userregistry.pagopa.it"
cdn_frontend_url = "https://dev.userregistry.pagopa.it"

# uservice versions
api-version_uservice-attribute-registry-management = "0.1"
api-version_uservice-party-management              = "0.1"
api-version_uservice-party-process                 = "0.1"
api-version_uservice-party-registry-proxy          = "0.1"

# configs/secrets

configmaps_hub-spid-login-ms = {
  APPLICATIONINSIGHTS_ROLE_NAME                     = "hub-spid-login-ms"
  APPLICATIONINSIGHTS_INSTRUMENTATION_LOGGING_LEVEL = "OFF"

  # SPID
  ORG_ISSUER = "https://dev.userregistry.pagopa.it" # TODO to verify
}

configmaps_ms-product = {
  JAVA_TOOL_OPTIONS                                 = "-javaagent:/applicationinsights-agent.jar"
  APPLICATIONINSIGHTS_ROLE_NAME                     = "ms-product"
  APPLICATIONINSIGHTS_INSTRUMENTATION_LOGGING_LEVEL = "OFF"
}

configmaps_b4f-dashboard = {
  JAVA_TOOL_OPTIONS                                 = "-javaagent:/applicationinsights-agent.jar"
  APPLICATIONINSIGHTS_ROLE_NAME                     = "b4f-dashboard"
  APPLICATIONINSIGHTS_INSTRUMENTATION_LOGGING_LEVEL = "OFF"
}

configmaps_uservice-attribute-registry-management = {
  JAVA_OPTS                                         = "-javaagent:/applicationinsights-agent.jar"
  APPLICATIONINSIGHTS_INSTRUMENTATION_LOGGING_LEVEL = "OFF"
}

configmaps_uservice-party-management = {
  JAVA_OPTS                                         = "-javaagent:/applicationinsights-agent.jar"
  APPLICATIONINSIGHTS_INSTRUMENTATION_LOGGING_LEVEL = "OFF"
}

configmaps_uservice-party-process = {
  JAVA_OPTS                                         = "-javaagent:/applicationinsights-agent.jar"
  APPLICATIONINSIGHTS_INSTRUMENTATION_LOGGING_LEVEL = "OFF"
  USER_REGISTRY_MANAGEMENT_URL                      = "https://api.dev.user-registry.pagopa.it/pdnd-interop-uservice-user-registry-management/0.1" // TODO
}

configmaps_uservice-party-registry-proxy = {
  JAVA_OPTS                                         = "-javaagent:/applicationinsights-agent.jar"
  APPLICATIONINSIGHTS_INSTRUMENTATION_LOGGING_LEVEL = "OFF"
}
