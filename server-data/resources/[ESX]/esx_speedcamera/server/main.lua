ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)
-- New

RegisterServerEvent('esx_speedcamera:PayBill200') -- 20kph
AddEventHandler('esx_speedcamera:PayBill200', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 200)
end)

RegisterServerEvent('esx_speedcamera:PayBill300') -- 30kph
AddEventHandler('esx_speedcamera:PayBill300', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 300)
end)

RegisterServerEvent('esx_speedcamera:PayBill500') -- 40kph
AddEventHandler('esx_speedcamera:PayBill500', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 500)
end)

RegisterServerEvent('esx_speedcamera:PayBill1000') -- 50kph
AddEventHandler('esx_speedcamera:PayBill1000', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 1000)
end)

RegisterServerEvent('esx_speedcamera:PayBill1500') -- 60kph
AddEventHandler('esx_speedcamera:PayBill1500', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 1500)
end)

RegisterServerEvent('esx_speedcamera:PayBill2000') -- 70kph
AddEventHandler('esx_speedcamera:PayBill2000', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 2000)
end)

RegisterServerEvent('esx_speedcamera:PayBill5000') -- 100kph
AddEventHandler('esx_speedcamera:PayBill5000', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 5000)
end)

RegisterServerEvent('esx_speedcamera:PayBill10000') -- 150kph
AddEventHandler('esx_speedcamera:PayBill10000', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 10000)
end)

RegisterServerEvent('esx_speedcamera:PayBill25000') -- 200kph
AddEventHandler('esx_speedcamera:PayBill25000', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 25000)
end)

RegisterServerEvent('esx_speedcamera:PayBill100000') -- 300kph
AddEventHandler('esx_speedcamera:PayBill100000', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 100000)
end)

RegisterServerEvent('esx_speedcamera:PayBill400000') -- 400kph
AddEventHandler('esx_speedcamera:PayBill400000', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeAccountMoney("bank", 400000)
end)

-- BILLS WITHOUT ESX_BILLING (END)

-- FLASHING EFFECT (START)
RegisterServerEvent('esx_speedcamera:openGUI')
AddEventHandler('esx_speedcamera:openGUI', function()
	TriggerClientEvent('esx_speedcamera:openGUI', source)
end)

RegisterServerEvent('esx_speedcamera:closeGUI')
AddEventHandler('esx_speedcamera:closeGUI', function()
	TriggerClientEvent('esx_speedcamera:closeGUI', source)
end)
-- FLASHING EFFECT (END)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end