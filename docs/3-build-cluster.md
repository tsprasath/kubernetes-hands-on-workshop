# Build the Kubernetes cluster

## Prerequisite

All commands need to be executed from the repositories root directory via Terminal or Git Bash.

When you execute `pwd` you should see `kubernetes-hands-on-workshop` (see below):

```
github.com/swade1987/kubernetes-hands-on-workshop
```

## 1. Generate new SSH keypair

Before creating our infrastructure we need to create an SSH keypair.

This key will be used by both Terraform and the Kismatic Toolkit.

If you are using a Macbook or Linux, execute: `make ssh-keypair`.

If on Windows execute the following commands via gitbash:

```
$ make ssh-keypair
```

## 2. Create Infrastructure

Before executing Terraform you need to create an Packet auth token.

To see the changes which are going to be made execute the following commands:

Note: You will need to paste in the Auth Token during the Terraform execution.

Execute the following commands via the Terminal or Git Bash:

```
$ make cluster
```

## 3. Provisioning the Kubernetes cluster using Kismatic

To provision the cluster follow the steps [here](4-accessing-the-bootstrap-node.md)
