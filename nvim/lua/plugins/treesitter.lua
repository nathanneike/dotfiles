return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "python",
                    "lua",
                    "bash",
                    "json",
                    "markdown",
                    "yaml",
                },
                highlight = {
                    enable = true,
                },
            })
        end,
    },
}
