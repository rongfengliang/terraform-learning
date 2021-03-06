
resource "tls_private_key" "ssh_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "tls_private_key" "ssh_key2" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}
resource "local_file" "file_ssh_key" {
    content  = "${format("%s \n %s \n %s \n %s",tls_private_key.ssh_key.private_key_pem,tls_private_key.ssh_key.public_key_pem,tls_private_key.ssh_key.public_key_openssh,tls_private_key.ssh_key.public_key_fingerprint_md5)}" 
    filename = "${path.module}/ssh_key"
}

resource "local_file" "file_ssh_key2" {
    content  = "${format("%s \n %s \n %s \n %s \n %s \n %s \n %s \n %s",tls_private_key.ssh_key.private_key_pem,tls_private_key.ssh_key.public_key_pem,tls_private_key.ssh_key.public_key_openssh,tls_private_key.ssh_key.public_key_fingerprint_md5,tls_private_key.ssh_key2.private_key_pem,tls_private_key.ssh_key2.public_key_pem,tls_private_key.ssh_key2.public_key_openssh,tls_private_key.ssh_key2.public_key_fingerprint_md5)}" 
    filename = "${path.module}/ssh_key2"
}
