data "template_file" "init" {
  template = "${file("init.tpl")}"
  vars = {
    consul_address = "http://localhost:8500"
    name = "dalongdemo"
    age =444
    platform ="mobile"
  }
}


data "http" "example" {
  url = "https://checkpoint-api.hashicorp.com/v1/check/terraform"

  # Optional request headers
  request_headers {
    "Accept" = "application/json"
  }
}

data "local_file" "foo" {
    filename = "${path.module}/token.ini"
}

resource "tls_private_key" "ssh_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

// base64  && format function demo
resource "local_file" "foo" {
    content  = "${base64encode(format("%s\n%s\n%s",data.template_file.init.rendered, data.local_file.foo.content,data.http.example.body))}" 
    filename = "${path.module}/init.sh"
}

resource "local_file" "file_ssh_key" {
    content  = "${format("%s \n %s \n %s",tls_private_key.ssh_key.private_key_pem,tls_private_key.ssh_key.public_key_pem,tls_private_key.ssh_key.public_key_openssh)}" 
    filename = "${path.module}/ssh_key"
}