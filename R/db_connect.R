library(DBI)
library(RPostgres)

pg_connect <- function(
  dbname = Sys.getenv("PGDATABASE"),
  host   = Sys.getenv("PGHOST", "localhost"),
  port   = as.integer(Sys.getenv("PGPORT", "5432")),
  user   = Sys.getenv("PGUSER"),
  pass   = Sys.getenv("PGPASSWORD")
) {
  stopifnot(
    nzchar(dbname),
    nzchar(user),
    nzchar(pass)
  )

  DBI::dbConnect(
    RPostgres::Postgres(),
    dbname   = dbname,
    host     = host,
    port     = port,
    user     = user,
    password = pass
  )
}
