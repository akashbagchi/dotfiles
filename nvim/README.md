# My Neovim Config

## Prerequisites

### Required Software

- Neovim >= 0.9.0
- Git
- Node.js >= 16.x (for LSP servers)
- A C compiler (for Treesitter)
  - Windows: Install [MinGW](https://www.mingw-w64.org/) or [Visual Studio Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)
  - Mac: Install Xcode Command Line Tools (`xcode-select --install`)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope grep)
  - Windows: `winget install BurntSushi.ripgrep.MSVC` or via Chocolatey: `choco install ripgrep`
  - Mac: `brew install ripgrep`
- [packer.nvim](https://github.com/wbthomason/packer.nvim) (package manager)
- A Nerd Font (for icons)
  - Recommended: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)

### LSP Servers

The following LSP servers will be automatically installed via Mason:

- TypeScript (`ts_ls`)
- Vue (`volar`)
- ESLint
- Rust Analyzer

## Platform-Specific Installation

### Windows

1. Install Neovim:

```powershell
winget install Neovim.Neovim
# or
choco install neovim
```

2. Create configuration directory:

```powershell
mkdir ~\AppData\Local\nvim
```

3. Clone repository:

```powershell
git clone https://github.com/akashbagchi/dotfiles.git ~\AppData\Local\nvim
```

4. Install Packer:

```powershell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

### macOS/Linux

1. Install Neovim:

```bash
# macOS
brew install neovim

# Linux
sudo apt install neovim  # Debian/Ubuntu
sudo dnf install neovim  # Fedora
```

2. Create configuration directory:

```bash
mkdir -p ~/.config/nvim
```

3. Clone repository:

```bash
git clone https://github.com/akashbagchi/dotfiles.git ~/.config/nvim
```

4. Install Packer:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Platform-Specific Configuration Changes

Your current configuration has some platform-specific settings that need attention. Here are the required changes:

### For Windows Users

1. In `lua/theprimeagen/set.lua`, the undo directory is Windows-specific. For cross-platform support, modify:

```lua
-- Replace this line
vim.opt.undodir = vim.fn.expand('$LOCALAPPDATA') .. "\\nvim-data\\undo"

-- With this
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
```

2. In `lua/theprimeagen/remap.lua`, uncomment Windows keybindings and comment out Mac ones:

```lua
-- Uncomment these lines for Windows
vim.keymap.set('n', '<C-/>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-/>', 'gc', { remap = true })

-- Comment out these lines on Windows
-- vim.keymap.set('n', '<D-/>', 'gcc', { remap = true })
-- vim.keymap.set('v', '<D-/>', 'gc', { remap = true })
```

3. In `after/plugin/lsp.lua`, adjust completion keybindings:

```lua
local cmp_mappings = lsp.defaults.cmp_mappings({
    -- Uncomment these for Windows
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),

    -- Comment these out for Windows
    -- ['<D-p>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<D-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- ['<D-y>'] = cmp.mapping.confirm({ select = true }),
    -- ["<D-Space>"] = cmp.mapping.complete(),
})
```

### For macOS Users

1. The configuration is already set up for macOS key bindings (`<D-/>` for comments, etc.)
2. Change the undo directory path in `set.lua` as mentioned above
3. Ensure your terminal emulator (iTerm2, Terminal.app, etc.) is set up to use your installed Nerd Font
4. For Volar LSP to work correctly, update the TypeScript SDK path in `lsp.lua`:

```lua
lspconfig.volar.setup({
    init_options = {
        typescript = {
            tsdk = vim.fn.expand('~/node_modules/typescript/lib')
            -- or globally installed TypeScript:
            -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
        }
    }
})
```

## Additional Platform-Specific Notes

### Windows

- Some plugins (like `telescope.nvim`) might work better with PowerShell or Git Bash than CMD
- If using WSL, consider installing Neovim inside WSL for a better Unix-like experience
- The `<C-f>` mapping for `tmux-sessionizer` won't work by default; you'll need to adjust or remove it

### macOS

- The Command key mappings (`<D->`) work in GUI Neovim (Neovide, VimR) but might need adjustments in terminal Neovim
- For optimal performance, consider using a modern terminal emulator like Alacritty or Kitty

## Key Features

### File Navigation

- **NvimTree**: File explorer
- **Telescope**: Fuzzy finder
- **Harpoon**: Quick file navigation

### Development

- LSP integration with zero-lsp
- Treesitter for syntax highlighting
- Auto-completion
- Git integration via Fugitive
- Comment.nvim for code commenting
- Refactoring tools
- Trouble for error diagnostics

### Focus & Productivity

- Zen Mode
- Undotree
- Custom status line

## Key Mappings

### General

- `<Space>` - Leader key
- `<leader>pf` - Find files
- `<C-p>` - Git files
- `<leader>ps` - Grep search
- `<leader>e` - Toggle NvimTree
- `<leader>fe` - Focus NvimTree

### LSP

- `gd` - Go to definition
- `K` - Hover documentation
- `<leader>vws` - Workspace symbol search
- `<leader>vd` - Open diagnostic float
- `[d` / `]d` - Previous/Next diagnostic
- `<leader>vca` - Code action
- `<leader>vrr` - Show references
- `<leader>vrn` - Rename

### Git (Fugitive)

- `<leader>gs` - Git status
- `<leader>p` - Git push (in fugitive buffer)
- `<leader>P` - Git pull --rebase (in fugitive buffer)

### Editing

- `J`/`K` in visual mode - Move lines up/down
- `<leader>y` - Yank to system clipboard
- `<leader>d` - Delete to void register
- `<D-/>` (Mac) - Toggle line comment
- `<A-S-a>` - Toggle block comment

### Navigation

- `<C-d>`/`<C-u>` - Scroll down/up (centered)
- `<C-h/t/n/s>` - Navigate to Harpoon marks 1-4
- `<C-e>` - Toggle Harpoon quick menu

### Focus Mode

- `<leader>zz` - Toggle Zen Mode (with numbers)
- `<leader>zZ` - Toggle Zen Mode (minimal)

## Important Notes

1. **LSP Setup**:
   - TypeScript/JavaScript LSP is configured for relative imports
   - ESLint will auto-fix on save
   - Vue support requires TypeScript in your project
2. **File Types**:
   - Special handling for `.env` files via Cloak plugin
   - Treesitter ensures syntax highlighting for major languages
3. **Platform Specific**:
   - Some keybindings are Mac-specific (e.g., `<D-/>` for comments)
   - Undo directory is set to Windows path (`%LOCALAPPDATA%`)
4. **Performance**:
   - Auto-install of TreeSitter parsers is enabled
   - Swap files are disabled, but persistent undo is enabled
   - UpdateTime is set to 50ms for responsive git signs

## Customization

Most configurations are modular and can be found in:

- `lua/theprimeagen/set.lua` - Basic Vim settings
- `lua/theprimeagen/remap.lua` - Key mappings
- `after/plugin/` - Plugin-specific configurations

## Troubleshooting

If you encounter issues:

1. Run `:checkhealth` to verify requirements
2. Ensure all prerequisites are installed
3. Try `:PackerSync` to update plugins
4. Check LSP status with `:LspInfo`

---
