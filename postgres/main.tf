provider "postgresql" {
  host            = "localhost"
  port            = 5432
  database        = "postgres"
  username        = "postgres"
  password        = "dalong"
  sslmode         = "disable"
  connect_timeout = 15
}

resource "postgresql_extension" "my_extension" {
  name = "pg_trgm"
}

resource "postgresql_database" "my_db_app" {
  name              = "appdemo"
  owner             = "${postgresql_role.my_role2.name}"
  template          = "template0"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
  
}

resource "postgresql_role" "my_role2" {
  name     = "dalong2"
  login    = true
  password = "dalongdemo"
}
resource "postgresql_role" "my_role" {
  name     = "dalong"
  login    = true
  password = "dalongdemo"
}