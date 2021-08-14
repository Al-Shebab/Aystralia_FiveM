--[[ ============================================================ ]]--
--[[ |       FIVEM ESX DELIVERY PLUGIN REMAKE BY AKKARIIN       | ]]--
--[[ ============================================================ ]]--

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Register events

RegisterServerEvent('esx_deliveries:returnSafe:server')
RegisterServerEvent('esx_deliveries:finishDelivery:server')
RegisterServerEvent('esx_deliveries:removeSafeMoney:server')
RegisterServerEvent('esx_deliveries:getPlayerJob:server')

-- Return safe deposit event

AddEventHandler('esx_deliveries:returnSafe:server', function(deliveryType, safeReturn)
	local xPlayer = ESX.GetPlayerFromId(source)
	if safeReturn then
		local SafeMoney = 4000
		for k, v in pairs(Config.Safe) do
			if k == deliveryType then
				SafeMoney = v
				break
			end
		end
		xPlayer.addAccountMoney("bank", SafeMoney)
		--xPlayer.showNotification(Config.Locales["safe_deposit_returned"])
		TriggerClientEvent("esx:showAdvancedNotification", source, 'Delivery', 'Deposit', Config.Locales["safe_deposit_returned"], 'CHAR_MULTIPLAYER', 9)
	else
		--xPlayer.showNotification(Config.Locales["safe_deposit_withheld"])
		TriggerClientEvent("esx:showAdvancedNotification", source, 'Delivery', 'Deposit', Config.Locales["safe_deposit_withheld"], 'CHAR_MULTIPLAYER', 9)
	end
end)

-- Finish delivery mission event

AddEventHandler('esx_deliveries:finishDelivery:server', function(deliveryType)
    local xPlayer = ESX.GetPlayerFromId(source)
	local deliveryMoney = 800
	for k, v in pairs(Config.Rewards) do
		if k == deliveryType then
			deliveryMoney = v
			break
		end
	end
    xPlayer.addMoney(deliveryMoney)
	--xPlayer.showNotification(Config.Locales["delivery_point_reward"] .. tostring(deliveryMoney))

	TriggerClientEvent("esx:showAdvancedNotification", source, 'Delivery', 'Pay', Config.Locales["delivery_point_reward"] .. tostring(deliveryMoney), 'CHAR_MULTIPLAYER', 9)
end)

-- Remove safe deposit event (On start mission)

AddEventHandler('esx_deliveries:removeSafeMoney:server', function(deliveryType)
    local xPlayer = ESX.GetPlayerFromId(source)
	local SafeMoney = 4000
	for k, v in pairs(Config.Safe) do
		if k == deliveryType then
			SafeMoney = v
			break
		end
	end
	local PlayerMoney = xPlayer.getAccount('bank').money
	if PlayerMoney >= SafeMoney then
		xPlayer.removeAccountMoney("bank", SafeMoney)
		TriggerClientEvent("esx:showAdvancedNotification", source, 'Delivery', 'Deposit', Config.Locales["safe_deposit_received"], 'CHAR_MULTIPLAYER', 9)
		--xPlayer.showNotification(Config.Locales["safe_deposit_received"])
		TriggerClientEvent('esx_deliveries:startJob:client', source, deliveryType)
	else
		--xPlayer.showNotification(Config.Locales["not_enough_money"])
		TriggerClientEvent("esx:showAdvancedNotification", source, 'Delivery', 'Deposit', Config.Locales["not_enough_money"], 'CHAR_MULTIPLAYER', 9)
	end
end)

-- Get the player job name

AddEventHandler('esx_deliveries:getPlayerJob:server', function()
    local xPlayer = ESX.GetPlayerFromId(source)
	print("Player request job: " .. source .. ", " .. xPlayer.job.name)
	TriggerClientEvent('esx_deliveries:setPlayerJob:client', source, xPlayer.job.name)
end)
