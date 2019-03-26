provider "grafana" {
  url  = "http://localhost:3001/"
  // may use your account for grafana
  auth = "admin:dalong"
}

resource "grafana_dashboard" "metrics" {
  config_json = "${file("dashboard.json")}"
}

resource "grafana_organization" "org" {
    name         = "Grafana Organization"
    admin_user   = "admin"
    create_users = true
    admins       = [
        "admin@example.com"
    ]
    editors      = [
        "editor-01@example.com",
        "editor-02@example.com"
    ]
    viewers      = [
        "viewer-01@example.com",
        "viewer-02@example.com"
    ]
}