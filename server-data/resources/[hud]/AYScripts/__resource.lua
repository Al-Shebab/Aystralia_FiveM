fx_version'bodacious'
game'gta5'

server_scripts{
  "AYStaff-server.lua",
  "sv_chat.lua",
  "vs_server.lua",
  "GiveID-server.lua",
  -- "sv_carry.lua",
  -- "sv_piggyback.lua",
  -- "sv_takehostage.lua",
  -- "sv_tackle.lua",
  -- "dispatch-server.lua"
}

-- client scripts
client_scripts{
  "AYStaff-client.lua",
  "vs_client.lua",
  "blips.lua",
  -- "cfg/config.lua",
  -- "main.lua",
  "hud.lua",
  "stamina.lua",
  "GiveID-client.lua",
  "onscreenid.lua",
  -- "mapfix.lua",
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
  "stopwanted-client.lua", 
  "handsup.lua", 
  "holograms.lua", 
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