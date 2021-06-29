-- resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
fx_version 'adamant'
game 'gta5'

name 'Mythic Framework Notification System Modifier by TaerAttO'
author 'Alzar - https://github.com/Alzar - https://github.com/MonsterTaerAttO/mythic_notify'
version 'v1.1.0'

ui_page {
    'html/ui.html',
}

files {
	'html/ui.html',
	'html/js/app.js', 
	'html/css/style.css',
}

client_scripts {
	'client/main.lua',
}

exports {
	'SendAlert',
	'SendUniqueAlert',
	'PersistentAlert',
}