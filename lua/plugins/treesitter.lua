return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      -- local bladeGrp
      -- vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true })
      -- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
      --   pattern = "*.blade.php",
      --   group = bladeGrp,
      --   callback = function()
      --     vim.opt.filetype = "blade"
      --   end,
      -- })

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
