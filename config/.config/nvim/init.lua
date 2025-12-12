-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Hide tmux status bar when entering Neovim, restore on exit
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    os.execute("tmux set status off")
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    os.execute("tmux set status on")
  end,
})
