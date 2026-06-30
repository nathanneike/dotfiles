return {
    {
        "neovim/nvim-lspconfig",

        config = function()
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            local servers = {
                "pyright",
                "yamlls",
                "bashls",
                "dockerls",
                "jsonls",
                "lua_ls",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })

                vim.lsp.enable(server)
            end

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
