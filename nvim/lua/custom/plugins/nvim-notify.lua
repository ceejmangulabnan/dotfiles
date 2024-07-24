return {
  'rcarriga/nvim-notify',
  opts = {
    timeout = 1000,
    render = 'compact',
  },
  config = function(_, opts)
    require('notify').setup(opts)
  end,
}
