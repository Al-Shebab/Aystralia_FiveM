ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----
ESX.RegisterUsableItem('handcuffs', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_handcuffs:cuffcheck', source)
end)

RegisterServerEvent('esx_handcuffs:cuffing')
AddEventHandler('esx_handcuffs:cuffing', function(source)
  TriggerClientEvent('esx_handcuffs:cuff', source)
end)

----

RegisterServerEvent('esx_handcuffs:unlocking')
AddEventHandler('esx_handcuffs:unlocking', function(source)
  TriggerClientEvent('esx_handcuffs:unlockingcuffs', source)
end)
---
