# V

First, ensure `coc` is properly set up.

* [Virtualization](#virtualization)
* [Language Server](#language-server)
* [Fixers](#fixers)

## Virtualisation

Use `asdf` to virtualise the entire V installation to fix a specific version.

> This currently often leads to problems though. V is not stable enough for this to reliably work.


## Language Server

You can install the language server using `v ls --install`. Launching it on V files should already
be automated.

## Fixers

V uses its own fixer called `v fmt`. This is automatically included in the ALE configuration in this
repo.
