# Upload SSH key which all instances will use.
resource "packet_ssh_key" "default" {
  public_key = "${file("${path.module}/../ssh/cluster.pem.pub")}"
  name       = "${var.packet_project_name}"
}

# Create a new tag
resource "packet_project" "default" {
  name = "${var.packet_project_name}"
}

# Interpolate the generated values into the kismatic-cluster.yaml
data "template_file" "kismatic_cluster" {
  template = "${file("${path.module}/user-data/kismatic-cluster.yaml.tpl")}"

  vars {
    etcd_ip = "${packet_device.etcd_nodes.0.access_public_ipv4 }"
    master_ip = "${packet_device.master_nodes.0.access_public_ipv4 }"
    worker_ip = "${packet_device.worker_nodes.0.access_public_ipv4 }"
    ingress_ip = "${packet_device.ingress_nodes.0.access_public_ipv4 }"
  }
}