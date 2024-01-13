local cmp = require("cmp")
local snippy = require("snippy")

local config = {
	-- do you REALLY need completion ALL THE TIME??
	-- I feel like adopting a snippet based workflow is much faster than monkey braining autocomplete
	-- <C-SPC> to complete
	-- nvm lol lets try this again
	-- completion = { autocomplete = false },
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
	snippet = {
		expand = function(args)
			snippy.expand_snippet(args.body)
		end,
	},
}

return config
