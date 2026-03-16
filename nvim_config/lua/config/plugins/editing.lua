return {
    -- Auto format on save
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format file (conform)",
      },
    },
    opts = {
      formatters_by_ft = {
        rust       = { "rustfmt" },
        toml       = { "taplo" },
        svelte     = { "prettier" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        html       = { "prettier" },
        css        = { "prettier" },
        json       = { "prettier" },
        lua        = { "stylua" },
      },

      -- Format automatically on save
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,  -- fall back to LSP formatter if conform can't find one
      },
    },
  },
    
{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      check_ts = true,
      ts_config = {
        lua  = { "string" },
        rust = { "string" },
      },
      fast_wrap = {
        map = "<M-e>",
      },
    })

    -- Hook into cmp safely — only if cmp is available
    local ok, cmp = pcall(require, "nvim-cmp")
    if ok then
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
},

}
