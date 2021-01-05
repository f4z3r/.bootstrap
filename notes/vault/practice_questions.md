# HCVA Practice Questions
@vault

* [Policies](#policies)
  * [You want to permit reading the "teamb" path under any top-lvel path under secret/. How do you define the policy?](#you-want-to-permit-reading-the-"teamb"-path-under-any-top-lvel-path-under-secret/.-how-do-you-define-the-policy?)
  * [Why policies with list capabilities should end with a trailing slash?](#why-policies-with-list-capabilities-should-end-with-a-trailing-slash?)
  * [What are all the available capabilities for the policies?](#what-are-all-the-available-capabilities-for-the-policies?)
  * [What are templated policies?](#what-are-templated-policies?)
  * [What is the root policy?](#what-is-the-root-policy?)
  * [What is the default policy?](#what-is-the-default-policy?)
  * [Why the vault is secure by default?](#why-the-vault-is-secure-by-default?)
  * [What is the best practice when defining policies?](#what-is-the-best-practice-when-defining-policies?)
  * [What is the deny capability?](#what-is-the-deny-capability?)
  * [What is the sudo capability?](#what-is-the-sudo-capability?)
  * [You have a requirement to list existing policies. How do you define the policy?](#you-have-a-requirement-to-list-existing-policies.-how-do-you-define-the-policy?)
  * [You have a requirement to create and manage ACL policies. How do you define the policy?](#you-have-a-requirement-to-create-and-manage-acl-policies.-how-do-you-define-the-policy?)
  * [You have a requirement to enable and manage authentication methods broadly across vault. How do you define the policy?](#you-have-a-requirement-to-enable-and-manage-authentication-methods-broadly-across-vault.-how-do-you-define-the-policy?)
  * [You have a requirement to create, update, and delete auth methods. How to you define the policy?](#you-have-a-requirement-to-create,-update,-and-delete-auth-methods.-how-to-you-define-the-policy?)
  * [You have a requirement to manage the secrets engine. How do you define the policy?](#you-have-a-requirement-to-manage-the-secrets-engine.-how-do-you-define-the-policy?)
  * [What are the built-in policies in the vault?](#what-are-the-built-in-policies-in-the-vault?)
  * [You can't modify the default policy true/false?](#you-can't-modify-the-default-policy-true/false?)
  * [How do you create a token without a default policy attached to it?](#how-do-you-create-a-token-without-a-default-policy-attached-to-it?)
  * [You want to create a policy at the path secret/foo with the parameters named bar and baz. There parameters are required. How to you define the policy?](#you-want-to-create-a-policy-at-the-path-secret/foo-with-the-parameters-named-bar-and-baz.-there-parameters-are-required.-how-to-you-define-the-policy?)
  * [How do you whitelist a list of keys and values that are permitted on the given path when defining the policy?](#how-do-you-whitelist-a-list-of-keys-and-values-that-are-permitted-on-the-given-path-when-defining-the-policy?)
  * [How do you blacklist a list of keys and values that are permitted on the given path when defining the policy?](#how-do-you-blacklist-a-list-of-keys-and-values-that-are-permitted-on-the-given-path-when-defining-the-policy?)
  * [You want to access root-protected paths with the token. Which capability should you give?](#you-want-to-access-root-protected-paths-with-the-token.-which-capability-should-you-give?)
  * [Of all capabilities, which takes precedence when specified?](#of-all-capabilities,-which-takes-precedence-when-specified?)
  * [Which parameters in the policy should you specify minimum on TTLs when requesting that a response be wrapped, which a granularity of a second?](#which-parameters-in-the-policy-should-you-specify-minimum-on-ttls-when-requesting-that-a-response-be-wrapped,-which-a-granularity-of-a-second?)
  * [Which parameters in the policy should you specify maximum on TTLs when requesting that a response be wrapped, which a granularity of a second?](#which-parameters-in-the-policy-should-you-specify-maximum-on-ttls-when-requesting-that-a-response-be-wrapped,-which-a-granularity-of-a-second?)
  * [Which is the command to list all the registered policies?](#which-is-the-command-to-list-all-the-registered-policies?)
  * [The path `auth/token` requires a root token or sudo capability in the policy. True/False?](#the-path-`auth/token`-requires-a-root-token-or-sudo-capability-in-the-policy.-true/false?)
  * [The path `sys/rotate` requires a root token or sudo capability in the policy. True/False?](#the-path-`sys/rotate`-requires-a-root-token-or-sudo-capability-in-the-policy.-true/false?)
* [Tokens](#tokens)
  * [What is a Vault token?](#what-is-a-vault-token?)
  * [What is a service token?](#what-is-a-service-token?)
  * [What is a batch token?](#what-is-a-batch-token?)
  * [Why service tokens can affect vault performance?](#why-service-tokens-can-affect-vault-performance?)
  * [Why batch tokens are considered lightweight?](#why-batch-tokens-are-considered-lightweight?)
  * [You have service and batch tokens. Which token is generally preferred and why?](#you-have-service-and-batch-tokens.-which-token-is-generally-preferred-and-why?)
  * [When do you use batch tokens and give an example?](#when-do-you-use-batch-tokens-and-give-an-example?)
  * [Batch tokens can't be root tokens and can't be used to create tokens. Is this correct?](#batch-tokens-can't-be-root-tokens-and-can't-be-used-to-create-tokens.-is-this-correct?)
  * [You can't renew batch tokens and can't have explicit max TTL. Is this correct?](#you-can't-renew-batch-tokens-and-can't-have-explicit-max-ttl.-is-this-correct?)
  * [What is the difference in behaviour with the service and batch tokens when the parent token is revoked?](#what-is-the-difference-in-behaviour-with-the-service-and-batch-tokens-when-the-parent-token-is-revoked?)
  * [Describe root token?](#describe-root-token?)
  * [70. What is a token accessor?](#70.-what-is-a-token-accessor?)
  * [79. What is the endpoint to create orphan token?](#79.-what-is-the-endpoint-to-create-orphan-token?)
  * [81. What is the endpoint to revoke the orphan?](#81.-what-is-the-endpoint-to-revoke-the-orphan?)
  * [82. Why should orphan revocation be used with caution?](#82.-why-should-orphan-revocation-be-used-with-caution?)
  * [83. How do you create tokens with limitations on the number of uses?](#83.-how-do-you-create-tokens-with-limitations-on-the-number-of-uses?)
* [Leases](#leases)


## Policies

### You want to permit reading the "teamb" path under any top-lvel path under secret/. How do you define the policy?

```hcl
path "secret/+/teamb" {
  capabilities = [ "read" ]
}
```

### Why policies with list capabilities should end with a trailing slash?

> WRONG
> When providing a list capability, it is important to note that since listing always operates
> on a prefix, policies must operate on a prefix because Vault will sanitize request paths to be
> prefixes. In other words, policy paths targeting list capabilities should end with a trailing
> slash.

### What are all the available capabilities for the policies?

- read
- write
- update
- list

> WRONG
> create: PUT/POST create data.
> read: GET read the data.
> update: PUT/POST modify the data.
> delete: DELETE delete the data.
> list: LIST list values at the given path.
> sudo: makes a path root-protected. Token needs sudo capability on the path, in addition to the
> other capabilities.
> deny: disallows access. Takes full precedence.


### What are templated policies?

> WRONG
> The policy syntax allows for doing variable replacement in some policy strings with values
> available to the token. Currently identity information can be injected, and currently the path
> keys in policies allow injection:
> 
> ```hcl
> path "secret/data/{{identity.entity.id}}/*" {
>   capabilities = [ ... ]
> }
> ```

### What is the root policy?

The policy attached to a root token. It has superuser rights and allows to do any action in the
Vault.

### What is the default policy?

It is a policy attached to every token, which provides basic access to system paths that are
required to perform basic actions.

> Provide the token with the ability to reflect and manage itself. Solution did not state that it is
> attached to every token by default.

### Why the vault is secure by default?

All data is always store in encrypted form, both at rest and in transit. The encryption key to
enable access to the data is never stored to disk, but can be accessed via a core dump since it is
kept in memory.

> Policy defines a list of paths. Each path expresses the capabilities that are allowed.
> Capabilities for a path must be granted, as Vault defaults to denying capabilities to paths to
> ensure that is is secure by default.

### What is the best practice when defining policies?

Use the principle of least privilege. Only allow what is strictly necessary.

> Restrict the use of root policy.

### What is the deny capability?

It is the capability allowing to deny any action on a path. It takes precedence over any other
capability.

### What is the sudo capability?

A capability which implies that the token must be sudo enabled to perform any action on the path.
The remaining capabilities still apply.

> WRONG-ISH
> It allows access to paths that are root protected. This cannot be added to non root-protected
> paths to make them root-protected.

> This is not 100% clear to me.

### You have a requirement to list existing policies. How do you define the policy?

```hcl
path "sys/policy/" {
  capabilities = [ "list" ]
}
```

> WRONG
>
> ```hcl
> path "sys/policies/acl" {
>   capabilities = [ "list" ]
> }
> ```

### You have a requirement to create and manage ACL policies. How do you define the policy?

```hcl
path "sys/policy/*" {
  capabilities = [ "create", "update", "delete" ]
}
```

> WRONG
> 
> ```hcl
> path "sys/policies/acl" {
>   capabilities = [ "create", "update", "delete", "read", "list", "sudo" ]
> }
> ```

### You have a requirement to enable and manage authentication methods broadly across vault. How do you define the policy?

```hcl
path "sys/auth/*" {
  capabilities = [ "create", "update", "list", "sudo", "read", "delete" ]
}
```

### You have a requirement to create, update, and delete auth methods. How to you define the policy?

```hcl
path "sys/auth/*" {
  capabilities = [ "create", "update", "sudo", "delete" ]
}
```

### You have a requirement to manage the secrets engine. How do you define the policy?

```hcl
path "sys/mounts/*" {
  capabilities = [ "create", "update", "sudo", "delete" ]
}
```

### What are the built-in policies in the vault?

The root and default policies.

### You can't modify the default policy true/false?

True

> WRONG
> False

### How do you create a token without a default policy attached to it?

> WRONG
> ```bash
> vault token create -no-default-policy
> ```

### You want to create a policy at the path secret/foo with the parameters named bar and baz. There parameters are required. How to you define the policy?

```hcl
path "secret/foo" {
  capabilities = [ "create" ]
  required_parameters = [ "bar", "baz" ]
}
```

### How do you whitelist a list of keys and values that are permitted on the given path when defining the policy?

With the `parameters` attribute.

> WRONG
> With `allowed_parameters`.

### How do you blacklist a list of keys and values that are permitted on the given path when defining the policy?

Using the `denied_parameters` attribute.

### You want to access root-protected paths with the token. Which capability should you give?

The `sudo` capability plus any capability you need to perform the action you want to perform.

### Of all capabilities, which takes precedence when specified?

`deny`

### Which parameters in the policy should you specify minimum on TTLs when requesting that a response be wrapped, which a granularity of a second?

The `min_wrapping_ttl` attribute.

### Which parameters in the policy should you specify maximum on TTLs when requesting that a response be wrapped, which a granularity of a second?

The `max_wrapping_ttl` attribute.

### Which is the command to list all the registered policies?

The `vault policy list` command.

> `vault read sys/policy`
> This also works, but is not as nice as `vault policy list`.

### The path `auth/token` requires a root token or sudo capability in the policy. True/False?

True

### The path `sys/rotate` requires a root token or sudo capability in the policy. True/False?

True

## Tokens

### What is a Vault token?

A vault token is a way to identify a user or service to the Vault. It is handed out once the user
has authenticated to be used for further requests. Tokens have attached policies to determine the
actions that are allowed to perform with the token.

### What is a service token?

A service token is a "regular" token. It is attached to every request to authenticate the
user/service and can be used for a variety of things.

> They support all features, such as renewal, revocation, creating child tokens, and more.

### What is a batch token?

A batch token is more lightweight than a service token. However, it only supports very basic
features.

> Batch tokens require no information to be placed in storage to track them. They lack most of the
> flexibility and features of service tokens.

### Why service tokens can affect vault performance?

Because they require storage to be tracked. Thus the more tokens are tracked, the more storage needs
to be read and written based on token access. Since storage access is typically slow, this can
affect performance.

> The storage must be replicated across primary and secondary clusters for DR (disaster recovery)
> replication.

### Why batch tokens are considered lightweight?

Because they do not require storage access, and their creation scales across performance replication
clusters.

> They are not part of data replication process as they are neither persisted to disk nor live in
> memory.

### You have service and batch tokens. Which token is generally preferred and why?

Generally the service tokens are preferred as they offer more features. However, batch tokens might
be better in a use case where performance is critical and where a large number of tokens are issued
to users/services.

### When do you use batch tokens and give an example?

In case performance is critical.

> Think of a scenario where you have a large number of containers (100k+) start up and all request a
> token from Vault. The use of batch tokens can reduce the stress on the storage backend and improve
> the overall performance.

### Batch tokens can't be root tokens and can't be used to create tokens. Is this correct?

Yes

### You can't renew batch tokens and can't have explicit max TTL. Is this correct?

Yes

### What is the difference in behaviour with the service and batch tokens when the parent token is revoked?

The batch token ceases to exist.

> Batch token "stops working" vs is revoked.

### Describe root token?

A token with superuser rights.

> Only token that can be set to never expire. Purposefully hard to create.

### 70. What is a token accessor?

When a token is created, a token accessor is also created and returned. The accessor is a way to
reference the token and can be used to perform limited actions:

- Look up a token's properties (not the actual ID).
- Look up a token's capabilities on a path.
- Renew the token.
- Revoke the token.

The token used to perform the calls for the accessor above must of course have the appropriate
permissions.

Such tokens are useful when a service creates a token in the name of another. It can forward the
token while storing the accessor, and use this to revoked the token once it knows that the second
service has completed its task.

### 79. What is the endpoint to create orphan token?

`auth/token/create-orphan`


### 81. What is the endpoint to revoke the orphan?

`auth/token/revoke-orphan`

> IMO this is not true. An orphan token can be revoked via the normal revocation endpoint. The above
> is another revocation strategy, that has nothing to do with the orphan status of the token being
> revoked.

### 82. Why should orphan revocation be used with caution?

The endpoint revokes the given token but rather than revoke the rest of the tree, it instead sets
the token's immediate children to be orphans.

### 83. How do you create tokens with limitations on the number of uses?

Using the `-use-limit=n` parameter:

```bash
vault token create -policy=whatever -use-policy=2
```

## Leases


