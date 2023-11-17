local options = require('givre.config').options

local variants = {
	dark = {
		--- Main
		bg = '#101010',
		fg = '#B8B8B8',
		accent = '#778998',
		--- UI
		cursor_line = '#191919',
		inactive = '#383838',
		menu = '#000000',
		menu_sel = '#191919',
		separator = '#1E1E1E',
		visual = '#242424',
		whitespace = '#303030',

		shade1 = '#696969',
		shade2 = '#7D7D7D',
		shade3 = '#8C8C8C',
		shade4 = '#9E9E9E',
		shade5 = '#B0B0B0',
		--- Syntax and shades
		identifier = '#929292',
		number = '#AF9A8A',
		tag = '#3F7890',
		type = '#BBA08B',
		--- Misc
		danger = '#CC6F6D',
		warn = '#BB906E',
		info = '#7E9A94',
		success = '#7DA98E',
	},

	light = {},
}

if options.variant ~= nil and options.variant ~= 'auto' then
	return variants[options.variant]
end

if vim.o.background == 'light' then
	vim.notify('light mode is still in beta')
	return variants.light
end
return variants.dark
