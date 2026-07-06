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


    -- Global variable to track the Processing terminal buffer
    _G.processing_term_buf = nil

    local function run_processing_sketch()
      -- 1. Close existing terminal buffer if it's still open
      if _G.processing_term_buf and vim.api.nvim_buf_is_valid(_G.processing_term_buf) then
        -- force = true ensures that we can close the buffer even if the command is still running
        vim.api.nvim_buf_delete(_G.processing_term_buf, { force = true })
      end

      -- 2. Define the command
      local sketch_path = vim.fn.expand('%:p:h')
      local cmd = string.format("processing-java --sketch=%s --force --run", sketch_path)

      -- 3. Open a split and start the terminal
      local height = math.floor(vim.o.lines * 0.20)
      vim.cmd(height .. "split")
      vim.cmd("term " .. cmd)

      -- 4. Save the new buffer ID and set it to auto-scroll/cleanup
      _G.processing_term_buf = vim.api.nvim_get_current_buf()
    end

    -- Update your keymap inside the Autocmd callback:
    vim.keymap.set('n', '<leader>r', run_processing_sketch, { buffer = true, desc = "Run Processing Sketch" })
  end,
})
