return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["n"] = { "nzz", desc = "Next" },
          ["N"] = { "Nzz", desc = "Previous" },
          -- center screen if going up or down a hald page
          ["<C-u>"] = { "<C-u>zz", desc = "Half Page Up" },
          ["<C-d>"] = { "<C-d>zz", desc = "Half Page Down" },
          -- yank and paste to system clipboard
          ["<leader>y"] = { '"+y', desc = "Yank to clipboard" },
          ["<leader>Y"] = { '"+Y', desc = "Yank to clipboard" },
          ["<leader>v"] = { '"+p', desc = "Paste from clipboard" },
          -- undotree
          ["<leader>h"] = { "<cmd>UndotreeShow<cr><cmd>UndotreeFocus<cr>", desc = "Undotree" },
          -- search and replace
          ["<leader>r"] = { ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", desc = "Search and replace word under cursor" },
          -- remap command mode
          ["<leader> "] = { ":", desc = "Command mode" },
          -- change cwd to current file
          ["<leader>."] = { ":! cd %:h <CR>", desc = "cd to File's Location" },
          -- ["<leader>l"] = { "<cmd>cd %:h <CR>", "Set Files Location As Dir" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}
