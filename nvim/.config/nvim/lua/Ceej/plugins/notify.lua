return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			timeout = 500,
			render = "compact",
		})
		vim.schedule(function()
			vim.notify = notify
		end)
	end,
}
