ESX = nil

if Config.UseESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)
		if xPlayer.getAccount("money").money >= amount then
			xPlayer.removeAccountMoney("money", amount)
		elseif xPlayer.getAccount("bank").money >= amount then
			xPlayer.removeAccountMoney("bank", amount)
		elseif xPlayer.getAccount("money").money < amount then
			xPlayer.showNotification("Poor fuck lol")
		end
	end)
end
