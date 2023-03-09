# Diagrams

There are several options for diagram as code such as:

- plantuml
- graphviz
- mermaidjs
- d2

## D2

`d2-bin` is available from the AUR. General documentation can be found on their
[GitHub](https://github.com/terrastruct/d2) or on their [official
page](https://d2lang.com/tour/intro/).

### Sample

Most of this can be found on the [official cheatsheet](https://d2lang.com/tour/cheat-sheet).

```d2
a: Cloud thing {
  shape: cloud
  d: some other valus contained
}
b: Whether weary or unweary, O man, do not rest
c: I still maintain the point that designing a monolithic kernel in 1991 is a

a -> b: To err is human, to moo bovine {
  source-arrowhead: 1
  target-arrowhead: * {
    shape: diamond
  }
}

b <-> c: "Reality is just a crutch for people who can't handle science fiction" {
  source-arrowhead.label: 1
  target-arrowhead: * {
    shape: diamond
    style.filled: true
  }
}

d: A black cat crossing your path signifies that the animal is going somewhere

d -> a -> c


explanation: |md
  # I can do headers
  - lists
  - lists

  And other normal markdown stuff
| {
  near: d
}

my_code: |`py
  def main():
    pass
`|

server: {
  shape: image
  icon: https://icons.terrastruct.com/tech/022-server.svg
}

github: {
  shape: image
  icon: https://icons.terrastruct.com/dev/github.svg
}

server -> github
```
