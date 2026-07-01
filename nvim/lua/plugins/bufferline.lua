return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            options = {
                diagnostics = "nvim_lsp",
                separator_style = "slant",
            },
        },

        keys = {
            {
                "<leader>bn",
                "<cmd>BufferLineCycleNext<CR>",
                desc = "Next buffer",
            },
            {
                "<leader>bp",
                "<cmd>BufferLineCyclePrev<CR>",
                desc = "Previous buffer",
            },
            {
                "<leader>bd",
                "<cmd>bdelete<CR>",
                desc = "Delete buffer",
            },
        },
    },
}
