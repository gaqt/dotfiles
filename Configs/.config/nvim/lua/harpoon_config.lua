local harpoon = require('harpoon')

harpoon:setup()

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-q>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

-- Custom user commands

local function harpoon_menu(args)
    local name = args.args
    if name == "" then
        name = nil
    end

    harpoon.ui:toggle_quick_menu(harpoon:list(name))
end

vim.api.nvim_create_user_command("Harpoon", harpoon_menu, {
    nargs = "?",
    desc = "Show harpoon menu with given or default list",
})

-- Extensions

local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
