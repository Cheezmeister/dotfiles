-- Brendan's neovim config, est. 15 Sep 2023
--
-- First I followed this guide https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb
-- I also skimmed https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- Then I did some other stuff, and now I have this ¯\_(ツ)_/¯

-- Slurp in my whole vimrc (est. ca. Jun 2013)
-- TODO: Decide whether to translate this all to Lua. Probably not.
vim.cmd.source("~/dotfiles/vimrc")

-- require('plugins')
-- This file lives here:
-- This comment exists so I can `gf` into it 
-- ~/.config/nvim/lua/plugins.lua 
--

-- Instead let's use
require("~/dotfiles/config/nvim/lua/plugins.lua")

