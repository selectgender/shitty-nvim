local no_config = {
	"tsserver",
}

for _, name in ipairs(no_config) do
	require("lspconfig")[name].setup({})
end

require("lspconfig").lua_ls.setup({
	-- on_attach = M.on_attach,
	-- capabilities = M.capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

require("lspconfig").luau_lsp.setup({})
require("luau-lsp").setup({
	sourcemap = {
		enable = true, -- enable sourcemap generation
	},
	types = {
		roblox = true, -- enable roblox api
	},
	server = {
		settings = {
			["luau-lsp"] = {
				-- enable auto imports
				completion = {
					imports = {
						enabled = true,
					},
				},
			},
		},
	},
})
