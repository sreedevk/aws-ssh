# AWS-SSH - Dynamically SSH Into AWS EC2 Instances 

`aws-ssh` is a configurable shell helper that's written purely in bash (compatible with zsh).
it uses `fzf`, `jq` & `aws-cli` under the hood to make ssh-ing into aws instances easy.

## Pre-Requisites
1. Make sure that you have [fzf](https://github.com/junegunn/fzf), [jq](https://stedolan.github.io/jq/) & [aws-cli](https://aws.amazon.com/cli/) installed & configured

## Installation
There is not formal installation process as of yet, You can clone this repo locally & make sure that the
`aws-ssh` executable is in `$PATH`.

## Configuration
The configuration file for aws-ssh should be present at `~/.aws-ssh-config`. It's not required to have configuration.

Use this as the configuration templates:

```bash
PRIVATE_KEY=~/.ssh/somekey.pem
BASTION=username@192.168.50.100
DEFAULT_USER=ec2-user
```
