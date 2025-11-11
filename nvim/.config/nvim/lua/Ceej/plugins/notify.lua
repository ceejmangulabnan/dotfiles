return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			timeout = 1000,
		})
		vim.schedule(function()
			vim.notify = notify
		end)
	end,
}
