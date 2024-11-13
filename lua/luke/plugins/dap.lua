local js_based_languages = { "typescript", "javascript", "typescriptreact" }

return {
	"mfussenegger/nvim-dap",
	dependencies = { "theHamsta/nvim-dap-virtual-text" },
	config = function()
		local dap = require("dap")

		require("nvim-dap-virtual-text").setup()

		-- Set keymaps to control the debugger
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint Condition: "))
		end)

		-- Eval under cursor
		vim.keymap.set("n", "<leader>?", function()
			require("dapui").eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F2>", dap.step_into)
		vim.keymap.set("n", "<F3>", dap.step_over)
		vim.keymap.set("n", "<F4>", dap.step_out)
		vim.keymap.set("n", "<F5>", dap.step_back)
		vim.keymap.set("n", "<F12>", dap.restart)

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Auto Attach",
					cwd = vim.fn.getcwd(),
					-- processId = require("dap.utils").pick_process,
					-- cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-chrome",
					request = "launch",
					name = 'Start Chrome with "localhost"',
					url = "http://localhost:3000",
					webRoot = "${workspaceFolder}",
					userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
				},
			}
		end
	end,
}
