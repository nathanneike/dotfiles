return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,          -- changed: show hidden files
          hide_dotfiles = false,   -- changed: show dotfiles
          hide_gitignored = false,
        },
      },
      window = {
        width = 30,
        mappings = {
          ["t"] = "open_tabnew",   -- added: t opens the file in a new tab
        },
      },
      close_if_last_window = true,
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end
        }
      }
    })
  end,
  keys = {
    { "<leader>e", ":Neotree<CR>", noremap = true, silent = true },
    { "<leader>h", "<C-w>h", noremap = true, silent = true },
    { "<leader>l", "<C-w>l", noremap = true, silent = true },
  },
}
