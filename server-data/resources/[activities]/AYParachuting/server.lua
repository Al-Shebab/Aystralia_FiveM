ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('h4ci:giveparachute')
AddEventHandler('h4ci:giveparachute', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('GADGET_PARACHUTE') then
	else
    if xMoney >= price then

        xPlayer.removeMoney(1000)
        xPlayer.addWeapon('GADGET_PARACHUTE', 42)
    end
    end
end)
