ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
	end
end)


local used = false
local cutting = false
local packaged = false
local washing = false
local blackcount = 0


Citizen.CreateThread(function()
    while true do
        local sleep = 1500
        local playerPed = PlayerPedId()
        local playerCoord = GetEntityCoords(playerPed)
        local dst = #(playerCoord - Config.Laundry.entry.coord)
        if dst < 20 and not used then
            sleep = 1
            if dst < 3 then
                DrawText3D(Config.Laundry.entry.coord.x, Config.Laundry.entry.coord.y, Config.Laundry.entry.coord.z + 0.20, Config.Laundry.entry.text)
                if IsControlJustPressed(0, 38) and not used then
                    used = true
                    teleport(Config.Laundry.entry.intcoord, Config.Laundry.entry.intheading)
                    used = false
                end
            end
        end
            local dst2 = #(playerCoord - Config.Laundry.exit.intcoord)
            if dst2 < 5 then
                sleep = 1
                if dst2 < 2 then
                    DrawText3D(Config.Laundry.exit.intcoord.x, Config.Laundry.exit.intcoord.y, Config.Laundry.exit.intcoord.z + 0.20, Config.Laundry.exit.text)
                    if IsControlJustPressed(0, 38) then
                        used = true
                        teleport(Config.Laundry.exit.coord, Config.Laundry.exit.heading)
                        used = false
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)


