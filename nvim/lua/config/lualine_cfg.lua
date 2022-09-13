local config = {
    options = {
        section_separators = '',
	component_separators = '',
	theme = 'auto',
    },
    extensions = {
	'nvim-tree',
   }
}

require('lualine').setup(config)
