-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.showtabline = 2
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.fileencoding = "UTF-8"
vim.opt.guifont = "monospace:h17"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
-- vim.opt.shell = "/bin/sh"
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.termguicolors = true

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- general
lvim.log.level = "info"
lvim.format_on_save.enabled = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>cc"] = ":Copilot chat<CR>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- -- Change theme settings
lvim.colorscheme = "tokyonight"
lvim.transparent_window = true

local function os_icon()
  local icons = {
    unix = "", -- e712
    dos = "", -- e70f
    mac = "", -- e711
  }
  if vim.fn.has("mac") == 1 then
    return icons.mac
  elseif vim.fn.has("win32") == 1 then
    return icons.dos
  else
    return icons.unix
  end
end

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.dap.active = true -- (default: false)
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false


lvim.builtin.cmp.completion.keyword_length = 2

-- telescope configs
lvim.builtin.telescope.defaults.initial_mode = "insert"
lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75

-- lvim.builtin.telescope.defaults.layout_config.width = 0.95

-- Automatically install missing parsers when entering buffer
-- lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.breadcrumbs.active = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- lualine config
lvim.builtin.lualine.style = "default" -- or "none"
lvim.builtin.lualine.options.theme = "horizon"
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
lvim.builtin.lualine.options.component_separators = { left = "", right = "" }
lvim.builtin.lualine.options.icons_enabled = true

local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch", "diff", "diagnostics" }
lvim.builtin.lualine.sections.lualine_c = { "filename", "lsp_progress" }
lvim.builtin.lualine.sections.lualine_x = { "lsp_client_name", "encoding", os_icon, "filetype" }
lvim.builtin.lualine.sections.lualine_y = { components.spaces, "progress" }
lvim.builtin.lualine.sections.lualine_z = { components.location }

lvim.builtin.lualine.inactive_sections.lualine_c = { "filename" }
lvim.builtin.lualine.inactive_sections.lualine_x = { components.location }
-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation.enable = true

-- nvim-ts-rainbow rainbow parentheses
-- lvim.builtin.treesitter.rainbow.enable = true

-- active neo tree
--
-- lvim.builtin.nvimtree.active = false

-- enable treesitter integration
-- lvim.builtin.treesitter.matchup.enable = true

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,

  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,
  }
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    name = "prettier",
    args = { "--print-with", "140" },
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
    cli_options = {
      usefiles = true,
      arrow_parens = "avoid",
      bracket_spacing = true,
      bracket_same_line = false,
      embedded_language_formatting = "auto",
      end_of_line = "lf",
      html_whitespace_sensitivity = "css",
      -- jsx_bracket_same_line = false,
      jsx_single_quote = false,
      print_width = 140,
      prose_wrap = "preserve",
      quote_props = "as-needed",
      semi = true,
      single_attribute_per_line = false,
      single_quote = true,
      tab_width = 2,
      use_tabs = true,
      trailing_comma = "all",
      vue_indent_script_and_style = false,
      --editorconfig = true
    },
  },
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
  {
    command = "eslint",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
    },
  },
  {
    exe = "eslint",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
    },
  },
})

--install telescope
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "neoclip")
  -- any other extensions loading
end

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "nvim-treesitter" },
  { "lunarvim/colorschemes" },
  -- { "WhoIsSethDaniel/lualine-lsp-progress.nvim" },
  { "rcarriga/nvim-notify" },
  { "matze/vim-move" },
  { "voldikss/vim-floaterm" },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup({
        show_numbers = true,    -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      })
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd("highlight default link gitblame SpecialComment")
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,              -- Width of the floating window
        height = 25,              -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false,            -- Print debug information
        opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil      -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  { "oberblastmeister/neuron.nvim" },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end,
  },
  {
    "aca/emmet-ls",
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig/configs")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }

      if not lspconfig.emmet_ls then
        configs.emmet_ls = {
          default_config = {
            cmd = { "emmet-ls", "--stdio" },
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
              "eruby",
              "typescriptreact",
              "javascriptreact",
              "svelte",
              "vue",
              "twig",
              "ejs",
              "scss",
              "less",
              "hbs"
            },
            root_dir = function(fname)
              return vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end
      lspconfig.emmet_ls.setup({ capabilities = capabilities })
    end,
  },
  { "github/copilot.vim" },
  { 'nvim-treesitter/nvim-treesitter' },
  { "nvim-treesitter/nvim-treesitter-angular" },
  { "rafamadriz/friendly-snippets" },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}

require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

require("toggleterm").setup {
  size = 15,
  direction = "horizontal",
}

-- Lua
-- vim.cmd [[colorscheme tokyonight]]

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

require("nvim-web-devicons").set_icon({
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh",
  },
  mac = {
    icon = "mf-dev-apple",
    color = "#FFFFFF",
    cterm_color = "65",
    name = "Mac",
  },
})

-- Angular Plugins
require("lvim.lsp.manager").setup("angularls")
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "angularls" })

-- Configuração para Angular Language Server
local lspconfig = require("lspconfig")
lspconfig.angularls.setup({
  on_attach = function(client, bufnr)
    -- Configurações adicionais
  end,
  flags = {
    debounce_text_changes = 150,
  },
  root_dir = lspconfig.util.root_pattern("angular.json"),
})

-- prettier
require("lvim.lsp.manager").setup("tailwindcss")

-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end,
-- lvim.lsp.automatic_configuration.skipped_servers)
--
-- Below config is required to prevent copilot overriding Tab with a suggestion
-- when you're just trying to indent!

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
      vim.api.nvim_feedkeys(copilot_keys, "i", true)
    else
      fallback()
    end
  end
end

lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
