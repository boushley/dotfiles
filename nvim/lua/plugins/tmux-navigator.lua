return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Go left" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Go down" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Go up" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Go right" },
    },
  },
}
