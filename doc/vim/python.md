# Python

First, ensure `coc` is properly set up.


<!-- vim-markdown-toc GFM -->

* [Coc Extension](#coc-extension)
* [Tools](#tools)
  - [Black](#black)
  - [Bandit](#bandit)
  - [Mypy](#mypy)
  - [Yapf](#yapf)
  - [Reorder-python-imports](#reorder-python-imports)
  - [Pydocstyle](#pydocstyle)

<!-- vim-markdown-toc -->

## Coc Extension

Install the `coc` extension.

```viml
CocInstall coc-pyright
```

## Virtualization

Use `asdf` to virtualize the entire Python installation to fix a specific version:

```bash
asdf plugin add python
asdf install python 3.8.10
asdf global python 3.8.10
```

Once this is done, you should have a fully clean install (`pip freeze` should return nothing).

Then install `pipenv` to isolate development environments:

```bash
pip install pipenv
```

If you cannot launch `pipenv` directly, simply use `python -m pipenv` when using a shim from `asdf`.

```bash
# to install a dependency
pipenv install [--dev] DEPENDENCY
# OR python -m pipenv install [--dev] DEPENDENCY
# to install all dependencies for development
pipenv install --dev
```

Once you have installed all dependencies in your development environment, you can launch `vim`
within it, to have access to a full dev environment with LSP support:

```bash
pipenv shell
vim
```

## Tools

Use `pipx` to install python executable tools.

```sh
$ pip3 install --user pipx
```

`pipx` can then be used to install tools.

```sh
$ pipx install <tool>
```

### Black

Installed via `pipx`.

### Bandit

Installed via `pipx`.

### Mypy

Installed via `pipx`.

### Yapf

Installed via `pipx`.

### Reorder-python-imports

Installed via `pipx`.

### Pydocstyle

Installed via `pipx`.
