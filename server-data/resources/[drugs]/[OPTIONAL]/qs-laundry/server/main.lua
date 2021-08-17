ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("qs-laundry:checkItem", function(source, cb, itemname, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(itemname)["count"]
    if item >= count then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback("qs-laundry:checkItemAll", function(source, cb, itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local count = xPlayer.getInventoryItem(itemname).count
    if count > 0 then
        cb(count)
    else
        cb(false)
    end
end)

RegisterServerEvent("qs-laundry:removeItem")
AddEventHandler("qs-laundry:removeItem", function(itemname, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(itemname, count)
end)

RegisterServerEvent("qs-laundry:removeItemAll")
AddEventHandler("qs-laundry:removeItemAll", function(itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local count = xPlayer.getInventoryItem(itemname).count
    xPlayer.removeInventoryItem(itemname, count)
end)

RegisterServerEvent("qs-laundry:giveMoney")
AddEventHandler("qs-laundry:giveMoney", function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if Config.BlackMoney then
            xPlayer.addAccountMoney('black_money', count)
        else
            xPlayer.addMoney(count)
        end
    end
end)

RegisterServerEvent("qs-laundry:giveBlackMoney2")
AddEventHandler("qs-laundry:giveBlackMoney2", function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addAccountMoney('black_money', count)
    end
end)

RegisterServerEvent("qs-laundry:giveBlackMoney")
AddEventHandler("qs-laundry:giveBlackMoney", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local count = math.random(100, 200)
    if xPlayer then
        xPlayer.addAccountMoney('black_money', count)
    end
end)

RegisterServerEvent("qs-laundry:giveItem")
AddEventHandler("qs-laundry:giveItem", function(itemname, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem(itemname, count) then
        xPlayer.addInventoryItem(itemname, count)
    else
        xPlayer.showNotification("You are too heavy!")
    end
end)

ESX.RegisterServerCallback("qs-laundry:checkCanCarryItem", function(source, cb, itemname, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem(itemname, count) then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback("qs-laundry:checkBlackMoney", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local blackcount = xPlayer.getAccount('black_money').money
    if blackcount > 0 then
        cb(blackcount)
    else
        cb(false)
    end
end)

RegisterServerEvent("qs-laundry:removeBlackMoney")
AddEventHandler("qs-laundry:removeBlackMoney", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local count = xPlayer.getAccount('black_money').money
    if xPlayer then
        xPlayer.removeAccountMoney('black_money', count)
    end
end)

RegisterServerEvent("qs-laundry:addMoney")
AddEventHandler("qs-laundry:addMoney", function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addMoney(count)
    end
end)


ESX.RegisterServerCallback("qs-laundry:CheckPD", function(source, cb)
    local xPlayers = ESX.GetPlayers()
    local copcount = 0
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer then
            if xPlayer.job.name == "police" then
                copcount = copcount + 1
            end
        end
    end
    cb(copcount)
end)