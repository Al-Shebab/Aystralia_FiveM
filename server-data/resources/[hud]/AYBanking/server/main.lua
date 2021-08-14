ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('AYBanking:server:GetPlayerName', function(source, cb)
	local _char = ESX.GetPlayerFromId(source)
	local _charname = _char.getName()
	cb(_charname)
end)

RegisterServerEvent('AYBanking:server:depositvb')
AddEventHandler('AYBanking:server:depositvb', function(amount, inMenu)
	local _src = source
	local _char = ESX.GetPlayerFromId(_src)
	amount = tonumber(amount)
	Citizen.Wait(50)
	if amount == nil or amount <= 0 or amount > _char.getMoney() then
		_char.showNotification("You do not have $"..amount)
	else
		_char.removeMoney(amount)
		_char.addAccountMoney('bank', tonumber(amount))
		_char.showNotification("You've deposited $"..amount)
	end
end)

RegisterServerEvent('AYBanking:server:withdrawvb')
AddEventHandler('AYBanking:server:withdrawvb', function(amount, inMenu)
	local _src = source
	local _char = ESX.GetPlayerFromId(_src)
	local _base = 0
	amount = tonumber(amount)
	_base = _char.getAccount('bank').money
	Citizen.Wait(100)
	if amount == nil or amount <= 0 or amount > _base then
		_char.showNotification("You do not have $"..amount)
	else
		_char.removeAccountMoney('bank', amount)
		_char.addMoney(amount)
		_char.showNotification("You've withdrawn $"..amount)
	end
end)

RegisterServerEvent('AYBanking:server:balance')
AddEventHandler('AYBanking:server:balance', function(inMenu)
	local _src = source
	local _char = ESX.GetPlayerFromId(_src)
	local balance = _char.getAccount('bank').money
	TriggerClientEvent('AYBanking:client:refreshbalance', _src, balance)
end)

RegisterServerEvent('AYBanking:server:transfervb')
AddEventHandler('AYBanking:server:transfervb', function(to, amountt, inMenu)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(tonumber(to))
	local balance = 0
	if zPlayer ~= nil then
		balance = xPlayer.getAccount('bank').money
		if tonumber(_source) == tonumber(to) then
			TriggerClientEvent('chatMessage', _source, "You can't transfer money to yourself")	
		else
			if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
				TriggerClientEvent('chatMessage', _source, "You don't have enough money in your bank account.")
			else
				xPlayer.removeAccountMoney('bank', tonumber(amountt))
				zPlayer.addAccountMoney('bank', tonumber(amountt))
				zPlayer.showNotification("You've received a bank transfer of $"..amountt.." from the ID: ".._source)
				xPlayer.showNotification("You've sent a bank transfer of $"..amountt.." to the ID: "..to)
			end
		end
	else
		TriggerClientEvent('chatMessage', _source, "That Wallet ID is not valid or doesn't exist")
	end
end)