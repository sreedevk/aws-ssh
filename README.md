# AWS-SSH

### Dynamically SSH Into AWS EC2 Instances at Lightning Speed

`aws-ssh` is a bash script for conveniently ssh-ing into AWS EC2 instances.
it uses `fzf`, `jq` & `aws-cli` under the hood.

## Pre-Requisites
1. aws-ssh requires bash to be installed (even when running the script in other shells)  
2. make sure you have the following programs installed  
    1. [fzf](https://github.com/junegunn/fzf)  
    2. [jq](https://stedolan.github.io/jq/)  
    3. [aws-cli](https://aws.amazon.com/cli/) installed & configured  
3. `aws configure` should've been run & authenticated prior to using aws-ssh  

## Installation
1. fetch the `aws-ssh` script using `wget`  

```bash
  wget https://raw.githubusercontent.com/sreedevk/aws-ssh/main/aws-ssh -P ~/.local/bin
```

NOTE: run `echo $PATH` & ensure that `~/.local/bin` is included in $PATH.

2. Run `chmod` to mark `~/.local/bin/aws-ssh` as executable

```bash
  chmod +x ~/.local/bin/aws-ssh
```

## Usage
```
=======================================================================
AWS-SSH: Connect to AWS EC2 Instances at Lightning Speed
=======================================================================

Usage:
list instances:	    aws-ssh list <partial-search-term>
connect:	        aws-ssh connect <partial-search-term> <username>
private ip connect: aws-ssh priconn <partial-search-term> <username>
public  ip connect: aws-ssh pubconn <partial-search-term> <username>

Notes:
<partial-search-tearm> matchs "instance name" and "instance id"
<username> will be taken from ~/.aws-ssh-config if not provided
Bastion Servers can be configured in ~/.aws-ssh-config
Private Keys (*.pem) can be configured in ~/.aws-ssh-config

Example ~/.aws-ssh-config:

PRIVATE_KEY=~/.ssh/somekey.pem
BASTION=username@192.168.50.100
DEFAULT_USER=ec2-user
```

## Configuration (Optional)

`aws-ssh` can be configured to set some default options.
The configuration file for `aws-ssh` should be present at `~/.aws-ssh-config`.

The `~/.aws-ssh-config` is just a bash script that is sourced by `aws-ssh` before execution.
The following can be added to `~/.aws-ssh-config`

1. PRIVATE_KEY

The path to the key to be passed into the `-i` option while ssh-ing. if not configured, the `-i` is omitted.

```bash
PRIVATE_KEY=~/.ssh/somekey.pem
```

2. BASTION
The jump/bastion server to use while ssh-ing into ec2-instances.

```bash
BASTION=username@192.168.50.100
```

Note:
When `BASTION` variable is not set, SSH will establish a connection using the public address

3. DEFAULT_USER

if the username part is omitted while using `aws-ssh connect <instance-name> <username>`, the `DEFAULT_USER` will be used.
This can be beneficial if you have the same username for most ec2-instances, as you won't have to type the username each time.

```bash
DEFAULT_USER=ec2-user
```

EXAMPLE `~/.aws-ssh-config`

```bash
PRIVATE_KEY=~/.ssh/somekey.pem
BASTION=username@192.168.50.100
DEFAULT_USER=ec2-user
```
