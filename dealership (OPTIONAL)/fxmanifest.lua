fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'VORP' -- CrimsonFreak
description 'A lua version of vorp_stables'

files {
  'UI/dist/assets/*.js',
  'UI/dist/assets/*.css',
  'UI/dist/index.html',
}

ui_page 'UI/dist/index.html'
ui_cursor 'yes'

server_script {
  "Server/main.lua"
}
client_script {
  'Client/*.lua'
}

shared_script {
  "keys.lua",
  "events.lua",
  "data.lua",
  "languages.lua",
  "deathReasons.lua",
  "config.lua",
}

--version check dont touch
version '1.2'
vorp_checker 'yes'
vorp_name '^4Resource version Check^3'
vorp_github 'https://github.com/VORPCORE/vorp_stables-lua'
