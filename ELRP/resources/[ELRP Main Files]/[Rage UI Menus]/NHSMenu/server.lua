local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "nhsmenu")

RegisterServerEvent("TBRP:GetPlayerInformation")
AddEventHandler(
    "TBRP:GetPlayerInformation",
    function()
        local source = source
        user_id = vRP.getUserId({source})
        if vRP.hasPermission({user_id, cfg.perm}) then
            players = GetPlayers()
            players_table = {}
            menu_btns_table = {}
            for i, p in pairs(players) do
                name = GetPlayerName(p)
                user_id = vRP.getUserId({p})
                players_table[p] = {name, p, user_id}
            end
            if cfg.IgnoreButtonPerms == false then
                for i, b in pairs(cfg.buttonsEnabled) do
                    if b[1] and vRP.hasPermission({user_id, b[2]}) then
                        menu_btns_table[i] = true
                    else
                        menu_btns_table[i] = false
                    end
                end
            else
                for j, t in pairs(cfg.buttonsEnabled) do
                    menu_btns_table[j] = true
                end
            end

            TriggerClientEvent("TBRP:SendPlayersInfo", source, players_table, menu_btns_table)
        end
    end
)

RegisterServerEvent("TBRP:REVIVE")
AddEventHandler(
    "TBRP:REVIVE",
    function(id)
        vRPclient.varyHealth(id, {200})
    end
)