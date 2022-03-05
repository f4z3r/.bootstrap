# Java

> TODO: not tested

First, ensure `coc` is properly set up.

## Coc Extension

Install the `coc` extension.

```viml
CocInstall coc-java
```

## Setup

Install the Java version you want via `asdf`.

Download `jdtls` and extract it to:

```
/home/jakob/.config/coc/extensions/coc-java-data
```

Once this is done, make sure you set the Java home from `asdf` in `coc-settings.json`. For instance:

```json
{
  "java.home": "/home/jakob/.asdf/installs/java/openjdk-11"
}
```
