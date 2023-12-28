# Aiken Vim

A plugin for working with [Aiken](https://github.com/txpipe/aiken) on Vim / NeoVim.

## Features

- [x] Syntax Highlighting
- [x] Automatic indentation

## Installation

### vim-plug

Simply use:

```vim
Plug 'aiken-lang/editor-integration-nvim'
```
### [lazy.nvim](https://github.com/folke/lazy.nvim)

First add this to lazy.nvim setup:

```lua
{
  "aiken-lang/editor-integration-nvim",
  dependencies = {
    'neovim/nvim-lspconfig',
  }
},
```

Then to enable the Aiken LSP, add the following to `init.lua` file:

```lua
require'lspconfig'.aiken.setup({})
```

To enable the auto formatting on save, add the following to `init.lua` file:

```lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ak",
  callback = function()
    vim.lsp.buf.format({async = false})
  end
})
```

### Manual

Copy the content of `ftdetect`, `indent` and `syntax` to your `$HOME/.config/nvim/`.
Make sure that `:syntax` is `on`.

## Preview

![](.github/preview.png)

## License

[MPL-2.0](./LICENSE)
