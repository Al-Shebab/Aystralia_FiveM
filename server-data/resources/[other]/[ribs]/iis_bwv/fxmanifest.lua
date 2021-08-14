-- Resource Metadata
fx_version 'bodacious'
games { 'gta5' }

author 'Infinity Studios'
description 'A simple body-worn camera script.'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/sounds/axon_in.ogg',
    'html/sounds/axon_out.ogg',
    'html/sounds/reveal_in.ogg',
    'html/sounds/reveal_out.ogg',
    'html/images/axon.png'
}

shared_script 'config.lua'

client_script 'client.lua'

server_script 'server.lua'