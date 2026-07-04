return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                pickers = {
                    find_files = {
                        hidden = true,
                        find_command = {
                            "fd",
                            "--type",
                            "f",
                            "--hidden",
                            "--exclude",
                            ".git",
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>ff", function()
            require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = true,
            })
            end)
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
        end,
    },

    {
        "nvim-lua/plenary.nvim",
    },
}
