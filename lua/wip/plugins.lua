local fn = vim.fn

-- Automatically install packer local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob("~/.local/share/nvim/site/pack/packer/start/packer.nvim")) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    "~/.local/share/nvim/site/pack/packer/start/packer.nvim",
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- INSERT PLUGINS HERE
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- GENERAL
  use "nvim-lua/popup.nvim"
  use 'nvim-lua/plenary.nvim'
  use 'folke/which-key.nvim'
  use "moll/vim-bbye"
  use "akinsho/bufferline.nvim"
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "nvim-lualine/lualine.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use 'wakatime/vim-wakatime'
  --use "sbdchd/neoformat"

  use "ThePrimeagen/git-worktree.nvim"
  use "ThePrimeagen/harpoon"
  use "mbbill/undotree"

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'simrat39/rust-tools.nvim'
  use 'github/copilot.vim'

  -- DAP
  use 'mfussenegger/nvim-dap'

  -- CMP PLUGINS
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use 'onsails/lspkind-nvim' -- icons
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions

  -- SNIPPETS
  use "L3MON4D3/LuaSnip" --snippet engine
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- THEMES
  use "morhetz/gruvbox"
  use "xiyaowong/nvim-transparent"

  -- FILE TREE
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- TELESCOPE
  use "nvim-telescope/telescope.nvim"

  -- TREESITTER
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Git
  use "lewis6991/gitsigns.nvim"
  
  -- format
  use "sbdchd/neoformat"

  -- multi cursor
  use 'mg979/vim-visual-multi'

  -- Bootstrapping
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

-- Use this command to setup your config on a new machine
-- nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
