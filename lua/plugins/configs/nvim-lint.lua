require("lint").linters_by_ft = {
	lua = { "selene" },
	luau = { "selene" },
	typescript = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
