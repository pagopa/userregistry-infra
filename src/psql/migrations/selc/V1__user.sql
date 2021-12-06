--
-- Roles
--

CREATE ROLE "USER_REGISTRY_USER";
ALTER ROLE "USER_REGISTRY_USER" WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
GRANT "USER_REGISTRY_USER" TO "${flywayUser}";
ALTER USER "USER_REGISTRY_USER" WITH PASSWORD '${userRegistryUserPassword}';

CREATE ROLE "MONITORING_USER";
ALTER ROLE "MONITORING_USER" WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
ALTER USER "MONITORING_USER" WITH PASSWORD '${monitoringUserPassword}';

CREATE ROLE "MONITORING_EXTERNAL_USER";
ALTER ROLE "MONITORING_EXTERNAL_USER" WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
ALTER USER "MONITORING_EXTERNAL_USER" WITH PASSWORD '${monitoringExternalUserPassword}';

-- Database privileges
--

GRANT CONNECT ON DATABASE usrreg TO "USER_REGISTRY_USER";
GRANT CONNECT ON DATABASE usrreg TO "MONITORING_USER";
GRANT CONNECT ON DATABASE usrreg TO "MONITORING_EXTERNAL_USER";

-- schema creation
--

CREATE SCHEMA user_registry;
ALTER SCHEMA user_registry OWNER TO "USER_REGISTRY_USER";

-- schema grants
--

ALTER DEFAULT PRIVILEGES IN SCHEMA user_registry GRANT ALL PRIVILEGES ON TABLES TO "USER_REGISTRY_USER";
ALTER DEFAULT PRIVILEGES IN SCHEMA user_registry GRANT USAGE ON SEQUENCES TO "USER_REGISTRY_USER";

GRANT USAGE ON SCHEMA user_registry TO "MONITORING_USER";
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO "MONITORING_USER";
ALTER DEFAULT PRIVILEGES IN SCHEMA user_registry GRANT SELECT ON TABLES TO "MONITORING_USER";

GRANT USAGE ON SCHEMA user_registry TO "MONITORING_EXTERNAL_USER";
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO "MONITORING_EXTERNAL_USER";
ALTER DEFAULT PRIVILEGES IN SCHEMA user_registry GRANT SELECT ON TABLES TO "MONITORING_EXTERNAL_USER";
