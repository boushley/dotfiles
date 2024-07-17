return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>we",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "[W]orkspace [E]xplorer NeoTree",
    },
    {
      "<leader>wg",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "[W]orkspace [G]it Explorer",
    },
    {
      "<leader>wb",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end,
      desc = "[W]orkspace [B]uffer Explorer",
    },
  },
}
