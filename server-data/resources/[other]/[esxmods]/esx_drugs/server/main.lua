ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('weed:getSkins', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

RegisterServerEvent('weed:getJoint')
AddEventHandler('weed:getJoint', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('marijuana', 1)
	xPlayer.removeInventoryItem('rizla', 1)
	xPlayer.addInventoryItem('joint', 1)
end)

ESX.RegisterUsableItem('joint', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('joint', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))
end)