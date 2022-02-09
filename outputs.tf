# Copyright (c) 2022 Oracle and/or its affiliates.

output "pub_ip" {
  value = oci_core_instance.ruby.public_ip
}

output "ssh_cmd" {
  value = "ssh opc@${oci_core_instance.ruby.public_ip}"
}
