# Pandoc

We can use a combination of Pandoc, RevealJS, and PlantUML to generate slides from Markdown that
have full support for what we want to show.

## Installations

Install the following:

```bash
yay -S pandoc plantuml
pipx install pandoc-imagine
```

## Usage

```bash
pandoc \
  -s \                          # standalone
  --highlight-style tango \     # code highlight style (see --list-highlight-styles)
  -t revealjs \                 # format to which to convert
  --slide-level 2 \             # which heading level to generate slides to
  -F pandoc-imagine \           # whether to use a filter
  -o <out-file> \               # target
  <in-file>                     # source(s)
```


## Sample

Use the [sample](./sample.md) and compile it using:

```bash
cd ~/.bootstrap/doc/pandoc
pandoc -s \
  -t revealjs \
  --slide-level 2 \
  -F pandoc-imagine \
  -L filters/code-include.lua \
  -L filters/revealjs-codeblocks.lua \
  --template template.html \
  -o slides.html \
  sample.md
```
