local options = require('givre.config').options

local variants = {
	dark = {
		--- Main
		bg = '#101010',
		fg = '#B8B8B8',
		accent = '#7F8B99',
		--- UI
		cursor_line = '#191919',
		inactive = '#383838',
		menu = '#000000',
		menu_sel = '#191919',
		separator = '#1E1E1E',
		visual = '#242424',
		whitespace = '#303030',

		shade1 = '#636363',
		shade2 = '#797979',
		shade3 = '#868686',
		shade4 = '#989898',
		shade5 = '#AAAAAA',
		--- Syntax and shades
		identifier = '#929292',
		number = '#AF9A8A',
		tag = '#336275',
		type = '#BBA08B',
		--- Misc
		danger = '#E56E6B',
		warn = '#BB906E',
		success = '#659A68',
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
