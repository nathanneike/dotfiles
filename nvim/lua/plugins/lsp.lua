return {
    {
        "neovim/nvim-lspconfig",

        config = function()
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            vim.lsp.enable("pyright")

            vim.keymap.set("n", "K", vim.lsp.buf.hover)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
            vim.keymap.set("n", "gr", vim.lsp.buf.references)

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
            })
        end,
    },
}
