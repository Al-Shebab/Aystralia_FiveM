ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




ESX.RegisterUsableItem('lspd_badge', function(source)
	local _source = source
	local identifier = ESX.GetPlayerFromId(_source).identifier
	local xPlayer = ESX.GetPlayerFromId(source)
	

	TriggerClientEvent('icemallow-badge:badgeanim', _source)	
end)

RegisterServerEvent('trigger:animation')
AddEventHandler('trigger:animation', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('icemallow-badge:badgeanim', _source)
end)

ESX.RegisterServerCallback('badge:getAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)