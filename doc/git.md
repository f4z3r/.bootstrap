# GIT

## GPG

Generate a `gpg` key using:

```sh
gpg --full-generate-key
```

Enter your information and register the key under the address you plan to use to commit. Then print
the key ID with:

```sh
gpg --list-secret-keys --keyid-format=long
```

```
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot 
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```

The string after `sec` is the ID in format `<key-type>/<id>`, so the ID here is `3AA5C34371567BD2`.

Then copy the key with the command below and register it on your git account:

```sh
gpg --armor --export 3AA5C34371567BD2
```
