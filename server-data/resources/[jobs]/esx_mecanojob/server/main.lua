ESX                = nil
PlayersHarvesting  = {}
PlayersHarvesting2 = {}
PlayersHarvesting3 = {}
PlayersCrafting    = {}
PlayersCrafting2   = {}
PlayersCrafting3   = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'mecano', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'mecano', _U('mechanic_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'mecano', 'Mecano', 'society_mecano', 'society_mecano', 'society_mecano', {type = 'public'})

ESX.RegisterUsableItem('blowpipe', function(source)

  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)

  TriggerClientEvent('esx_mecanojob:onHijack', _source)
    TriggerClientEvent('esx:showNotification', _source)

end)

ESX.RegisterUsableItem('fixkit', function(source)

  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)

  TriggerClientEvent('esx_mecanojob:onFixkit', _source)
    TriggerClientEvent('esx:showNotification', _source)

end)

ESX.RegisterUsableItem('carokit', function(source)

  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)

  TriggerClientEvent('esx_mecanojob:onCarokit', _source)
    TriggerClientEvent('esx:showNotification', _source)

end)

ESX.RegisterServerCallback('esx_mecanojob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)


RegisterServerEvent('esx_mecanojob:giveblowpipe')
AddEventHandler('esx_mecanojob:giveblowpipe', function()
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  xPlayer.addInventoryItem('blowpipe', 1)
end)

RegisterServerEvent('esx_mecanojob:givefixkit')
AddEventHandler('esx_mecanojob:givefixkit', function()
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('fixkit', 1)
end)

RegisterServerEvent('esx_mecanojob:givecarokit')
AddEventHandler('esx_mecanojob:givecarokit', function()
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('carokit', 1)
end)
