local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("lazy").setup("plugins")

-----------------------------------------
--- This is the code I am using to change colorscheme with time 
--- currently sticking with rose-pine-main
----------------------------------------
-- local function set_colorscheme_by_time()
--     local hour = tonumber(os.date("%H"))
--
--     if hour >= 6 and hour < 18 then
--         vim.cmd("colorscheme rose-pine-dawn")
--     else
--         vim.cmd("colorscheme kanagawa-dragon")
--     end
-- end

-- Call the function to set the colorscheme on startup
-- vim.api.nvim_create_autocmd("VimEnter", { callback = set_colorscheme_by_time })
