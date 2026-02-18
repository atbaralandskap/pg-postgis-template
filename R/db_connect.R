library(DBI)
library(RPostgres)
library(dotenv)

resolve_env_path <- function(path = ".env") {
  candidates <- unique(c(
    path,
    ".env",
    "generell_databas_setup/.env"
  ))

  hit <- candidates[file.exists(candidates)][1]
  if (is.na(hit)) {
    stop(
      ".env file not found. Checked: ",
      paste(normalizePath(candidates, winslash = "/", mustWork = FALSE), collapse = ", ")
    )
  }

  hit
}

load_pg_env <- function(path = ".env") {
  dotenv::load_dot_env(resolve_env_path(path))
}

connect_pg <- function(env_path = ".env") {
  load_pg_env(env_path)

  required <- c("PGDATABASE", "PGUSER", "PGPASSWORD")
  missing <- required[Sys.getenv(required) == ""]

  if (length(missing) > 0) {
    stop("Missing environment variables: ", paste(missing, collapse = ", "))
  }

  DBI::dbConnect(
    RPostgres::Postgres(),
    dbname = Sys.getenv("PGDATABASE"),
    host = Sys.getenv("PGHOST", "localhost"),
    port = as.integer(Sys.getenv("PGPORT", "5432")),
    user = Sys.getenv("PGUSER"),
    password = Sys.getenv("PGPASSWORD")
  )
}