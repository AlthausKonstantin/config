return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  "mtdl9/vim-log-highlighting",
  "nvim-lua/plenary.nvim",
  "tpope/vim-unimpaired",
  "ckipp01/nvim-jenkinsfile-linter",
  "sindrets/diffview.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
}
