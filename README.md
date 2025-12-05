# Aiken Vim

A plugin for working with [Aiken](https://github.com/aiken-lang/aiken) on Vim / NeoVim.

## Features

- [x] Syntax Highlighting
- [x] Automatic indentation
- [x] Fold regions for `fn`, `test` and `bench`
- [x] LSP-integration via [coc.vim](https://github.com/neoclide/coc.nvim) or nvim's native LSP client.

## Installation

### Installation / [vim-plug](https://github.com/junegunn/vim-plug)

Simply use:

```vim
Plug 'aiken-lang/editor-integration-nvim'
```

#### (optional) Enabling folds

To enable fold regions, and in case your defaults are different from nvim's defaults, add the following:

```vim
autocmd FileType aiken setlocal foldenable foldlevelstart=0
```

### Installation / [lazy.nvim](https://github.com/folke/lazy.nvim)

First add this to lazy.nvim setup:

```lua
{
  "aiken-lang/editor-integration-nvim",
  dependencies = {
    'neovim/nvim-lspconfig',
  }
}
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
    vim.opt_local.foldenable = true  -- Optional, to enable or disable fold regions.
    vim.opt_local.foldlevelstart = 0 -- Optional, start with all regions folded.
  end
})
```

### Installation / manual

Copy the content of `ftdetect`, `indent` and `syntax` to your `$HOME/.config/nvim/`.
Make sure that `:syntax` is `on`.

### LSP Configuration (coc.vim)

#### `:CocConfig`

```json
{ "languageserver":
  { "aiken":
      { "command": "aiken"
      , "args": ["lsp"]
      , "trace.server": "verbose"
      , "rootPatterns": ["aiken.toml"]
      , "filetypes": ["aiken"]
      }
  }
}
```

#### Automatic formatting

```vim
" Automatically format code on save
autocmd BufWritePre *.ak :silent! call CocAction('format')
```

### [Ctags](https://ctags.io/)

To use tags for navigation, use the following configuration:

```ctags
--langdef=Aiken
--langmap=Aiken:.ak
--regex-Aiken=/^fn[ \t]+([a-zA-Z0-9_]+)/\1/f,functions/
--regex-Aiken=/^test[ \t]+([a-zA-Z0-9_]+)/\1/f,functions/
--regex-Aiken=/^bench[ \t]+([a-zA-Z0-9_]+)/\1/f,functions/
--regex-Aiken=/^const[ \t]+([a-zA-Z0-9_]+)/\1/v,varlambdas/
--regex-Aiken=/^type[ \t]+([a-zA-Z0-9_]+)/\1/t,types/
```

## Preview

![](.github/preview.png)

## License

[MPL-2.0](./LICENSE)
