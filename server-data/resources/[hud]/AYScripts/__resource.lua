fx_version'bodacious'
game'gta5'

server_scripts{
  "vs_server.lua",
  -- "handsup-server.lua",
  -- "sv_carry.lua",
  -- "sv_piggyback.lua",
  -- "sv_takehostage.lua",
  -- "sv_tackle.lua",
  -- "dispatch-server.lua"
}

-- client scripts
client_scripts{
  "vs_client.lua",
  -- "cfg/config.lua",
  -- "main.lua",
  "hud.lua",
  "mapfix.lua",
  -- "teleporter.lua",
  -- "teleporter.lua",
  -- "cl_afk.lua",
  -- "cl_antivdm.lua",
  -- "cl_carry.lua",
  -- "cl_commands.lua",
  -- "cl_tackle.lua",
  -- "cl_idsabovehead.lua",
  -- "cl_pointfinger.lua",
  -- "cl_takehostage.lua",
  -- "dv.lua",
  -- "vehiclecontrol.lua",
  -- "pvp.lua",
  -- "windows.lua",
  -- "pointfinger-client.lua",
  -- "handsup-client.lua",
  "stopwanted-client.lua", 
  "anticarmovement.lua", 
  -- "gameui-client.lua",
  -- "missiontext-client.lua",
  "Nopeds/client.lua",
	"cars/main.lua",
	"cars/config.lua",
  -- "noweapondrops-client.lua"
  "infinitespeed/config.lua",
  "infinitespeed/client.lua",
  "infinitespeed/city_speed_limit.lua",
 }
 
  exports {
    'getSurrenderStatus',
}

map 'defaultspawn.lua'