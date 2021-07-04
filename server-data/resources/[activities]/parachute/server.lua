ESX = nil

RegisterServerEvent('vb-banking:server:balance')
AddEventHandler('vb-banking:server:balance', function(inMenu)
	local _src = source
	local _char = ESX.GetPlayerFromId(_src)
	local balance = _char.getAccount('bank').money
	TriggerClientEvent('vb-banking:client:refreshbalance', _src, balance)
end)

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

        xPlayer.removeMoney(price)
        xPlayer.addWeapon('GADGET_PARACHUTE', 42)
    end
    end
end)
