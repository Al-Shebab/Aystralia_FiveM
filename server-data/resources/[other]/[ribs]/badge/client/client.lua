local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil

local open = false
local isDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('icemallow-badge:badgeanim')
AddEventHandler('icemallow-badge:badgeanim', function(prop_name)

	prop_name = prop_name or 'prop_fib_badge'
	Citizen.CreateThread(function()
		local playerPed = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(playerPed))
		local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
		local boneIndex = GetPedBoneIndex(playerPed, 28422)
			
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.09, 0.018, -0.04, 100.0, -0.2, 90.0, true, true, false, true, 1, true)
			ESX.Streaming.RequestAnimDict('paper_1_rcm_alt1-9', function()
			TaskPlayAnim(playerPed, 'paper_1_rcm_alt1-9', 'player_one_dual-9', 8.0, -8, 4.0, 49, 0, 0, 0, 0)
			Citizen.Wait(7000)
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsControlJustPressed(0, 178) and not isDead then
			
			ESX.TriggerServerCallback('badge:getAmount', function(quantity)
				if quantity > 0 then
					TriggerServerEvent('trigger:animation')	
				else
					ESX.ShowNotification("~r~You have no badge")
				end
			end, 'lspd_badge')
		end
	end
end)