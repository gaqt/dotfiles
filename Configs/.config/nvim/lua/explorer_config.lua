require("oil").setup {
   keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      -- ["<C-S>"] = { "actions.select", opts = { vertical = true } },
      -- ["<C-H>"] = { "actions.select", opts = { horizontal = true } },
      -- ["<C-T>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["<C-m>"] = "actions.refresh",
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
   },
   use_default_keymaps = false
}

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open parent directory" })
