return {
  'rcarriga/nvim-notify',
  opts = {
    timeout = 2000,
  },
  config = function(_, opts)
    require('notify').setup(opts)
  end,
}
