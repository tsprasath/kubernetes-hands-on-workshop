# Create the Kubernetes master nodes (e.g. master1)
resource "packet_device" "master_nodes" {
  count            = "${var.master_count}"
  plan             = "${var.instace_type}"
  facility         = "${var.region}"
  operating_system = "${var.instance_operating_system}"
  hostname         = "${format("master%1d", count.index + 1)}"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.default.id}"

  connection {
    type        = "ssh"
    private_key = "${file("${path.module}/../ssh/cluster.pem")}"
    user        = "root"
    timeout     = "2m"
  }

  # Disable swap memory - requirement for Kubernetes 1.8+
  provisioner "remote-exec" {
    inline = [
      "sudo swapoff -a",
    ]
  }
}

# Create the Kubernetes Etcd nodes (e.g. etcd1)
resource "packet_device" "etcd_nodes" {
  count            = "${var.etcd_count}"
  plan             = "${var.instace_type}"
  facility         = "${var.region}"
  operating_system = "${var.instance_operating_system}"
  hostname         = "${format("etcd%1d", count.index + 1)}"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.default.id}"

  connection {
    type        = "ssh"
    private_key = "${file("${path.module}/../ssh/cluster.pem")}"
    user        = "root"
    timeout     = "2m"
  }

  # Disable swap memory - requirement for Kubernetes 1.8+
  provisioner "remote-exec" {
    inline = [
      "sudo swapoff -a",
    ]
  }
}

# Create the Kubernetes worker nodes (e.g. worker1)
resource "packet_device" "worker_nodes" {
  count            = "${var.worker_count}"
  plan             = "${var.instace_type}"
  facility         = "${var.region}"
  operating_system = "${var.instance_operating_system}"
  hostname         = "${format("worker%1d", count.index + 1)}"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.default.id}"

  connection {
    type        = "ssh"
    private_key = "${file("${path.module}/../ssh/cluster.pem")}"
    user        = "root"
    timeout     = "2m"
  }

  # Disable swap memory - requirement for Kubernetes 1.8+
  provisioner "remote-exec" {
    inline = [
      "sudo swapoff -a",
    ]
  }
}

# Create the Kubernetes ingress nodes (e.g. ingress1)
resource "packet_device" "ingress_nodes" {
  count            = "${var.ingress_count}"
  plan             = "${var.instace_type}"
  facility         = "${var.region}"
  operating_system = "${var.instance_operating_system}"
  hostname         = "${format("ingress%1d", count.index + 1)}"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.default.id}"

  connection {
    type        = "ssh"
    private_key = "${file("${path.module}/../ssh/cluster.pem")}"
    user        = "root"
    timeout     = "2m"
  }

  # Disable swap memory - requirement for Kubernetes 1.8+
  provisioner "remote-exec" {
    inline = [
      "sudo swapoff -a",
    ]
  }
}
