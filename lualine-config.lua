local config = {}

--[[ initialize lualine with current theme ]]--
config.configure_with_theme = function(theme_name)
  local gps = require("nvim-gps")
  require'lualine'.setup{
    options = { theme = theme_name },
    sections = {
      lualine_b = {'branch', 'b:gitsigns_status'},
      lualine_c = {
        { 'filename', path = 0 },
        {gps.get_location, condition = gps.is_available}
      },
      lualine_x = {'encoding', 'filetype'},
      lualine_y = {{
          'diagnostics',
          sources = {'nvim_lsp'},
          color_error = '#ff0000',
          color_warn = '#ffff00',
          color_info = '#0000ff',
          color_hint = '#00ff00'
        }}
    },
    extensions={'fugitive', 'quickfix'}
  }
end

return config
