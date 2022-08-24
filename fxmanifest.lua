fx_version 'cerulean'
game 'gta5'
author 'chakotay'
description 'Redesign no id-deathui'
lua54 'yes'
version "1.0.1"

client_scripts {
    'client/*.lua',
    'shared/*.lua',
}

server_scripts {
    'server/*.lua',
    'shared/*.lua',
}

ui_page "web/index.html"

files {
    'web/index.html',
    'web/script.js',
    'web/style.css',
    'web/img/*.png',
}
