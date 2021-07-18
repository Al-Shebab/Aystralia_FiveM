local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

local firstSpawn, PlayerLoaded = true, false

local display = false
ESX = nil

AddEventHandler("onClientMapStart", function()
	exports.spawnmanager:spawnPlayer()
	Citizen.Wait(5000)
	exports.spawnmanager:setAutoSpawn(false)
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
	TriggerEvent('esx:onPlayerSpawn')
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("onDuty", function(data)
    SetDisplay(false)
    TriggerServerEvent("duty:on")
end)

RegisterNUICallback("offDuty", function(data)
    SetDisplay(false)
    TriggerServerEvent("duty:off")
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({type = "ui",status = bool,})
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) 
        DisableControlAction(0, 2, display) 
        DisableControlAction(0, 142, display) 
        DisableControlAction(0, 18, display) 
        DisableControlAction(0, 322, display) 
        DisableControlAction(0, 106, display) 
    end
end)

-- Zeichne Marker
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.Job or ESX.PlayerData.job and ESX.PlayerData.job.name == Config.JobOffDuty then
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.PoliceX, Config.PoliceY, Config.PoliceZ, true) < 2 then
                if IsControlJustReleased(1, 51) then
                    SetDisplay(not display)
                end
            end
        end
    end
end)

-- NPC's
local coordinate = {
    { Config.PoliceX, Config.PoliceY, Config.PoliceZ, nil, Config.PoliceH, nil, Config.NPCHash}
}

Citizen.CreateThread(function()
    for _,v in pairs(coordinate) do
        RequestModel(v[7])
        while not HasModelLoaded(v[7]) do
            Wait(1)
        end
        ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
        SetEntityHeading(ped, v[5])
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end
end)