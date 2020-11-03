# C/Cpp/Obj-C

> FIXME(@jakob): not tested

First, ensure `coc` is properly set up.

* [Coc Extension](#coc-extension)
* [Tools](#tools)
  * [Clangd](#clangd)
  * [clang-format](#clang-format)
  * [uncrustify](#uncrustify)
  * [flawfinder](#flawfinder)
  * [cpplint](#cpplint)
* [Notes](#notes)

## Coc Extension

Install the `coc` extension.

```viml
CocInstall coc-clangd
```

## Tools

### Clangd

### clang-format

Configuration available

### uncrustify

### flawfinder

pipx

### cpplint

pipx

## Notes

```json
"languageserver": {
        "ccls": {
            "command": "ccls",
            "filetypes": ["c", "cpp", "objc", "objcpp"],
            "rootPatterns": [".ccls", "compile_commands.json", ".vim/", ".git/", ".hg/"],
            "initializationOptions": {
                "cache": {
                    "directory": "/tmp/ccls"
                },
                "highlight": { "lsRanges" : true }
            }
        },
        "cquery": {
            "command": "cquery",
            "args": ["--log-file=/tmp/cq.log"],
            "filetypes": ["c", "cpp"],
            "rootPatterns": ["compile_flags.txt", "compile_commands.json", ".vim/", ".git/", ".hg/"],
            "initializationOptions": {
                "cacheDirectory": "/tmp/cquery",
                "highlight": { "enabled" : true },
                "emitInactiveRegions" : true
            }
        }
    }
```
