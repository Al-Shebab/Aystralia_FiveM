fx_version 'cerulean'
games { 'gta5' }
author 'author'

dependency 'essentialmode'

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/client.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/server.lua'
}