output "bootstrap_ssh_command" {
  value = "ssh -i ssh/cluster.pem root@${packet_device.bootstrap_node.access_public_ipv4 }"
}

output "master_node_ip" {
  value = "${join(",",packet_device.master_nodes.*.access_public_ipv4 )}"
}

output "worker_node_ip" {
  value = "${join(",",packet_device.worker_nodes.*.access_public_ipv4 )}"
}

output "ingress_node_ip" {
  value = "${join(",",packet_device.ingress_nodes.*.access_public_ipv4 )}"
}