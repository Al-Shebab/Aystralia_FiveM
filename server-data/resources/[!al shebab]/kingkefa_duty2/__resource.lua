resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'Coding by KingKefa for Core-V'
version '1.0.0'

client_script {
    "config/Config.lua",
    "client.lua"
}

server_scripts {
    "config/Config.lua",
    "server.lua"
}

ui_page "html/index.html"
files {
    'html/index.html',
    'html/*.js',
    'html/*.css',
    'html/bilder/*.png'
}