Citizen.CreateThread(function()
    while true do
        local sleep = 1500
        local playerPed = PlayerPedId()
        local playerCoord = GetEntityCoords(playerPed)
            local dst = #(playerCoord - Config.Laundry.cuttingZone.coords)
            if dst < 5 then
                sleep = 1
                if dst < 1.5 and not cutting then
                    DrawText3D(Config.Laundry.cuttingZone.coords.x, Config.Laundry.cuttingZone.coords.y, Config.Laundry.cuttingZone.coords.z + 0.20, Config.Laundry.cuttingZone.text)
                    if IsControlJustPressed(0, 38) and not cutting then
                        cutting = true
                        TriggerEvent("qs-laundry:cuttingMoney", Config.Laundry.cuttingZone.coords, Config.Laundry.cuttingZone.heading)
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent("qs-laundry:cuttingMoney")
AddEventHandler("qs-laundry:cuttingMoney", function(coord, heading)
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@cfm@cfm_cut_sheets@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
    RequestModel("bkr_prop_fakeid_papercutter")
    RequestModel("bkr_prop_cutter_moneypage")
    RequestModel("bkr_prop_fakeid_table")
    RequestModel("bkr_prop_cutter_moneystack_01a")
    RequestModel("bkr_prop_cutter_moneystrip")
    RequestModel("bkr_prop_cutter_singlestack_01a")
    while not HasModelLoaded("bkr_prop_fakeid_papercutter") and not HasModelLoaded("bkr_prop_cutter_moneypage") and not HasModelLoaded("bkr_prop_fakeid_table") and not HasModelLoaded("bkr_prop_cutter_moneystack_01a") and not HasModelLoaded("bkr_prop_cutter_moneystrip") and not HasModelLoaded("bkr_prop_cutter_singlestack_01a") do Citizen.Wait(10) end
    SetEntityHeading(playerPed, heading)
    Citizen.Wait(10)
    local cutter = CreateObject(GetHashKey("bkr_prop_fakeid_papercutter"), coord.x, coord.y, coord.z, true, false, false)
    local page = CreateObject(GetHashKey("bkr_prop_cutter_moneypage"), coord.x, coord.y, coord.z, true, false, false)
    local page2 = CreateObject(GetHashKey("bkr_prop_cutter_moneypage"), coord.x, coord.y, coord.z, true, false, false)
    local page3 = CreateObject(GetHashKey("bkr_prop_cutter_moneypage"), coord.x, coord.y, coord.z, true, false, false)
    local table = CreateObject(GetHashKey("bkr_prop_fakeid_table"), coord.x, coord.y, coord.z, true, false, false)
    local strip = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local strip2 = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local strip3 = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local strip4 = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local strip5 = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local singlestack = CreateObject(GetHashKey("bkr_prop_cutter_singlestack_01a"), coord.x, coord.y, coord.z, true, false, false)
    local stack = CreateObject(GetHashKey("bkr_prop_cutter_moneystack_01a"), coord.x, coord.y, coord.z, true, false, false)
    local cutScene = NetworkCreateSynchronisedScene(coord.x-2.12, coord.y-0.60, coord.z-0.59, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local cutScene2 = NetworkCreateSynchronisedScene(coord.x-2.12, coord.y-0.60, coord.z-0.59, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local cutScene3 = NetworkCreateSynchronisedScene(coord.x-2.12, coord.y-0.60, coord.z-0.59, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local cutScene4 = NetworkCreateSynchronisedScene(coord.x-2.12, coord.y-0.60, coord.z-0.59, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(playerPed, cutScene, animDict, "extended_load_tune_cut_billcutter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(cutter, cutScene, animDict, "extended_load_tune_cut_papercutter", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(page, cutScene, animDict, "extended_load_tune_cut_singlemoneypage", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(page2, cutScene, animDict, "extended_load_tune_cut_singlemoneypage^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(page3, cutScene2, animDict, "extended_load_tune_cut_singlemoneypage^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(table, cutScene2, animDict, "extended_load_tune_cut_table", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(stack, cutScene2, animDict, "extended_load_tune_cut_moneystack", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip, cutScene3, animDict, "extended_load_tune_cut_singlemoneystrip", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip2, cutScene3, animDict, "extended_load_tune_cut_singlemoneystrip^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip3, cutScene3, animDict, "extended_load_tune_cut_singlemoneystrip^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip4, cutScene4, animDict, "extended_load_tune_cut_singlemoneystrip^3", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip5, cutScene4, animDict, "extended_load_tune_cut_singlemoneystrip^4", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(singlestack, cutScene4, animDict, "extended_load_tune_cut_singlestack", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(cutScene)
    NetworkStartSynchronisedScene(cutScene2)
    NetworkStartSynchronisedScene(cutScene3)
    NetworkStartSynchronisedScene(cutScene4)
    Citizen.Wait(32000)
    NetworkStopSynchronisedScene(cutScene)
    NetworkStopSynchronisedScene(cutScene2)
    NetworkStopSynchronisedScene(cutScene3)
    NetworkStopSynchronisedScene(cutScene4)
    DeleteEntity(cutter)
    DeleteEntity(page)
    DeleteEntity(page2)
    DeleteEntity(page3)
    DeleteEntity(table)
    DeleteEntity(stack)
    DeleteEntity(strip)
    DeleteEntity(strip2)
    DeleteEntity(strip3)
    DeleteEntity(strip4)
    DeleteEntity(strip5)
    DeleteEntity(singlestack)
    TriggerServerEvent("qs-laundry:giveItem", "sorted_money", math.random(Config.Laundry.cuttingZone.countmin, Config.Laundry.cuttingZone.countmax))
    cutting = false
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1500
        local playerPed = PlayerPedId()
        local playerCoord = GetEntityCoords(playerPed)
        local dst = #(playerCoord - Config.Laundry.packageZone.coord)
        if dst < 5 and not packaged then
            sleep = 1
            if dst < 2 then
                DrawText3D(Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z - 0.20, Config.Laundry.packageZone.text)
                if IsControlJustPressed(0, 38) then
                    ESX.TriggerServerCallback("qs-laundry:checkItemAll", function(output)
                        if output then
                            packaged = true
                            blackcount = output
                            TriggerServerEvent("qs-laundry:removeItemAll", 'sorted_money')
                            TriggerEvent("qs-laundry:packageMoney")
                        else
                            ESX.ShowNotification("You have no money ordered")
                        end
                    end, 'sorted_money')
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

local Items = {
    'bkr_prop_coke_tin_01',
    'bkr_prop_tin_cash_01a',
    'bkr_prop_money_unsorted_01',
    'bkr_prop_money_wrapped_01',
    'bkr_prop_money_counter',
}

RegisterNetEvent("qs-laundry:packageMoney")
AddEventHandler("qs-laundry:packageMoney", function()
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@cfm@cfm_counting_notes@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
    RequestModel("bkr_prop_coke_tin_01")
    RequestModel("bkr_prop_tin_cash_01a")
    RequestModel("bkr_prop_money_unsorted_01")
    RequestModel("bkr_prop_money_wrapped_01")
    RequestModel("bkr_prop_money_counter")
    while not HasModelLoaded("bkr_prop_coke_tin_01") and not HasModelLoaded("bkr_prop_tin_cash_01a") and not HasModelLoaded("bkr_prop_money_unsorted_01") and not HasModelLoaded("bkr_prop_money_wrapped_01") and not HasModelLoaded("bkr_prop_money_counter") do Citizen.Wait(50) end
    SetEntityHeading(playerPed, Config.Laundry.packageZone.heading)
    Citizen.Wait(10)
    RequestModel("bkr_prop_money_counter")
    RequestModel("bkr_prop_moneypack_03a")
    while not HasModelLoaded("bkr_prop_money_counter") and not HasModelLoaded("bkr_prop_moneypack_03a") do Citizen.Wait(10) end
    local counter = CreateObject(GetHashKey("bkr_prop_money_counter"), 1120.15, -3198.40, -40.58, false, false)
    local bag = CreateObject(GetHashKey("bkr_prop_moneypack_03a"), 1119.96, -3198.93, -40.58, false, false)
    local bag2 = CreateObject(GetHashKey("bkr_prop_moneypack_03a"), 1119.96, -3198.93, -40.42, false, false)
    SetEntityRotation(counter, 0.0, 0.0, 180.0)
    SetEntityRotation(bag, 0.0, 0.0, 90.0)
    SetEntityRotation(bag2, 0.0, 0.0, 90.0)
    local packScene = NetworkCreateSynchronisedScene(Config.Laundry.packageZone.coord.x+0.27, Config.Laundry.packageZone.coord.y-0.8, Config.Laundry.packageZone.coord.z-1.05, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene2 = NetworkCreateSynchronisedScene(Config.Laundry.packageZone.coord.x+0.27, Config.Laundry.packageZone.coord.y-0.8, Config.Laundry.packageZone.coord.z-1.05, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local tin = CreateObject(GetHashKey("bkr_prop_coke_tin_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local cash = CreateObject(GetHashKey("bkr_prop_tin_cash_01a"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local unsorted = CreateObject(GetHashKey("bkr_prop_money_unsorted_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local unsorted2 = CreateObject(GetHashKey("bkr_prop_money_unsorted_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local wrapped = CreateObject(GetHashKey("bkr_prop_money_wrapped_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local wrapped2 = CreateObject(GetHashKey("bkr_prop_money_wrapped_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    NetworkAddPedToSynchronisedScene(playerPed, packScene, animDict, "note_counting_v2_counter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(tin, packScene, animDict, "note_counting_v2_binmoney", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(cash, packScene, animDict, "note_counting_v2_moneybin", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(unsorted, packScene, animDict, "note_counting_v2_moneyunsorted", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(unsorted2, packScene2, animDict, "note_counting_v2_moneyunsorted^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(wrapped, packScene2, animDict, "note_counting_v2_moneywrap", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(wrapped2, packScene2, animDict, "note_counting_v2_moneywrap^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(packScene)
    NetworkStartSynchronisedScene(packScene2)
    Citizen.Wait(18000)
    SetEntityCoords(playerPed, 1119.4, -3197.68, -41.70)
    NetworkStopSynchronisedScene(packScene)
    NetworkStopSynchronisedScene(packScene2)
    DeleteEntity(counter)
    DeleteEntity(bag)
    DeleteEntity(bag2)
    DeleteEntity(tin)
    DeleteEntity(cash)
    DeleteEntity(unsorted)
    DeleteEntity(unsorted2)
    DeleteEntity(wrapped)
    DeleteEntity(wrapped2)
    TriggerServerEvent("qs-laundry:giveBlackMoney2", blackcount)
    blackcount = 0
    packaged = false
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1500
        local playerPed = PlayerPedId()
        local playerCoord = GetEntityCoords(playerPed)
        local dst = #(playerCoord - Config.Laundry.washingZone.coord)
        if dst < 5 and not washing then
            sleep = 1
            if dst < 2 then
                DrawText3D(Config.Laundry.washingZone.coord.x, Config.Laundry.washingZone.coord.y, Config.Laundry.washingZone.coord.z + 0.20, Config.Laundry.washingZone.text)
                if IsControlJustPressed(0, 38) then
                    ESX.TriggerServerCallback("qs-laundry:checkBlackMoney", function(output)
                        if output then
                            washing = true
                            washcount = output
                            TriggerServerEvent("qs-laundry:removeBlackMoney")
                            TriggerEvent("qs-laundry:washMoney", Config.Laundry.washingZone.coord, Config.Laundry.washingZone.heading)
                        else
                            ESX.ShowNotification("You don't have black money")
                        end
                    end)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)


RegisterNetEvent("qs-laundry:washMoney")
AddEventHandler("qs-laundry:washMoney", function(coord, heading)
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@cfm@cfm_drying_notes@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
    RequestModel("bkr_prop_money_pokerbucket")
    RequestModel("bkr_prop_money_unsorted_01")
    while not HasModelLoaded("bkr_prop_money_pokerbucket") and not HasModelLoaded("bkr_prop_money_unsorted_01") do Citizen.Wait(10) end
    SetEntityHeading(playerPed, heading)
    Citizen.Wait(10)
    local bucket = CreateObject(GetHashKey("bkr_prop_money_pokerbucket"), coord.x, coord.y, coord.z, true, false, false)
    local money = CreateObject(GetHashKey("bkr_prop_money_unsorted_01"), coord.x, coord.y, coord.z, true, false, false)
    local money2 = CreateObject(GetHashKey("bkr_prop_money_unsorted_01"), coord.x, coord.y, coord.z, true, false, false)
    local washScene = NetworkCreateSynchronisedScene(coord.x, coord.y, coord.z, 0.0, 0.0, 85.0, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(playerPed, washScene, animDict, "loading_v3_worker", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bucket, washScene, animDict, "loading_v3_bucket", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(money, washScene, animDict, "loading_v3_money01", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(money2, washScene, animDict, "loading_v3_money01^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(washScene)
    Citizen.Wait(32000)
    NetworkStopSynchronisedScene(washScene)
    DeleteEntity(bucket)
    DeleteEntity(money)
    DeleteEntity(money2)
    TriggerServerEvent("qs-laundry:addMoney", washcount/2)
    washcount = 0
    washing = false
end)


function teleport(coord, heading)
	DoScreenFadeOut(500)
	Citizen.Wait(2000)
	SetEntityCoords(PlayerPedId(), coord.x, coord.y, coord.z-1.0)
	SetEntityHeading(PlayerPedId(), heading)
	DoScreenFadeIn(500)
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(true)
  AddTextComponentString(text)
  SetDrawOrigin(x,y,z, 0)
  DrawText(0.0, 0.0)
  local factor = (string.len(text)) / 370
  DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 55)
  ClearDrawOrigin()
end