local M = {}

M.disabled = {
	n = {
		["<Left>"] = { "" },
		["<Right>"] = { "" },
		["<Up>"] = { "" },
		["<Down>"] = { "" },
		["<PageUp>"] = { "" },
		["<PageDown>"] = { "" },

		["h"] = { "" },
		["j"] = { "" },
		["k"] = { "" },
		["l"] = { "" },
	},
}

M.general = {
	i = {
		-- go to  beginning and end
		["<C-b>"] = { "<ESC>^i", "Beginning of line" },
		["<C-e>"] = { "<End>", "End of line" },

		-- navigate within insert mode
		["<C-h>"] = { "<Left>", "Move left" },
		["<C-l>"] = { "<Right>", "Move right" },
		["<C-j>"] = { "<Down>", "Move down" },
		["<C-k>"] = { "<Up>", "Move up" },
	},

	n = {
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

local terminal = require("modules.terminal")
M.terminal = {
	t = {
		-- toggle in terminal mode
		["<A-i>"] = {
			function()
				terminal.toggle("float")
			end,
			"Toggle floating term",
		},

		["<A-h>"] = {
			function()
				terminal.toggle("horizontal")
			end,
			"Toggle horizontal term",
		},

		["<A-v>"] = {
			function()
				terminal.toggle("vertical")
			end,
			"Toggle vertical term",
		},
	},

	n = {
		-- toggle in normal mode
		["<A-i>"] = {
			function()
				terminal.toggle("float")
			end,
			"Toggle floating term",
		},

		["<A-h>"] = {
			function()
				terminal.toggle("horizontal")
			end,
			"Toggle horizontal term",
		},

		["<A-v>"] = {
			function()
				terminal.toggle("vertical")
			end,
			"Toggle vertical term",
		},

		-- new
		["<leader>h"] = {
			function()
				terminal.new("horizontal")
			end,
			"New horizontal term",
		},

		["<leader>v"] = {
			function()
				terminal.new("vertical")
			end,
			"New vertical term",
		},
	},
}

M.telescope = {
	plugin = true,

	n = {
		-- find
		[","] = { "<cmd> Telescope find_files <CR>", "Find files" },
		--[[
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ]]
	},
}

M.oil = {
	plugin = true,

	n = {
		["-"] = { "<cmd> Oil <CR>", "Opens Oil" },
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

--[[
-- dont need this now but in case you find a use case for it you can activate
M.neomarks = {
	plugin = true,

	n = {
		["<C-a>"] = {
			function()
				require("neomarks").mark_file()
			end,
			"Neomarks mark file",
		},
		["<C-m>"] = {
			function()
				require("neomarks").ui_toggle()
			end,
			"Neomarks toggle ui",
		},
	},
}

for i = 1, 9 do
	M.neomarks["<C-" .. i] = {
		function()
			require("neomarks").jump_to(i)
		end,
		"Neomarks jump to " .. i,
	}
end
]]

return M
