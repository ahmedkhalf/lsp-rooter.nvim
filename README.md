### ⚠️ WARNING ⚠️ This project is now deprecated, please use [project.nvim](https://github.com/ahmedkhalf/project.nvim) instead.

# 🌳 lsp-rooter.nvim

**Lsp Rooter** is a neovim plugin written in lua to change the current working directory to the project's root directory automagically using nvim native lsp.

<img src="https://user-images.githubusercontent.com/36672196/119023256-a9432800-b9b2-11eb-8f0e-028a860efa9c.gif">

## ✨ Features

- Automagically cd to project directory using nvim lsp
- Dependency free, does not rely on `lspconfig`
- Nvim-tree.lua support/integration

## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install the plugin with your preferred package manager:

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
" Vim Script
Plug 'ahmedkhalf/lsp-rooter.nvim'

lua << EOF
  require("lsp-rooter").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
```

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
-- Lua
use {
  "ahmedkhalf/lsp-rooter.nvim",
  config = function()
    require("lsp-rooter").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
```

## ⚙️ Configuration

**Lsp Rooter** comes with the following defaults:

```lua
{
  -- Table of lsp clients to ignore by name
  -- eg: {"efm", ...}
  ignore_lsp = {},
}
```

## 🚀 Usage

**Lsp Rooter** works automatically

## 🗒️ TODO

- Support non-LSP projects ([#2](https://github.com/ahmedkhalf/lsp-rooter.nvim/issues/2))
- Add manual control using `:rooter`

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

```
# This project is libre, and licenced under the terms of the
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
# as published by dtf, July 2019. See the COPYING file or
# https://ph.dtf.wtf/u/wtfplv31 for more details.
```
