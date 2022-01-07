# The Brave Browser

## Installation

Install via `brave-browser` package with `pacman`. The `brave` package also exists, but compiling
the browser takes extremely long times.


## Configuration

We use the following extensions:

- Bitwarden
- Duckduckgo Security Essentails
- SurfingKeys


### Configuring SurfingKeys

The following configuration uses DuckDuckGo as the default search engine on tab opens and adds it to
search shortcuts.


```js
addSearchAliasX('d', 'duckduckgo', https://www.duckduckgo.com/?q=', 'o');

settings.defaultSearchEngine = 'd';
```
