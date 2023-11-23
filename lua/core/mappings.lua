--[[mappings
  Keybinding philosophy overview:
  KEEP THOSE DAMN FINGERS IN THE HOMEROW
  and I mean this in the most strict fucking sense possible
  EVERY SINGLE CUSTOM KEYBINDING SHOULD BE ON THE HOMEROW

  a, s, d, f, g, h, j, k, l
--]]

local M = {}

M.general = {
	i = {
		-- go to  beginning and end
		["<C-b>"] = { "<ESC>^i", "Beginning of line" },
		["<C-e>"] = { "<End>", "End of line" },

		-- other shit
		["<C-s>"] = { ":w <CR>", "Save file" },
		["jk"] = { "<ESC>", "Normal mode" },
	},

	n = {
		["j"] = { "<C-d>" },
		["k"] = { "<C-u>" },
		["<Esc>"] = { ":noh <CR>", "Clear highlights" },
		["<C-h>"] = { "<C-w>h", "Window left" },
		["<C-l>"] = { "<C-w>l", "Window right" },
		["<C-j>"] = { "<C-w>j", "Window down" },
		["<C-k>"] = { "<C-w>k", "Window up" },
	},

	v = {
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
		["<"] = { "<gv^", "Indent right" },
		[">"] = { ">gv^", "Indent right" },
	},
}

M.telescope = {
	plugin = true,

	n = {
		-- [","] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["l"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		-- ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		["h"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		--[[
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ]]
	},
}

M.oil = {
	plugin = true,

	n = {
		-- ["-"] = { "<cmd> Oil <CR>", "Opens Oil" },
		[";"] = { "<cmd> Oil <CR>", "Opens Oil" },
	},
}

M.leap = {
	plugin = true,

	n = {
		["s"] = {
			function()
				require("leap").leap({})
			end,
			"",
		},
		["S"] = {
			function()
				require("leap").leap({ backward = true, ["match-xxx*-at-the-end?"] = true })
			end,
		},
	},
}

return M
