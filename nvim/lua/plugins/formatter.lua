return {
    {
        "stevearc/conform.nvim",

        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({
                        lsp_fallback = true,
                        async = false,
                        timeout_ms = 500,
                    })
                end,
                desc = "Format buffer",
            },
        },

        opts = {
            formatters_by_ft = {
                lua = { "stylua" },

                python = { "ruff_format" },

                yaml = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },

                sh = { "shfmt" },
                bash = { "shfmt" },
            },
        },
    },
}
