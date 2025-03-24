vim.g.mapleader = " " -- set leader key before Lazy
vim.g.maplocalleader = " " -- set leader key before Lazy

-- vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
-- vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
-- vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
-- vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" }) -- Smaller dot
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

require("setup.lazy-init")
require("setup.settings")
require("setup.keymaps")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- some hacky generated stuff
vim.keymap.set("n", "K", function()
	local winid = vim.fn.bufwinid("[Lsp Hover]") -- Check if hover is open
	if winid ~= -1 then
		vim.cmd("wincmd p") -- Jump into hover window if it's open
	else
		vim.lsp.buf.hover()
	end
end, { noremap = true, silent = true })
