local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP_gunshop")

RegisterServerEvent("VRPGUNSHOPS:buywap")
AddEventHandler('VRPGUNSHOPS:buywap', function(price, hash)
    local source = source
    userid = vRP.getUserId({source})
    if cfg.perm ~= nil then 
        if vRP.hasPermission({userid, cfg.perm}) then
            if vRP.tryPayment({userid, price}) then
                TriggerClientEvent("VRPGUNSHOPS:givewap", source,  hash)
                vRPclient.notify(source, {"Paid "..cfg.currency..tostring(price)})
            else 
                TriggerClientEvent("VRPGUNSHOPS:menu", source, false)
                vRPclient.notify(source, {"Insufficient funds"})
            end
        else
            vRPclient.notify(source, {"You do not have permission to buy guns"})
        end
    else 
        if vRP.tryPayment({userid, price}) then
            TriggerClientEvent("VRPGUNSHOPS:givewap", source,  hash)
            vRPclient.notify(source, {"Paid "..cfg.currency..tostring(price)})
        else 
            TriggerClientEvent("VRPGUNSHOPS:menu", source, false)
            vRPclient.notify(source, {"Insufficient funds"})
        end
    end
end)