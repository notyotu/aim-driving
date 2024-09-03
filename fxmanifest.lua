fx_version 'cerulean'
game 'gta5'

author 'notyotu'
description 'Controla si el conductor o el pasajero pueden disparar desde el interior del vehiculo en funcion de la velocidad.'
version '1.0.0'

client_script 'client.lua'
server_script 'server.lua'
shared_script 'config.lua'

escrow_ignore {
    'client.lua',
    'server.lua',
    'config.lua'
}
