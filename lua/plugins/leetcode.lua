return {
	"kawre/leetcode.nvim",
	cmd = "Leet",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-lua/plenary.nvim" }, -- required by telescope
		{ "MunifTanjim/nui.nvim" },

		-- optional
		{ "rcarriga/nvim-notify", optional = true },
		{ "nvim-tree/nvim-web-devicons", optional = true },
		{
			"nvim-treesitter/nvim-treesitter",
			optional = true,
			opts = function(_, opts)
				if opts.ensure_installed ~= "all" then
					opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "html" })
				end
			end,
		},
		{
			"AstroNvim/astrocore",
			opts = {
				autocmds = {
					leetcode_autostart = {
						{
							event = "VimEnter",
							desc = "Start leetcode.nvim on startup",
							nested = true,
							callback = function()
								if vim.fn.argc() ~= 1 then
									return
								end -- return if more than one argument given
								local arg = vim.tbl_get(require("astrocore").plugin_opts("leetcode.nvim"), "arg")
									or "leetcode.nvim"
								if vim.fn.argv()[1] ~= arg then
									return
								end -- return if argument doesn't match trigger
								local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
								if #lines > 1 or (#lines == 1 and lines[1]:len() > 0) then
									return
								end -- return if buffer is non-empty
								require("leetcode").start(true)
							end,
						},
					},
				},
			},
		},
	},
	opts = {
		injector = {
			["cpp"] = {
				before = {
					"#include <bits/stdc++.h>",
					"using namespace std;",
					"struct ListNode {",
					"     int val;",
					"     ListNode *next;",
					"     ListNode() : val(0), next(nullptr) {}",
					"     ListNode(int x) : val(x), next(nullptr) {}",
					"     ListNode(int x, ListNode *next) : val(x), next(next) {}",
					" };",
					"struct TreeNode {",
					"    int val;",
					"    TreeNode *left;",
					"    TreeNode *right;",
					"    TreeNode() : val(0), left(nullptr), right(nullptr) {}",
					"    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}",
					"    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}",
					"};",
				},
				after = "int main() {}",
			},
		},
	},
	config = function(_, opts)
		vim.keymap.set("n", "<leader>lr", ":Leet run<cr>")
		vim.keymap.set("n", "<leader>ls", ":Leet submit<cr>")
		vim.keymap.set("n", "<leader>lo", ":Leet open<cr>")
		vim.keymap.set("n", "<leader>li", ":Leet info<cr>")
		vim.keymap.set("n", "<leader>ll", ":Leet list<cr>")
		vim.keymap.set("n", "<leader>lc", ":Leet console<cr>")
		vim.keymap.set("n", "<leader>lm", ":Leet menu<cr>")

		require("leetcode").setup(opts)
	end,
}
