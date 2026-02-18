# Database smoke checks
source("generell_databas_setup/R/db_connect.R")

con <- connect_pg()
on.exit(DBI::dbDisconnect(con), add = TRUE)

DBI::dbGetQuery(con, "SELECT version() AS postgres_version;")
DBI::dbGetQuery(con, "SELECT postgis_version() AS postgis_version;")
DBI::dbGetQuery(con, "SELECT current_database() AS database_name;")
DBI::dbGetQuery(con, "SELECT current_user AS db_user;")
DBI::dbGetQuery(con, "SELECT now() AS server_time;")
DBI::dbGetQuery(con, "SELECT schema_name FROM information_schema.schemata ORDER BY schema_name;")
