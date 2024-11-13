return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_lspconfig()

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		lsp_zero.set_sign_icons({
			error = " ",
			hint = " 󰠠",
			info = " ",
			warn = " ",
		})
	end,
}
