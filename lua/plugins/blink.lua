return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "*",

	opts = {
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
