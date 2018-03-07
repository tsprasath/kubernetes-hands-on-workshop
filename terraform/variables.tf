variable "packet_api_key" {
  description = "Your packet api key"
}

variable "packet_project_name" {
  default = "kubernetes-hands-on-workshop"
}

variable region {
  description = "Region to launch in"
  default     = "ewr1"
}

variable instance_operating_system {
  description = "Name of the image to use"
  default     = "ubuntu_16_04"
}

variable instace_type {
  description = "Instance type for machine"
  default     = "baremetal_0"
}

variable master_count {
  description = "Number of k8s master droplets"
  default     = 1
}

variable etcd_count {
  description = "Number of etcd droplets"
  default     = 1
}

variable worker_count {
  description = "Number of k8s worker droplets"
  default     = 1
}

variable ingress_count {
  description = "Number of k8s ingress droplets"
  default     = 1
}
