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
          ["<Leader>y"] = { '"+y', desc = "Yank to clipboard" },
          ["<Leader>Y"] = { '"+Y', desc = "Yank to clipboard" },
          ["<Leader>v"] = { '"+p', desc = "Paste from clipboard" },
          -- undotree
          ["<Leader>h"] = { "<cmd>UndotreeShow<cr><cmd>UndotreeFocus<cr>", desc = "Undotree" },
          -- search and replace
          ["<Leader>r"] = { ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", desc = "Search and replace word under cursor" },
          -- remap command mode
          ["<Leader> "] = { ":", desc = "Command mode" },
          -- change cwd to current file
          ["<Leader>."] = { ":! cd %:h <CR>", desc = "cd to File's Location" },
          -- ["<Leader>l"] = { "<cmd>cd %:h <CR>", "Set Files Location As Dir" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}
