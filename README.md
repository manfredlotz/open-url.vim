# open-url.vim

Opens one or more URLs on the current line.

- Modelled after https://github.com/henrik/vim-open-url which uses John Gruber's URL regexp.

This plugin uses a much simpler regexp which I shamelessly copied from
https://macxima.medium.com/python-extracting-urls-from-strings-21dc82e2142b .
It uses Python 3 instead of Ruby thus requiring Vim to be compiled with Python 3 support

# Usage

Go to a line with an URL and type `<leader>u`

# Configuration

## Browser could be configured in your `~/.vimrc`


Example

```
let g:open_url_browser='gnome-open'
```
