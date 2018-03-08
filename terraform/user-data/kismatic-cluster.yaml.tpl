cluster:
  name: kubernetes
  version: v1.9.3
  disable_package_installation: false
  disconnected_installation: false
  admin_password: password

  networking:
    pod_cidr_block: 172.16.0.0/16
    service_cidr_block: 172.20.0.0/16
    update_hosts_files: true
    http_proxy: ""
    https_proxy: ""
    no_proxy: ""

  certificates:
    expiry: 17520h
    ca_expiry: 17520h

  ssh:
    user: root
    ssh_key: /root/kismatic/cluster.pem
    ssh_port: 22

  # Override configuration of Kubernetes components.
  kube_apiserver:
    option_overrides: {}

  kube_controller_manager:
    option_overrides: {}

  kube_scheduler:
    option_overrides: {}

  kube_proxy:
    option_overrides: {}

  kubelet:
    option_overrides: {}

  cloud_provider:
    provider: ""
    config: ""

# Docker daemon configuration of all cluster nodes.
docker:
  disable: false
  logs:
    driver: json-file
    opts:
      max-file: "1"
      max-size: 3m

  storage:

    # Leave empty to have docker automatically select the driver.
    driver: ""
    opts: {}

    # Used for setting up Device Mapper storage driver in direct-lvm mode.
    direct_lvm_block_device:
      path: ""
      thinpool_percent: "95"
      thinpool_metapercent: "1"
      thinpool_autoextend_threshold: "80"
      thinpool_autoextend_percent: "20"

docker_registry:
  server: ""
  CA: ""
  username: ""
  password: ""

add_ons:
  cni:
    disable: false
    provider: calico
    options:
      calico:
        mode: overlay
        log_level: info
        workload_mtu: 1500
        felix_input_mtu: 1440
        ip_autodetection_method: first-found

  dns:
    disable: false
    provider: coredns

  heapster:
    disable: false
    options:
      heapster:
        replicas: 2
        service_type: ClusterIP
        sink: influxdb:http://heapster-influxdb.kube-system.svc:8086
      influxdb:
        pvc_name: ""

  metrics_server:
    disable: false

  dashboard:
    disable: false

  package_manager:
    disable: false
    provider: helm
    options:
      helm:
        namespace: kube-system

  rescheduler:
    disable: false

etcd:
  expected_count: 1
  nodes:
  - host: etcd1
    ip: ${etcd_ip}
    labels: {}

master:
  expected_count: 1
  load_balanced_fqdn: ${master_ip}
  load_balanced_short_name: ${master_ip}
  nodes:
  - host: master1
    ip: ${master_ip}
    labels: {}

worker:
  expected_count: 1
  nodes:
  - host: worker1
    ip: ${worker_ip}
    labels: {}

ingress:
  expected_count: 1
  nodes:
  - host: ingress1
    ip: ${ingress_ip}
    labels: {}

storage:
  expected_count: 0
  nodes: []

nfs:
  nfs_volume: []