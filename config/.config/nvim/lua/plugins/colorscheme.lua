return {
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    priority = 1000, -- make sure to load this before other plugins that change the colorscheme
    opts = {
      -- options go here
      style = "dark", -- choose between "dark" or "light"
      transparent = false, -- set to true if you want a transparent background
      italic_comments = true, -- set to true to italicize comments
    },
  },
  -- Configure LazyVim to use the vscode colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
