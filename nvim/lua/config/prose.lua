-- Prose/long-line editing mode
-- Auto-enables for markdown, text, gitcommit, mail filetypes
-- Toggle with <leader>tp for any buffer

local M = {}

function M.enable()
  vim.opt_local.wrap = true
  vim.opt_local.linebreak = true
  vim.opt_local.breakindent = true
  vim.opt_local.showbreak = '↪ '
  vim.opt_local.textwidth = 0
  vim.opt_local.spell = true
  vim.opt_local.spelllang = 'en_us'
  vim.opt_local.formatoptions:remove({ 't', 'a', 'r', 'o' })

  -- Count-aware j/k remaps: plain j/k move by screen line, {count}j/k move by logical line
  local opts = { buffer = true, silent = true }
  vim.keymap.set({ 'n', 'v' }, 'j', function()
    return vim.v.count == 0 and 'gj' or 'j'
  end, vim.tbl_extend('force', opts, { expr = true, desc = 'Down (screen line)' }))
  vim.keymap.set({ 'n', 'v' }, 'k', function()
    return vim.v.count == 0 and 'gk' or 'k'
  end, vim.tbl_extend('force', opts, { expr = true, desc = 'Up (screen line)' }))

  vim.b.prose_mode = true
end

function M.disable()
  vim.opt_local.wrap = false
  vim.opt_local.linebreak = false
  vim.opt_local.showbreak = ''
  vim.opt_local.textwidth = 0
  vim.opt_local.spell = false

  -- Remove buffer-local j/k remaps
  pcall(vim.keymap.del, { 'n', 'v' }, 'j', { buffer = true })
  pcall(vim.keymap.del, { 'n', 'v' }, 'k', { buffer = true })

  vim.b.prose_mode = false
end

function M.toggle()
  if vim.b.prose_mode then
    M.disable()
    vim.notify('Prose mode disabled', vim.log.levels.INFO)
  else
    M.enable()
    vim.notify('Prose mode enabled', vim.log.levels.INFO)
  end
end

-- Auto-enable for prose filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('prose-mode', { clear = true }),
  pattern = { 'markdown', 'text', 'gitcommit', 'mail' },
  callback = function()
    M.enable()
  end,
})

-- Toggle keymap
vim.keymap.set('n', '<leader>tp', M.toggle, { desc = '[T]oggle [P]rose mode' })

return M
