return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.config").setup({
                ensure_installed = {
                    "python",
                    "lua",
                    "bash",
                    "json",
                    "markdown",
                },
                highlight = {
                    enable = true,
                },
            })
        end,
    },
}
