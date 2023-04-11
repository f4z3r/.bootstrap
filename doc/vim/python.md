# Python

First, ensure `coc` is properly set up.

* [Coc Extension](#coc-extension)
* [Virtualization](#virtualization)
* [Tools](#tools)
  * [Black](#black)
    * [Configuration](#configuration)
  * [Bandit](#bandit)
  * [Mypy](#mypy)
  * [Yapf](#yapf)
  * [Reorder-python-imports](#reorder-python-imports)
  * [Pydocstyle](#pydocstyle)

## Coc Extension

Install the `coc` extension.

```viml
CocInstall coc-pyright
```

## Virtualization

Use `rtx` to virtualize the entire Python installation to fix a specific version:

```bash
rtx install python@3.8.10
rtx global python@3.8.10
```

Once this is done, you should have a fully clean install (`pip freeze` should return nothing).

Then install `hatch` to isolate development environments:

```bash
# ensure to run this via the system python
pipx install hatch
```

```bash
# launch a hatch shell
hatch shell
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

### Ruff

> Extremely fast linter and fixer for Python.

Installed via `pipx`. Configured directly in the `pyproject.toml` of the project.

### Black

Installed via `pipx`.

#### Configuration

To configure it:

```bash
ln ~/.bootstrap/conf/black ~/.config/black
```

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
