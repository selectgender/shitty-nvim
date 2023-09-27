local theme = "doom"
vim.opt.statusline = "%!v:lua.require('modules.modeline." .. theme .. "').run()"
