-- font
vim.opt.guifont = 'Hack Nerd Font Mono'

--syntax highlighting
vim.cmd.filetype('on')

-- path for finding files
vim.opt.path:append { "**" }

-- set tab 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.cmd.retab()
-- <TAB> are spaces
vim.opt.expandtab = true
-- end of tab settings

-- set list if we want to see everything
vim.opt.listchars = { tab = '»»' ,space = '·',eol = '$' }

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

local function netrw()
  local netrw_settings = {
    banner = {
      no = 0
    },
    liststyle = {
      tree = 3
    },
    browse_split = {
      previous_window = 4
    }
  }
  -- netrw settings
  -- no annoying banner
  vim.g.netrw_banner = netrw_settings.banner.no
  vim.g.netrw_liststyle = netrw_settings.liststyle.tree
  vim.g.netrw_browse_split = netrw_settings.browse_split.previous_window
  -- vim.g.netrw_altv = 1
  vim.g.netrw_usetab = 1
  vim.g.netrw_winsize = 10
end

netrw()

local function neovide()
  if vim.g.neovide == true then
    vim.g.neovide_scale_factor = 0.75
  end
end

neovide()

vim.cmd([[   
  " highlight trailing spaces red
  " https://stackoverflow.com/questions/48935451/how-do-i-get-vim-to-highlight-trailing-whitespaces-while-using-vim-at-the-same-t
  highlight RedundantSpaces ctermbg=red guibg=red
  match RedundantSpaces /\s\+$/
  
  colorscheme default
  " set background=dark
]])
