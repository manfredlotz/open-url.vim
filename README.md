# open-url.vim

Opens one or more URLs on the current line.

- Modelled after https://github.com/henrik/vim-open-url
  - which uses John Gruber's URL regexp.


- This plugin uses a much simpler regexp
- It uses Python 3 instead of Ruby
- thus requiring Vim to be compiled with Python 3 support


# Configuration

## Browser could be configured in your `~/.vimrc`

Example

```
let g:open_url_browser='gnome-open'
```
