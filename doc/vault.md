# Vault

* [Installation](#installation)
* [Setup](#setup)
* [Key Value Secret Store](#key-value-secret-store)
* [AWS Backend](#aws-backend)
* [Authentication](#authentication)

---

## Installation

Install `vault` from the package registry.

## Setup

A dev server can be started with:

```bash
vault server -dev
```

Use the returned `VAULT_ADDR` and (root) `VAULT_TOKEN` as environment variables to tell the vault
client where to connect to. Then use `vault status` to check if the server is up and running.

## Secret Engines

### Key Value Secret Store

Vault can be used to store secrets as key value pairs:

```bash
# create secret
vault kv put secret/sham hello=world [other secrets kvs]
# retrieve secret
vault kv get -field=hello secret/sham
vault kv get -format=json secret/sham
# delete secret
vault kv delete secret/sham
```

Note that we need to use the `secret/` path prefix because the path prefix is used by Vault to
determine which secret engine to send the request to. By default Vault starts a `kv` secret engine
on the `secret/` path. To enable another, use:

```bash
vault secrets enable -path=kv kv
# equivalent to (path is name of engine by default)
vault secrets enable kv
# disable and remove all secrets from a secret engine under a specific path
vault secrets disable kv/
```

Then secrets could also be stored under `kv/<name>`.

Secret engines can be listed using:

```bash
vault secrets list
```

### AWS Backend

Create an AWS account and get an access key and secret key for Vault. Then configure the AWS secrets
engine:

```bash
vault secrets enable aws
vault write aws/config/root \
  access_key=<key> \
  secret_key=<key> \
  region=eu-central-1
vault write aws/roles/my-role \
  credential_type=iam_uer \
  policy_document=-<<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1426528957000",
        "Effect": "Allow",
        "Action": ["ec2:*"],
        "Resource": ["*"]
      }
    ]
  }
EOF
```

This created a secret engine backend for AWS, added a root access and secret key for vault to
connect to AWS for credential generation, and created a role. The role determines the policy to
define what kind of credential to generate when it is read. In this case a IAM user with permissions
to perform any EC2 actions, but nothing else.

To obtain a credential, use:

```bash
vault read aws/creds/my-role
# Key                Value
# ---                -----
# lease_id           aws/creds/my-role/380XFWwfASyAM1oZKcqm4Lp4
# lease_duration     768h
# lease_renewable    true
# access_key         AKIAXN43Z6IIYC47BAGR
# secret_key         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
# security_token     <nil>
```

This is a dynamic temporary role valid for 768 hours. Use the returned path to revoke the secret:

```bash
vault lease revoke aws/creds/my-role/380XFWwfASyAM1oZKcqm4Lp4
```

## Authentication

### Token

The primary means of authentication for Vault is via tokens. To create a child token of the current
active one use:

```bash
vault token create
# use the returned token to login into vault
vault login <token>
# and can be revoked again as well
vault token revoke <token>
```

### GitHub

Enable the GitHub authentication method to authenticate in Vault using their GitHub credentials:

```bash
vault auth enable github
```

Then set an organization, which determines which users are allowed to authenticate with Vault:

```bash
vault write auth/github/config organization=hashicorp
```

Teams within the organization can be granted access to different policies. For instance:

```bash
vault write auth/github/map/teams/engineering value=default,applications
```

grants the `engineering` team the `default` and `applications` policies.

The GitHub login method can now be used to obtain a token:

```bash
# using a personal access token for GitHub
vault login -method=github token=abcd1234
```

To revoke all tokens provided by GitHub, use:

```bash
vault token revoke -mode path auth/github
# and possibly disable GitHub as an authentication method
vault auth disable github
```

## Policies

Policies are defined on paths and use the HCL configuration language. By default the longest match
will determine what clause of a policy to apply. Thus an exact match has priority, followed with the
longest glob.

```bash
vault policy read <policy>
vault policy write <policy> [config]
vault policy list
# create a token with a policy
vault token create -policy=<policy>
```

The `default` policy provides simple default policy that is automatically attacked to new tokens.
The `root` policy provides super admin rights.

How policies are associated with auth methods depends on the auth method. But Vault supports linking
auth methods to the policies they will provide their tokens with. This enables to provide fine
grained access to users based on how they logged in.
