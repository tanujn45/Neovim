vim.cmd("set number")
vim.cmd("set re=0")
vim.cmd("set linebreak")
vim.cmd("set showmatch")
vim.cmd("set rnu")
vim.cmd("set hlsearch")
vim.cmd("set smartcase")
vim.cmd("set ignorecase")
vim.cmd("set incsearch")
vim.cmd("set smartindent")
vim.cmd("set cindent")
vim.cmd("set shiftwidth=4")
-- vim.cmd("set smartindent")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set softtabstop=4")
vim.cmd("set termguicolors")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("filetype plugin indent on")
vim.cmd("set scrolloff=15")
vim.opt.clipboard:append("unnamedplus")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.guicursor = ""
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
function TidyUpCodes()
    local linenumber = vim.fn.line(".") - 1
    vim.cmd("normal! ggVG=" .. linenumber .. "j")
end

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
-- Map the function to <leader>=
vim.api.nvim_set_keymap("n", "<leader>=", ":lua TidyUpCodes()<CR>", { noremap = true, silent = true })
