ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('trigger:ribanimation')
AddEventHandler('trigger:ribanimation', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('trigger:ribrepair', _source)
end)

