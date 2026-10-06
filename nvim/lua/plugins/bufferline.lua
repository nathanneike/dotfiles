return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",   -- added: load at startup instead of waiting for a key
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            options = {
                mode = "tabs",   -- added: show tabs. Remove this line to show buffers instead
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
