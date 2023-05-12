# Neovim configuration

## Major plugins

1. Plugin manager : [Lazy.nvim](https://github.com/folke/lazy.nvim.git)

- To update installed plugins, run `:Lazy update`.
- To install plugins, run `:Lazy install <name_of_your_plugin>` or modify the `lua/plugins.lua` file.

2. Lsp - Language Server Protocol : [Neovim-lspconfig](), [Mason.nvim](https://github.com/williamboman/mason.nvim.git), [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim.git)

- To install new LSP servers, run `:Mason` and select the LSP you that you want. You can also see the list of LSP that are preinstalled wiusing this repo !

3. Explorer / file picker : [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git)

- Extensions :
  - [File browser](https://github.com/nvim-telescope/telescope-file-browser.nvim.git)

## Useful files

- Mappings : `lua/ikonera/mappings.lua`
- LSP : `lua/ikonera/lsp/servers.lua` | `lua/ikonera/lsp/completion.lua`
- Telescope : `lua/ikonera/telescope.lua`
- Code formatting : `lua/ikonera/formatter.lua`

## Some tips

### Updates

If you want to keep your Neovim configuration updated with this repo, you should create a symbolic link with the following command :

```bash
# With SSH
git clone git@github.com:ikonera/nvim-config.git
# With HTTP
git clone https://github.com/ikonera/nvim-config.git

ln -s /<absolute_path>/nvim-config $HOME/.config/nvim
```

Then

```bash
cd <path_to>/nvim-config
git pull
```

### Themes

If you want to change the colorscheme, you can make it by Telescope by running `:Telescope builtin` > `colorscheme` then selecting your choosed one.

Preinstalled themes with this repo :

1. [Tokyonight](https://github.com/folke/tokyonight.nvim.git)
2. [Nightfox](https://github.com/EdenEast/nightfox.nvim.git)

To install your own :

- Add it to the `lua/plugins.lua` file.
- Configure it by modifying the `lua/ikonera/themes.lua` file.
- And replace the theme name at the end of the same file !
