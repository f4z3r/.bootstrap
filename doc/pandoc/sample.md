---
title: Sample Presentation
author: Jakob Beckmann
date: 28.02.2022
progress: false
hash: true
controls: false
ipt-title: true
highlightjs: true

---

# Slide 1 {data-background="https://hddesktopwallpapers.in/wp-content/uploads/2015/09/forest-hd-wallpaper-stream.jpg"}

- Point 1
- Point 2
- Point 3

# Examples

## Sub-Slide Quote

> This is amazing!

## Sub-Slide PlantUML

```{.plantuml im_fmt="svg"}
@startuml
!theme cerulean-outline
Alice -> Bob: Authentication Request
Bob --> Alice: Authentication Response
@enduml
```

## Sub-Slide Capture

You can capture the output of a script:

```{.shebang im_out="ocb,stdout"}
#!/bin/bash
for i in $(ls); do
  echo item found: $i
done
```

## Include Code

```{.python include="code.py" dedent=4 start-line=12 end-line=13 .numberLines data-line-numbers="1|2"}
```

## Sub-Slide Code {data-transition="zoom"}

```{.python data-line-numbers="1-3|2"}
def sample_function(name: str, arg: int):
    if arg > 0:
        # comment
        return 42
    return f"this is a {name}"
```
