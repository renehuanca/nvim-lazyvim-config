return {
  -- Configuración para Blade en PHP con LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          settings = {
            phpactor = {
              blade = {
                enabled = true, -- Habilita el soporte de Blade
              },
            },
          },
        },
      },
    },
  },

  -- Configuración para sintaxis Blade con Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "php", "html" }, -- Asegura que PHP y HTML estén instalados
      highlight = {
        enable = true, -- Habilita el resaltado de sintaxis
        additional_vim_regex_highlighting = { "blade" }, -- Agrega soporte para Blade
      },
    },
  },

  -- Configuración para soporte de Blade en el autocompletado con nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
    },
    opts = function(_, opts)
      opts.sources = vim.list_extend(opts.sources, {
        { name = "phpactor" }, -- Agrega PHPactor como fuente de autocompletado
      })
    end,
  },

  -- Configuración para mejorar la experiencia de edición de Blade
  {
    "jwalton512/vim-blade",
    opts = {
      -- Opciones de configuración específicas para el resaltado de Blade
      blade_syntax = true,
    },
  },
}
