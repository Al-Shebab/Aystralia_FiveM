ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('lom', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local lom = xPlayer.getInventoryItem('lom')

    xPlayer.removeInventoryItem('lom', 1)
    TriggerClientEvent('esx_borrmaskin:startlom', source)
end)
