fx_version 'cerulean'
games { 'gta5' }

author 'Jérémy (github/jrmydix)'
description '💊 ESX Fivem - Usable oblivion pill'
version '1.2.0'

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

dependencies {
    'es_extended'
}
