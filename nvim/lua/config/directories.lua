-- Disable netrw since I prefer Neotree listings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Custom Autocommand for Directory Launch
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open Neo-Tree and focus the blank buffer",
  callback = function()
    -- Get the arguments passed to nvim
    local args = vim.fn.argv()

    if #args == 0 then
	require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        -- Move focus to the main window (away from Neo-tree)
        vim.cmd("wincmd p") 
    -- Check if there is exactly one argument and it is a directory
    elseif #args == 1 then
      local path = args[1]
      if vim.fn.isdirectory(path) == 1 then

        -- Change the working directory to the passed path
        vim.cmd("cd " .. path)

        -- Open Neo-tree (filesystem source)
	require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })

        -- Move focus to the main window (away from Neo-tree)
        vim.cmd("wincmd p") 
      end
    end
  end,
})
