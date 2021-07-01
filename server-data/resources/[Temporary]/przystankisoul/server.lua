ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('przystankisoul:pay')
AddEventHandler('przystankisoul:pay', function()
	local src = source
	local xPlayer  = ESX.GetPlayerFromId(src)

			xPlayer.removeMoney(math.random(650, 850))
end)