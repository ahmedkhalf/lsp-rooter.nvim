# 🌳 lsp-rooter.nvim

**lsp-rooter.nvim** is a neovim plugin written in lua to change the current working directory to the project's root directory automagically using nvim native lsp.

## ✨ Features

- Automagically cd to project directory using nvim lsp
- Dependency free, does not rely on `lspconfig`

## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install the plugin with your preferred package manager:

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'ahmedkhalf/lsp-rooter.nvim'
```

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
use {"ahmedkhalf/lsp-rooter.nvim"}
```

## 🚀 Usage

lsp-rooter.nvim works automatically

## 🗒️ TODO

- Add support for nvim-tree.lua ([#387](https://github.com/kyazdani42/nvim-tree.lua/issues/387))
- Add manual control using `:rooter`
- Use on_detach for smarter lsp client detection ([#14535](https://github.com/neovim/neovim/issues/14535))

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

```
# This project is libre, and licenced under the terms of the
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
# as published by dtf, July 2019. See the COPYING file or
# https://ph.dtf.wtf/u/wtfplv31 for more details.
```
