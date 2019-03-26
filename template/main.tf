data "template_file" "init" {
  template = "${file("init.tpl")}"
  vars = {
    consul_address = "http://localhost:8500"
  }
}
resource "local_file" "foo" {
    content     = "${data.template_file.init.rendered}"
    filename = "${path.module}/init.sh"
}
