# Terraform Scripts for AWS

Terraform scripts to provision AWS servers to execute performance tests

## Getting Started

For convenience a Vagrant machine with GNU/Linux and the latest
version Terraform is installed by running `agrant up` in the root
directory (As of this writing Terraform v0.11.1).

Make sure your AWS credentials are linked to this directory, so it can be accessed inside the vagrant box. For example:

```
cp ~/.aws/credentials .
```

~/.aws/credentials
```
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

## Debugging
```
export TF_LOG=DEBUG
```