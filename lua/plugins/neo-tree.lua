return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        vim.g.neotree_open = vim.g.neotree_open or false
        vim.keymap.set("n", "<C-n>", function()
            if vim.g.neotree_open then
                vim.cmd("Neotree close")
                vim.g.neotree_open = false
            else
                vim.cmd("Neotree reveal")
                vim.g.neotree_open = true
            end
        end)
        -- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    end,
}
