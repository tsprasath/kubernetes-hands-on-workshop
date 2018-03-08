# Create the bootstrap node
resource "packet_device" "bootstrap_node" {
  plan             = "${var.instace_type}"
  facility         = "${var.region}"
  operating_system = "${var.instance_operating_system}"
  hostname         = "bootstrap-node"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.default.id}"

  connection {
    type        = "ssh"
    private_key = "${file("${path.module}/../ssh/cluster.pem")}"
    user        = "root"
    timeout     = "2m"
  }

  # ########################################################
  # Upload all the files and directories required.
  # ########################################################

  provisioner "remote-exec" {
    inline = [
      "mkdir /root/kismatic",
    ]
  }

  # Upload the SSH key required to interact with the cluster.
  provisioner "file" {
    source      = "${path.module}/../ssh/cluster.pem"
    destination = "/root/kismatic/cluster.pem"
  }

  # Upload the Makefile to allow for a nice abstraction.
  provisioner "file" {
    source      = "${path.module}/../Makefile"
    destination = "/root/kismatic/Makefile"
  }

  # Upload all the examples.
  provisioner "file" {
    source      = "${path.module}/../examples"
    destination = "/root"
  }

  # Upload the kismatic-cluster.yaml
  provisioner "file" {
    content = "${data.template_file.kismatic_cluster.rendered}"
    destination = "/root/kismatic/kismatic-cluster.yaml"
  }

  # Upload the bootstrap provisioning script
  provisioner "file" {
    source      = "${path.module}/user-data/bootstrap-provisioning-script.sh"
    destination = "/root/kismatic/bootstrap-provisioning-script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /root/kismatic/bootstrap-provisioning-script.sh",
      "/root/kismatic/bootstrap-provisioning-script.sh args",
    ]
  }
}