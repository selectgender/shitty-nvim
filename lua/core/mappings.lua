--[[
  Keybinding philosophy overview:
  KEEP THOSE DAMN FINGERS IN THE HOMEROW
  and I mean this in the most strict fucking sense possible
  EVERY SINGLE CUSTOM KEYBINDING SHOULD BE ON THE HOMEROW

  a, s, d, f, g, h, j, k, l

  the space key is also cool
--]]

local M = {}

M.general = {
	i = {
		["<C-b>"] = { "<ESC>^i", "Beginning of line" },
		["<C-e>"] = { "<End>", "End of line" },

		["<C-s>"] = { "<ESC>:w <CR>", "Save file" },
		["jk"] = { "<ESC>", "Normal mode" },
	},

	n = {
		["j"] = { "<C-d>" },
		["k"] = { "<C-u>" },
		["f"] = {
			function()
				vim.diagnostic.open_float(nil, { focus = true, scope = "cursor" })
			end,
			"Open diagnostic float",
		},
		["<Esc>"] = { ":noh <CR>", "Clear highlights" },

		["<C-h>"] = { "<C-w>h", "Window left" },
		["<C-l>"] = { "<C-w>l", "Window right" },
		["<C-j>"] = { "<C-w>j", "Window down" },
		["<C-k>"] = { "<C-w>k", "Window up" },

		["<C-s>"] = { ":w <CR>", "Save file" },
		["<C-c>"] = { "<C-w>c", "Close window" },

		-- yeah it looks extremely stupid but
		-- i dont use these keys anymore and
		-- and there are some off chances where i need these
		["H"] = { "h", "Left" },
		["L"] = { "l", "Right" },
		["J"] = { "j", "Down" },
		["K"] = { "k", "Up" },

		["<leader>r"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
	},

	v = {
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
		["<"] = { "<gv^", "Indent right" },
		[">"] = { ">gv^", "Indent right" },
		["J"] = { ":m '>+1<CR>gv=gv", "Move line down" },
		["K"] = { ":m '<-2<CR>gv=gv", "Move line up" },
		[" "] = { "<ESC>", "Escape" },
	},
}

M.telescope = {
	plugin = true,

	n = {
		["l"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["h"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
	},
}

M.oil = {
	plugin = true,

	n = {
		[";"] = { "<cmd> Oil <CR>", "Opens Oil" },
	},
}

M.pounce = {
	plugin = true,

	n = {
		["s"] = { "<cmd> Pounce <CR>", "Activate pounce" },
	},
}

return M
