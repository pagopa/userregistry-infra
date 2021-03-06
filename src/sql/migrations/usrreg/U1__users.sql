-- DROPPING MONITORING_USER
ALTER DEFAULT PRIVILEGES IN SCHEMA public REVOKE SELECT ON TABLES FROM "MONITORING_USER";
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM "MONITORING_USER";

ALTER DEFAULT PRIVILEGES IN SCHEMA user_registry REVOKE SELECT ON TABLES FROM "MONITORING_USER";
REVOKE ALL ON ALL TABLES IN SCHEMA user_registry FROM "MONITORING_USER";
REVOKE USAGE ON SCHEMA user_registry FROM "MONITORING_USER";

REVOKE ALL ON DATABASE usrreg FROM "MONITORING_USER";
DROP ROLE "MONITORING_USER";

-- DROPPING MONITORING_EXTERNAL_USER
ALTER DEFAULT PRIVILEGES IN SCHEMA public REVOKE SELECT ON TABLES FROM "MONITORING_EXTERNAL_USER";
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM "MONITORING_EXTERNAL_USER";

ALTER DEFAULT PRIVILEGES IN SCHEMA user_registry REVOKE SELECT ON TABLES FROM "MONITORING_EXTERNAL_USER";
REVOKE ALL ON ALL TABLES IN SCHEMA user_registry FROM "MONITORING_EXTERNAL_USER";
REVOKE USAGE ON SCHEMA user_registry FROM "MONITORING_EXTERNAL_USER";

REVOKE ALL ON DATABASE usrreg FROM "MONITORING_EXTERNAL_USER";
DROP ROLE "MONITORING_EXTERNAL_USER";

--DROPPING SCHEMA
DROP SCHEMA user_registry;

-- DROPPING SCHEMA USERS
REVOKE ALL ON DATABASE usrreg FROM "USER_REGISTRY_USER";
DROP ROLE "USER_REGISTRY_USER";
