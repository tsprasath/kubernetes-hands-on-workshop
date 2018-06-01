# Note: The 'v' below is important.
KISMATIC_VERSION=v1.11.1

ssh-keypair:
	mkdir ssh
	cd ssh && ssh-keygen -t rsa -f cluster.pem -N ""
	chmod 600 ssh/cluster.pem

plan-cluster:
	cd terraform && terraform init && terraform plan

cluster:
	cd terraform && terraform init && terraform apply -auto-approve

get-dependencies:
	wget https://github.com/apprenda/kismatic/releases/download/$(KISMATIC_VERSION)/kismatic-$(KISMATIC_VERSION)-linux-amd64.tar.gz
	tar xvf kismatic-$(KISMATIC_VERSION)-linux-amd64.tar.gz
	cp helm /usr/local/bin/helm
	cp kubectl /usr/local/bin/kubectl
	echo 'source <(kubectl completion bash)' >> ~/.bashrc
	cp kismatic /usr/local/bin/kismatic
	rm -f kismatic-$(KISMATIC_VERSION)-linux-amd64.tar.gz

provision-cluster: get-dependencies
	chmod 600 cluster.pem
	kismatic install apply -f kismatic-cluster.yaml --verbose
	cp generated/kubeconfig .
	mkdir ~/.kube/
	cp kubeconfig ~/.kube/config

destroy-cluster:
	cd terraform && terraform init && terraform destroy --force
	rm -rf ssh