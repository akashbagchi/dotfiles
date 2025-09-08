local lsp = require("lsp-zero")

local lspconfig = require("lspconfig")

lsp.preset("recommended")

-- Ensure required language servers are installed
lsp.ensure_installed({
    'ts_ls',          -- TypeScript/JavaScript
    'volar',             -- Vue
    'eslint',           -- ESLint
    'rust_analyzer',     -- Rust support
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
--    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),    -- Windows
--    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--    ["<C-Space>"] = cmp.mapping.complete(),
    ['<D-p>'] = cmp.mapping.select_prev_item(cmp_select),      -- Mac
    ['<D-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<D-y>'] = cmp.mapping.confirm({ select = true }),
    ["<D-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- Setup LSP servers
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- TypeScript specific keybindings
    if client.name == "ts_ls" then
        vim.keymap.set("n", "<leader>ti", ":TypescriptAddMissingImports<CR>", opts)
        vim.keymap.set("n", "<leader>to", ":TypescriptOrganizeImports<CR>", opts)
        vim.keymap.set("n", "<leader>tr", ":TypescriptRenameFile<CR>", opts)
    end
end)

-- Call setup before configuring servers
lsp.setup()

-- Configure servers after lsp.setup()
lspconfig.ts_ls.setup({
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    init_options = {
        preferences = {
            importModuleSpecifierPreference = "relative"
        }
    }
})

lspconfig.volar.setup({
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
    init_options = {
        typescript = {
            tsdk = vim.fn.expand('$HOME/node_modules/typescript/lib')
        }
    }
})

lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
    settings = {
        format = true,
        quiet = true,
    },
})

-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})


