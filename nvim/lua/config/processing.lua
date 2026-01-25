-- Recognize the filetype from the extension
vim.filetype.add({
  extension = {
    pde = 'processing',
  },
})

-- Enable syntax highlighting
vim.treesitter.language.register('java', 'processing')

-- Buffer commands when in a processing buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "processing",
  callback = function()
    -- Set the compiler command for :make
    vim.opt_local.makeprg = "processing-java --sketch=%:p:h --force --run"

    -- Set the error format to enable jumping to code lines from the Quickfix window
    vim.opt_local.errorformat = "%f:%l:%c:%*\\d:%*\\d:%t%*[^:]:%m"

    -- Optional: Add a keymap specifically for this filetype to run it easily
    vim.keymap.set('n', '<leader>r', ':split | term processing-java --sketch=%:p:h --force --run<CR>', { buffer = true })
  end,
})
