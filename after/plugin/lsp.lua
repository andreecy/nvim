local lsp = require("lsp-zero").preset({})
local lspconfig = require("lspconfig")

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  -- disable tsserver and null-ls when in a deno project
  if lspconfig.util.root_pattern("deno.json", "deno.jsonc", "import_map.json")(vim.fn.getcwd()) then
    if client.name == "tsserver" then
      client.stop()
      return
    end
    if client.name == "null-ls" then
      client.stop()
      return
    end
  end
end)

-- configure deno project when deno.json file found
lsp.configure('denols', {
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "import_map.json"),
})

-- disable tsserver formating, to prevent conflicting with null-ls eslint prettier
lspconfig.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})

lsp.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
})

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["lua_ls"]        = { "lua" },
    ["rust_analyzer"] = { "rust" },
    ["null-ls"]       = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    ["html-ls"]       = { "html" }
  },
})

lsp.setup()

-- null-ls setup
local null_ls = require("null-ls")

null_ls.setup({
  sources = {},
})

require("mason-null-ls").setup({
  ensure_installed = nil,
  automatic_installation = false, -- You can still set this to `true`
  handlers = {},
})

-- cmp setup
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "buffer",  keyword_length = 3 },
    { name = "luasnip", keyword_length = 2 },
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
    ["<Tab>"] = cmp_action.luasnip_supertab(),
    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      },
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
