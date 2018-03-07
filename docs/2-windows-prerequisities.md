# Prerequisities for Windows users

## 1. Terraform

Open a Powershell window **as Administrator** (right click on Powershell and select "Run as adminstrator") and execute `Set-ExecutionPolicy unrestricted`

To locate the version of PowerShell you are running execute the following command:

```
$ $PSVersionTable.PSVersion
```

If you are running PowerShell v2 execute the following command:

```
$ iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

If you are running PowerShell v3 or above execute the following command:

```
$ iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```

Once Chocolatey is installed execute the following commands:

```
$ choco install terraform -y
$ choco install git.install -y
$ choco install make -y
```

## 2. Clone the repo

Now clone the repo by executing `git clone https://github.com/swade1987/kubernetes-hands-on-workshop.git`

## 3. Packet.net account

You will also require an account on [https://www.packet.net/](https://www.packet.net/)

## 4. Construct the infrastructure

To construct the cluster follow the steps [here](3-build-cluster.md)