local chosen = "catppuccin"

local base16_cache = vim.fn.stdpath("data") .. "/custom_modules/base16/"

-- I have no idea what the fuck this means
local base16_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")

local M = {}

M.get_theme_table = function(type)
	local present, theme = pcall(require, "modules.base16.themes." .. chosen)

	if present then
		return theme[type]
	else
		error("current theme doesnt exist dumbass facepalm emoji")
	end
end

M.load_highlight = function(group)
	return require("modules.base16.integrations." .. group)
end

M.table_to_str = function(tb)
	local result = ""

	for hlgroupName, hlgroup_vals in pairs(tb) do
		local hlname = "'" .. hlgroupName .. "',"
		local opts = ""

		for optName, optVal in pairs(hlgroup_vals) do
			local valueInStr = ((type(optVal)) == "boolean" or type(optVal) == "number") and tostring(optVal)
				or '"' .. optVal .. '"'
			opts = opts .. optName .. "=" .. valueInStr .. ","
		end

		result = result .. "vim.api.nvim_set_hl(0," .. hlname .. "{" .. opts .. "})"
	end

	return result
end

M.save_string_to_cache = function(filename, tb)
	local bg_opt = "vim.opt.bg='" .. M.get_theme_table("type") .. "'"
	local defaults_cond = filename == "defaults" and bg_opt or ""

	local lines = "return string.dump(function()" .. defaults_cond .. M.table_to_str(tb) .. "end, true)"
	local file = io.open(base16_cache .. filename, "wb")

	if file then
		file:write(loadstring(lines)())
		file:close()
	end
end

M.compile = function()
	if not vim.loop.fs_stat(base16_cache) then
		vim.fn.mkdir(base16_cache, "p")
	end

	local hl_files = base16_path .. "/integrations"

	for _, file in ipairs(vim.fn.readdir(hl_files)) do
		if file ~= "statusline" or file ~= "treesitter" then
			local filename = vim.fn.fnamemodify(file, ":r")
			M.save_string_to_cache(filename, M.load_highlight(filename))
		end
	end
end

M.load_all_highlights = function()
	for _, file in ipairs(vim.fn.readdir(base16_cache)) do
		dofile(base16_cache .. file)
	end
end

return M
