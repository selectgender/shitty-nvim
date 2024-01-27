local plugins = {
	"lopi-py/luau-lsp.nvim",
	{
		"NvChad/nvim-colorizer.lua",
		init = function()
			require("core.utils").lazy_load("nvim-colorizer.lua")
		end,
		config = function(_, opts)
			require("colorizer").setup(opts)

			-- execute colorizer as soon as possible
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		config = function(_, _opts)
			require("nvim-web-devicons").setup()
		end,
	},

	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return require("plugins.configs.mason")
		end,
		config = function(_, opts)
			require("mason").setup(opts)

			-- custom nvchad cmd to install all mason binaries listed
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"luau-lsp.nvim",
		},
		init = function()
			require("core.utils").lazy_load("nvim-lspconfig")
		end,
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		init = function()
			require("core.utils").lazy_load("nvim-lint")
		end,
		config = function()
			require("plugins.configs.nvim-lint")
		end,
	},

	{
		"stevearc/conform.nvim",
		init = function()
			require("core.utils").lazy_load("conform.nvim")
		end,
		config = function()
			require("plugins.configs.conform")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		opts = function()
			return require("plugins.configs.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"dcampos/nvim-snippy",
		ft = "snippets",
		cmd = { "SnippyEdit", "SnippyReload" },
		opts = {
			mappings = {
				is = {
					["<Tab>"] = "expand_or_advance",
					["<S-Tab>"] = "previous",
				},
				nx = {
					["<leader>x"] = "cut_text",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "luau-lsp.nvim" },
		init = function()
			require("core.utils").lazy_load("nvim-treesitter")
		end,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("luau-lsp").treesitter()
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		cmd = "Telescope",
		init = function()
			require("core.utils").load_mappings("telescope")
		end,
		opts = function()
			return require("plugins.configs.telescope")
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
		end,
	},

	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		init = function()
			require("core.utils").load_mappings("oil")
		end,
		config = function()
			require("oil").setup()
		end,
	},

	{
		"rlane/pounce.nvim",
		cmd = "Pounce",
		init = function()
			require("core.utils").load_mappings("pounce")
		end,
	},

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
		cmd = "Neorg",
		ft = "norg",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								school = "~/dox/norg-school",
								personal = "~/dox/norg-personal",
							},
						},
					},
					["core.integrations.telescope"] = {},
					["core.esupports.hop"] = {},
				},
			})

			local neorg_callbacks = require("neorg.core.callbacks")

			neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
				-- Map all the below keybinds only when the "norg" mode is active
				keybinds.map_event_to_mode("norg", {
					n = { -- Bind keys in normal mode
						{ "<leader>nf", "core.integrations.telescope.find_linkable" },
						{ "<leader>ni", "core.integrations.telescope.insert_file_link" },
					},
				}, {
					silent = true,
					noremap = true,
				})
			end)
		end,
	},
}

require("lazy").setup(plugins, require("plugins.configs.lazy"))
