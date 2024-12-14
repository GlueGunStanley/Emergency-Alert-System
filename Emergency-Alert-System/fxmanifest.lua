fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Stanley Development Studios'
description 'This is an API that allows you to trigger EAS alerts in your server.'

github 'https://github.com/GlueGunStanley/Emergency-Alert-System'
discord 'https://discord.com/invite/uCKZJed3Gq'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_main.lua',
}