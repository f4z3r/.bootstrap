# Git

## Hooks

This automatically configures hooks to ensure consistency in the way we work.

The global hooks currently configured are:

- `commit-msg`: a hook run on the commit message that ensures conventional commit style of messages
  are adhered to.


## Trailers

Git support setting trailers to add metadata to commits using the `--trailer` flag. This can be
useful to link issues or co-working. The following trailers are configured on the current setup:

- `rel`: translates to a `Relates-to: ` trailer.
- `impl`: translates to a `Implements: ` trailer. It also transforms the argument to uppercase.
- `coa`: translates to a `Co-authored-by: ` trailer. This searches in the history for the name of
  the co-author.
- `help`: translates to a `Helped-by: ` trailer. This searches in the history for the name of
  the helper.
- `fix`: translates to a `Fix #` trailer.
