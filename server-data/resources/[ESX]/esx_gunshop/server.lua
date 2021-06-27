ESX             = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("gunshop:buyweapon")
AddEventHandler('gunshop:buyweapon', function(price, hash)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getMoney() >= price then
        TriggerClientEvent("gunshop:giveweapon", source,  hash)
        TriggerClientEvent('esx:showNotification', _source, 'Paid '..cfg.currency..tostring(price))
    elseif xPlayer.getBank() >= price then
        TriggerClientEvent("gunshop:giveweapon", source,  hash)
        TriggerClientEvent('esx:showNotification', _source, 'Paid '..cfg.currency..tostring(price))
    else
        TriggerClientEvent("gunshop:menu", source, false)
        TriggerClientEvent('esx:showNotification', _source, 'You have not enought money!')
    end
end)