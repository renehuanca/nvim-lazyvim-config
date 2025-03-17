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
    "jwalton512/vim-blade", -- Asegúrate de que este sea el nombre correcto del repositorio
    ft = { "blade", "php" }, -- Solo se activa en archivos .blade.php y .php
    config = function()
      -- Puedes agregar configuraciones adicionales aquí si es necesario
      vim.g.blade_syntax = true -- Habilita la sintaxis de Blade
    end,
  },
}
