ESX = nil
GiveDirty = true


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('Payout')
AddEventHandler('Payout', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer == xPlayer then
		xPlayer.addMoney(price)
	end
end)

RegisterServerEvent('RemoveOwnedVehicle')
AddEventHandler('RemoveOwnedVehicle',function(plate)
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	})
end)