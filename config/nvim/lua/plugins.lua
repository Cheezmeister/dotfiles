-- FIXME: Store this in dotfiles!
_G.vim = vim

-- NOTE: https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- END COPYPASTA

-- BEGIN PLUGINS
local plugins = {
  'terrortylor/nvim-comment',
  'nvim-lua/plenary.nvim',

  -- 'nvim-telescope/telescope.nvim',
  -- FIXME: { "sourcegraph/sg.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  -- 'svrana/neosolarized.nvim',
  'onsails/lspkind-nvim', -- VSCode-like pictograms
  'L3MON4D3/LuaSnip', -- Snippet engine
  'hedyhli/outline.nvim',
  'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built-in LSP
  'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
  'hrsh7th/nvim-cmp', -- A completion engine plugin for neovim

  'neovim/nvim-lspconfig',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-lualine/lualine.nvim',
  'windwp/nvim-ts-autotag',
  'windwp/nvim-autopairs',
  'akinsho/nvim-bufferline.lua',

  'glepnir/lspsaga.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',

  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',


  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'kylechui/nvim-surround',
  'f-person/git-blame.nvim',

}
-- END PLUGINS

local opts = {}
require("lazy").setup(plugins, opts)


local just_call_setup = function(plugin) plugin.setup({}) end
local setup_plugin = function(name, cb)
  local status, plugin = pcall(require, name)
  if (not status) then return end
  (cb or just_call_setup)(plugin)
end

setup_plugin("nvim_comment", just_call_setup)
setup_plugin("sg", just_call_setup)
setup_plugin( "outline", just_call_setup)
setup_plugin('mason')

setup_plugin("nvim-surround")



-- BEGIN MORE COPYPASTA

setup_plugin("nvim_comment", just_call_setup)
setup_plugin("nvim-surround", just_call_setup)

setup_plugin("lualine", function(lualine) lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
} end)



--------------------------------------------------------------------------------
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end
--------------------------------------------------------------------------------

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        if vim.lsp.buf.formatting_seq_sync ~= nil then
          vim.lsp.buf.formatting_seq_sync()
        end
      end
    })
  end
end


-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- XML
nvim_lsp.xml.setup {
  on_attach = on_attach,
}

-- HTML
nvim_lsp.html.setup {
  on_attach = on_attach,
}

-- Lua
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  diagnostics = {
    -- Get the language server to recognize the `vim` global
    globals = {'vim'},
  }
}

-- Yaml
nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  filetypes = { "yaml", "yml" },
  cmd = { "yaml-language-server", "--stdio" }
}


--------------------------------------------------------------------------------
setup_plugin("cmp", function(cmp)
  local lspkind = require 'lspkind'
  cmp.setup {
    snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
      }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      }),
    formatting = {
        format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
      }
  }

  vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
  ]]
end)

-- TODO setup_plugin("nvim-treesitter.configs"
-- ...
-- end)
--------------------------------------------------------------------------------
local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end
--------------------------------------------------------------------------------

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "css",
    -- TODO: "coffeescript",
    -- TODO: "kotlin",
    "fish",
    "html",
    "json",
    "javascript",
    "kotlin",
    "lua",
    "php",
    "swift",
    "toml",
    "tsx",
    -- TODO: "vimdoc",
    "yaml",
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

--------------------------------------------------------------------------------
local status, saga = pcall(require, "lspsaga")
if (not status) then return end
--------------------------------------------------------------------------------

saga.setup({
  server_filetype_map = {
    typescript = 'typescript'
  }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- --------------------------------------------------------------------------------
setup_plugin("null-ls", function(null_ls)
  null_ls.setup {
    sources = {
      null_ls.builtins.diagnostics.eslint_d.with({
        diagnostics_format = '[eslint] #{m}\n(#{c})'
      }),
      null_ls.builtins.diagnostics.fish
    }
  }
end)

setup_plugin("prettier", function(prettier)
  prettier.setup {
    bin = 'prettierd',
    filetypes = {
      "css",
      "tsx",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "json",
      "scss",
      "lua",
      "less"
    }
  }
end)

setup_plugin("nvim-tree", function(tree)
  tree.setup {
    renderer = {
      icons = {
        show = False
      }
    }
  } 
end)

-- load snippets from path/of/your/nvim/config/my-cool-snippets
-- FIXME(delete) require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
setup_plugin("luasnip.loaders.from_vscode", function (vscode_snippets)
  vscode_snippets.lazy_load({ paths = { "./my-cool-snippets" } })
end)


setup_plugin("supermaven-nvim", function(supermaven)
  supermaven.setup({
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
    ignore_filetypes = { cpp = true },
    color = {
      suggestion_color = "#ffffff",
      cterm = 244,
    },
    disable_inline_completion = false, -- disables inline completion for use with cmp
    disable_keymaps = false -- disables built in keymaps for more manual control
  })
end)

