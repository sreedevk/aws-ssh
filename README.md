# AWS-SSH

### Dynamically SSH Into AWS EC2 Instances at Lightning Speed

`aws-ssh` is a configurable shell helper that's written purely in bash (compatible with zsh).
it uses `fzf`, `jq` & `aws-cli` under the hood to make ssh-ing into aws instances easy.

![2022-01-08-142840_2066x1158_scrot](https://user-images.githubusercontent.com/36154121/148638437-d42d8d8f-6b00-4b7b-a008-fd3b24798ef4.png)

## Pre-Requisites
1. Make sure that you have [fzf](https://github.com/junegunn/fzf), [jq](https://stedolan.github.io/jq/) & [aws-cli](https://aws.amazon.com/cli/) installed & configured
2. `aws configure` should've been run & authenticated prior to using aws-ssh

## Installation (Script)
1. Run the Installation Script

```bash
  curl https://raw.githubusercontent.com/sreedevk/aws-ssh/main/install.sh | bash
```
* Don't forget to inspect random scripts you find on the internet before you pipe it into bash.

2. check and fix configuration @ ~/.aws-ssh-config

## Installation (Manual)
1. Clone the repository into a convenient location
```bash
  git clone https://github.com/sreedevk/aws-ssh ~/.local/aws-ssh/
```

2. Add The `aws-ssh` executable to `$PATH` in your `.zshrc` or `.bashrc`
```bash
export PATH="$PATH:$HOME/.local/aws-ssh/"
```
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

## Usage
```
=======================================================================
AWS-SSH: Connect to AWS EC2 Instances at Lightning Speed
=======================================================================

Usage:
List Instances:	aws-ssh list <partial-search-term>
Connect:	aws-ssh connect <instance-name-search-term> <username>

Notes:
<username> will be taken from ~/.aws-ssh-config if not provided
Bastion Servers can be configured in ~/.aws-ssh-config
Private Keys (*.pem) can be configured in ~/.aws-ssh-config

Example ~/.aws-ssh-config:

PRIVATE_KEY=~/.ssh/somekey.pem
BASTION=username@192.168.50.100
DEFAULT_USER=ec2-user
```
