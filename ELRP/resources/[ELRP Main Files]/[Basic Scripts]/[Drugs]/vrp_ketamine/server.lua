---- SCRIPT EDITED BY MAILAR -----
--------DON'T TOUCH SCRIPT!-------
----------------------------------
----------------------------------
----------------------------------

MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_ketamine")


RegisterServerEvent('uwu:ketamine1')
AddEventHandler('uwu:ketamine1',function()
	local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.notify(player, {"~g~Starts collecting ~g~ketamine . . ."})
end)


RegisterServerEvent('uwu:ketamine1')
AddEventHandler('uwu:ketamine1', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.giveInventoryItem({user_id,"unprocessed ketamine", math.random(20, 20),true})
end)

RegisterServerEvent("uwu:ketamine")
AddEventHandler("uwu:ketamine", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    vRP.prompt({player, "How many do you want to sell?:", "", function(player, data)
        if(data ~= "" and data ~= nil)then
            local howmuch = tonumber(data)
            if howmuch then
                if vRP.tryGetInventoryItem({user_id,"ketamine", howmuch,true}) then
                    vRP.giveMoney({user_id, howmuch*20})
                    vRPclient.notify(player, {"~g~You sold ~g~ketamine and gain money!",false}) ---- Do not touch (FIXED) If you don't have the weed notify(player will not shown) Made by Mailar
               ------- else----------------------------------------------------------- [OLD CODE]
               -------------vRPclient.notify(player, {"~g~You sold ~o~weed!"})-------- [OLD CODE]
            end
          end
        end
    end})
end)