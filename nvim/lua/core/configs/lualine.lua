-- Description: Lualine statusline configuration
local function date()
	return os.date("%d/%m %H:%M")
end

require('lualine').setup {
  options = {
	theme = 'gruvbox',
	section_separators = {left = '', right = ''}, 	-- Fira Code Glyphs
	component_separators = {left = '', right = ''},	-- Fira Code Glyphs
	icons_enabled = true,
  },
  sections = {
	lualine_a = {'mode'},
	lualine_b = {'diagnostic', 'branch', 'progress'},
	lualine_c = {'filename'},
	lualine_x = {'encoding', 'fileformat', 'filetype'},
	lualine_y = {date},
	lualine_z = {'location'}
  },
  tabline = {},
  extensions = {}
}