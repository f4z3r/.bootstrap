# Pandoc

We can use a combination of Pandoc, RevealJS, and PlantUML to generate slides from Markdown that
have full support for what we want to show.

## Installations

Install the following:

```bash
yay -S pandoc plantuml
# you can use pipx instead for the following command
pip install --user pandoc-plantuml-filter
```

## Usage

```bash
pandoc \
  -s \                          # standalone
  --highlight-style tango \     # code highlight style (see --list-highlight-styles)
  -t revealjs \                 # format to which to convert
  -V theme=solarized \          # variable passed to the driver
  --slide-level 2 \             # which heading level to generate slides to
  -F pandoc-plantuml \          # whether to use a filter
  -o <out-file> \               # target
  <in-file>                     # source(s)
```


## Sample

Use the [sample](./sample.md) and compile it using:

```bash
cd ~/.bootstrap/doc/pandoc
pandoc -s --highlight-style tango \
  -t revealjs -V theme=solarized \
  --slide-level 2 -F pandoc-plantuml \
  -o slides.html \
  sample.md
```
