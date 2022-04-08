api.Hints.characters              = 'asdfgweruio';
api.Hints.numericHints            = false;        // Whether to use digit as hint label, if it is on, you could type text to filter links.
settings.showModeStatus           = false;        // Whether always to show mode status.
settings.richHintsForKeystroke    = 500;          // Timeout(ms) to show rich hints for keystroke, 0 will disable rich hints.
settings.focusOnSaved             = true;         // Whether to focus text input after quitting from vim editor.
settings.omnibarMaxResults        = 10;           // How many results will be listed out each page for Omnibar.
settings.omnibarPosition          = 'middle';     // Where to position Omnibar. ["middle", "bottom"]
settings.omnibarSuggestion        = true;         // Show suggestion URLs
settings.omnibarSuggestionTimeout = 200;          // Timeout duration before Omnibar suggestion URLs are queried, in milliseconds. Helps prevent unnecessary HTTP requests and API rate-limiting.
settings.focusFirstCandidate      = true;         // Whether to focus first candidate of matched result in Omnibar.
settings.tabsThreshold            = 0;            // When total of opened tabs exceeds the number, Omnibar will be used for choosing tabs.
settings.hintsThreshold           = 1000;         // When total of regular clickable elements (a, button, select, input, textarea) exceeds this number, Surfingkeys will not show hints for other elements that are clickable.
settings.clickableSelector        = '';           // Extra CSS selector to pick elements for hints mode, such as "*.jfk-button, *.goog-flat-menu-button".
settings.smoothScroll             = true;         // Whether to use smooth scrolling when pressing keys like j/k/e/d to scroll page or elements.
settings.modeAfterYank            = '';           // Which mode to fall back after yanking text in visual mode. Value could be one of ["", "Caret", "Normal"], default is "", which means no action after yank.
settings.scrollStepSize           = 350;          // A step size for each move by j/k
settings.scrollFriction           = 0;            // A force that is needed to start continuous scrolling after initial scroll step. A bigger number will cause a flicker after initial step, but help to keep the first step precise.
settings.hintAlign                = 'center';     // Alignment of hints on their target elements. ["left", "center", "right"]
settings.defaultSearchEngine      = 'd';          // The default search engine used in Omnibar.
settings.blacklistPattern         = undefined;    // A regex to match the sites that will have Surfingkeys disabled.
settings.focusAfterClosed         = 'right';      // Which side of tab will be focused after current tab closed. ["left", "right"]
settings.repeatThreshold          = 99;           // The maximum of actions to be repeated.
settings.tabsMRUOrder             = true;         // Whether to list opened tabs in order of most recently used beneath Omnibar.
settings.historyMUOrder           = true;         // Whether to list history in order of most used beneath Omnibar.
settings.newTabPosition           = 'default';    // Where to new tab. ["left", "right", "first", "last", "default"]
settings.interceptedErrors        = [];           // Indicates for which errors Surfingkeys will show error page, so that you could use Surfingkeys on those error pages. For example, ["*"] to show error page for all errors, or ["net::ERR_NAME_NOT_RESOLVED"] to show error page only for ERR_NAME_NOT_RESOLVED, please refer to net_error_list.h for complete error list.
settings.startToShowEmoji         = 2;            // How many characters are needed after colon to show emoji suggestion.
settings.language                 = undefined;    // The language of the usage popover, only "zh-CN" is added for now, PR for any other language is welcomed, please see l10n.json.
settings.stealFocusOnLoad         = true;         // Whether to prevent focus on input on page loaded, set to true by default so that we could use Surfingkeys directly after page loaded, otherwise we need press Esc to quit input.
settings.enableAutoFocus          = true;         // Whether to enable auto focus after mouse click on some widget. This is different with stealFocusOnLoad, which is only for the time of page loaded. For example, there is a hidden input box on a page, it is turned to visible after user clicks on some other link. If you don't like the input to be focused when it's turned to visible, you could set this to false.
settings.theme                    = undefined;    // To change css of the Surfingkeys UI elements.
settings.caseSensitive            = false;        // Whether finding in page is case sensitive.
settings.smartCase                = true;         // Whether to make caseSensitive true if the search pattern contains upper case characters.
settings.cursorAtEndOfInput       = true;         // Whether to put cursor at end of input when entering an input box, by false to put the cursor where it was when focus was removed from the input.
settings.digitForRepeat           = true;         // Whether digits are reserved for repeats, by false to enable mapping of numeric keys.
settings.editableBodyCare         = true;         // Insert mode is activated automatically when an editable element is focused, so if document.body is editable for some window/iframe (such as docs.google.com), Insert mode is always activated on the window/iframe, which means all shortcuts from Normal mode will not be available. With editableBodyCare as true, Insert mode will not be activated automatically in this case.

api.aceVimMap('fd', '<Esc>', 'insert');
api.imap(';;', '<Esc>');
api.vmap(';;', '<Esc>');
api.cmap(';;', '<Esc>');
api.cmap('<Ctrl-j>', '<Tab>');
api.cmap('<Ctrl-k>', '<Shift-Tab>');

api.Hints.style(`
  background: initial !important;
  background-color: #3a5f82 !important;
  border: solid 3px #3a5f82 !important;
  color: #fff !important;
  font-size: 9pt !important;
  font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Helvetica,Arial, sans-serif  !important;
  letter-spacing: 2px;
  transition: opacity .2s !important;
`);

api.Hints.style(`
  padding: 2px 4px;
  background: initial;
  background-color: #000;
  color: lightyellow;
  border: solid 1px #000;
`, 'text');

api.Visual.style('marks',  'background-color: #89a1e2;');
api.Visual.style('cursor', 'background-color: #9065b7;');

settings.theme = `
  .sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
  }
  .sk_theme tbody {
    color: #fff;
  }
  .sk_theme input {
    color: #d0d0d0;
  }
  .sk_theme .url {
    color: #61afef;
  }
  .sk_theme .annotation {
    color: #56b6c2;
  }
  .sk_theme .omnibar_highlight {
    color: #528bff;
  }
  .sk_theme .omnibar_timestamp {
    color: #e5c07b;
  }
  .sk_theme .omnibar_visitcount {
    color: #98c379;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li:nth-child(odd) {
    background: #303030;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li.focused {
    background: #3e4452;
  }
  .sk_theme .separator {
    color: white;
  }
  #sk_omnibar {
    width: 50%;
    left: 25%;
  }
  #sk_status, #sk_find {
    font-size: 16pt;
    right: auto;
  }
`;
