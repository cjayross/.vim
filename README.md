# Vim Config

Supports vanilla vim8/vim9 compiled with `+python3`.

Clone this repo into your home directory using:

```sh
git clone --recurse-submodules https://github.com:cjayross/.vim
```

LSP support is provided through
[coc.nvim](https://github.com/neoclide/coc.nvim). After cloning make sure to
run `yarn install` in `pack/plugin/opt/coc.nvim`. `coc.nvim` can be activated
using `<Leader>ls` (see `after/plugin/coc.nvim` for more keybindings).

The colorscheme is provided by [vim-one](https://github.com/rakr/vim-one).
