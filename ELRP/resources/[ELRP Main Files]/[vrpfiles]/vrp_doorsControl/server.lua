local cfg = module("vrp_doorsControl", "config")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_doorsControl")

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
		TriggerClientEvent('vrp:load', source, cfg.list)
	end
end)

Citizen.CreateThread(function()
  Citizen.Wait(1000)
  TriggerClientEvent('vrp:load', -1, cfg.list)
end)

RegisterServerEvent('vrp:open')
AddEventHandler('vrp:open', function(id)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.hasPermission({user_id, "#"..cfg.list[id].key..".>0"}) or vRP.hasPermission({user_id,cfg.list[id].permission}) then
		SetTimeout(100, function()
			cfg.list[id].locked = not cfg.list[id].locked
			TriggerClientEvent('vrp:statusSend', (-1), id,cfg.list[id].locked)
			if cfg.list[id].pair ~= nil then
				local idsecond = cfg.list[id].pair
				cfg.list[idsecond].locked = cfg.list[id].locked
				TriggerClientEvent('vrp:statusSend', (-1), idsecond,cfg.list[id].locked)
			end
			if cfg.list[id].locked then
				vRPclient.playAnim(player, {false,{{"lockeddoor_trylock", "lockeddoor_tryopen", 1}},false})
			end
		end)
	else
		if cfg.list[id].keyname ~= nil then
			vRPclient.notify(player, {"~r~You need the key to open this door!"})
		else
			vRPclient.notify(player, {"~r~You need the key to open this door!"})
		end
	end
end)