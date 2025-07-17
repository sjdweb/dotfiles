return {
  -- Add additional language support
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  
  -- Add useful UI enhancements
  { import = "lazyvim.plugins.extras.ui.mini-animate" },
  
  -- Add GitHub Copilot (optional - comment out if not needed)
  -- { import = "lazyvim.plugins.extras.coding.copilot" },

  -- Configure LazyVim to use tokyonight colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}