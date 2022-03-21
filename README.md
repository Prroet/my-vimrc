# my-vimrc

Only compatible with latest stable neovim release!

## Prerequisites

- neovim
- [pyright](https://github.com/microsoft/pyright)
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
  - packer.nvim is not [packer](https://www.packer.io/)!
- [Terraform Language Server](https://github.com/hashicorp/terraform-ls.git)
- [Bash Language Server](https://github.com/bash-lsp/bash-language-server)

## Installation

- Copy config/nvim to $HOME/.config/nvim
- Start neovim and do `:PackerInstall` to install all the plugins

### Features

- Terminal Toggle (Hit F12 Key)
- completion via [language server protocoll](https://microsoft.github.io/language-server-protocol/) for python, terraform and bash (more will probably come)
