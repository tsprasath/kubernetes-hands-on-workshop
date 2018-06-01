# Accessing the bootstrap node

The output from Terraform should look something like below:

```
Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

bootstrap_ssh_command = ssh -i ssh/cluster.pem root@147.75.197.193
ingress_node_ip = 147.75.192.115
master_node_ip = 147.75.196.59
worker_node_ip = 147.75.73.145
```

## SSH into the bootstrap node

To obtain access to the bootstrap node execute the following command:

```
ssh -i ssh/cluster.pem root@<bootstrap_node_ip>
```

To provision the cluster click [here](5-provision-cluster.md)