return {
  'rcarriga/nvim-notify',
  opts = {
    timeout = 1000,
    render = 'compact',
    background_colour = '#000000',
  },
  config = function(_, opts)
    require('notify').setup(opts)
  end,
}
