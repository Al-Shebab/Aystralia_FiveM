ESX = nil
isRoll = false
amount = 20000

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_tpnrp_luckywheel:getLucky')
AddEventHandler('esx_tpnrp_luckywheel:getLucky', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not isRoll then
        if xPlayer ~= nil then
            if xPlayer.getMoney() >= amount then
                xPlayer.removeMoney(amount)
                isRoll = true
                -- local _priceIndex = math.random(1, 20)
                local _randomPrice = math.random(1, 100)
                if _randomPrice == 1 then
                    -- Win car
                    local _subRan = math.random(1,1000)
                    if _subRan <= 1 then
                        _priceIndex = 19
                    else
                        _priceIndex = 3
                    end
                elseif _randomPrice > 1 and _randomPrice <= 6 then
                    -- Win skin AK Gold
                    _priceIndex = 12
                    local _subRan = math.random(1,20)
                    if _subRan <= 2 then
                        _priceIndex = 12
                    else
                        _priceIndex = 7
                    end
                elseif _randomPrice > 6 and _randomPrice <= 15 then
                    -- Black money
                    -- 4, 8, 11, 16
                    local _sRan = math.random(1, 4)
                    if _sRan == 1 then
                        _priceIndex = 4
                    elseif _sRan == 2 then
                        _priceIndex = 8
                    elseif _sRan == 3 then
                        _priceIndex = 11
                    else
                        _priceIndex = 16
                    end
                elseif _randomPrice > 15 and _randomPrice <= 25 then
                    -- Win 300,000$
                    -- _priceIndex = 5
                    local _subRan = math.random(1,20)
                    if _subRan <= 2 then
                        _priceIndex = 5
                    else
                        _priceIndex = 20
                    end
                elseif _randomPrice > 25 and _randomPrice <= 40 then
                    -- 1, 9, 13, 17
                    local _sRan = math.random(1, 4)
                    if _sRan == 1 then
                        _priceIndex = 1
                    elseif _sRan == 2 then
                        _priceIndex = 9
                    elseif _sRan == 3 then
                        _priceIndex = 13
                    else
                        _priceIndex = 17
                    end
                elseif _randomPrice > 40 and _randomPrice <= 60 then
                    local _itemList = {}
                    _itemList[1] = 2
                    _itemList[2] = 6
                    _itemList[3] = 10
                    _itemList[4] = 14
                    _itemList[5] = 18
                    _priceIndex = _itemList[math.random(1, 5)]
                elseif _randomPrice > 60 and _randomPrice <= 100 then
                    local _itemList = {}
                    _itemList[1] = 3
                    _itemList[2] = 7
                    _itemList[3] = 15
                    _itemList[4] = 20
                    _priceIndex = _itemList[math.random(1, 4)]
                end
                -- print("Price " .. _priceIndex)
                SetTimeout(12000, function()
                    isRoll = false
                    -- Give Price
                    if _priceIndex == 1 or _priceIndex == 9 or _priceIndex == 13 or _priceIndex == 17 then
                        -- print("win mu~ 1, giap 3")
                        xPlayer.addInventoryItem("armor2", 1)
                        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'You have won some dense armor'})  
                    elseif _priceIndex == 2 or _priceIndex == 6 or _priceIndex == 10 or _priceIndex == 14 or _priceIndex == 18 then
                        -- print("banh mi + nuoc")
                        xPlayer.addInventoryItem("coke", 10)
                        xPlayer.addInventoryItem("marijuana", 10)
                        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'You have won some coke & marijuana'}) 
                    elseif _priceIndex == 3 or _priceIndex == 7 or _priceIndex == 15 or _priceIndex == 20 then
                        -- print("Win money")
                        local _money = 0
                        if _priceIndex == 3 then
                            _money = 2000
                        elseif _priceIndex == 7 then
                            _money = 3000
                        elseif _priceIndex == 15 then
                            _money = 4000
                        elseif _priceIndex == 20 then
                            _money = 5000
                        end
                        xPlayer.addMoney(_money)
                        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'You have won $' .. ESX.Math.GroupDigits(_money) .. ''}) 
                    elseif _priceIndex == 4 or _priceIndex == 8 or _priceIndex == 11 or _priceIndex == 16 then
                        -- print("Black money x2")
                        local _blackMoney = 0
                        if _priceIndex == 4 then
                            _blackMoney = 1000
                        elseif _priceIndex == 8 then
                            _blackMoney = 1500
                        elseif _priceIndex == 11 then
                            _blackMoney = 2000
                        elseif _priceIndex == 16 then
                            _blackMoney = 2500
                        end
                        xPlayer.addAccountMoney("black_money", _blackMoney * 10)
                        -- xPlayer.addMoney(_blackMoney * 2)
                        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'You have won $' .. ESX.Math.GroupDigits(_blackMoney) .. ''}) 
                    elseif _priceIndex == 5 then
                        -- print("Win 300,000$")
                        xPlayer.addMoney(30000)
                        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'You have won $300,000!'}) 
                    elseif _priceIndex == 12 then

                        xPlayer.addInventoryItem("armor", 1)
                        xPlayer.addInventoryItem("energy", 1)
                        xPlayer.addInventoryItem("joint", 2)
                        xPlayer.addInventoryItem("turbo", 1)
                        xPlayer.addInventoryItem("clip", 1)
                        xPlayer.addInventoryItem("goldNecklace", 3)

                        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'You have won a bag full of prizes!'})

                    elseif _priceIndex == 19 then
                        -- print("Win car lp700r")
                        TriggerClientEvent("esx_tpnrp_luckywheel:winCar", _source)

                        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'You have won a brand new car'}) 
                    end
                    TriggerClientEvent("esx_tpnrp_luckywheel:rollFinished", -1)
                end)
                TriggerClientEvent("esx_tpnrp_luckywheel:doRoll", -1, _priceIndex)
            else
                TriggerClientEvent("esx_tpnrp_luckywheel:rollFinished", -1)    

                TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'You dont have enough cash to spin.'}) 
            end
        end
    end
end)
