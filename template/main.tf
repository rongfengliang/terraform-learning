data "template_file" "init" {
  template = "${file("init.tpl")}"
  vars = {
    consul_address = "http://localhost:8500"
    name = "dalongdemo"
    age =444
    platform ="mobile"
  }
}
data "local_file" "foo" {
    filename = "${path.module}/token.ini"
}


// base64  && format function demo
resource "local_file" "foo" {
    content  = "${base64encode(format("%s\n%s",data.template_file.init.rendered, data.local_file.foo.content))}" 
    filename = "${path.module}/init.sh"
}
