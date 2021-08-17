-- BELOVE IS YOUR SETTINGS, CHANGE THEM TO WHATEVER YOU'D LIKE & MORE SETTINGS WILL COME IN THE FUTURE! --
local useBilling = false -- OPTIONS: (true/false)
local useCameraSound = false -- OPTIONS: (true/false)
local useFlashingScreen = true -- OPTIONS: (true/false)
local useBlips = true -- OPTIONS: (true/false)
local alertPolice = true -- OPTIONS: (true/false)
local alertSpeed = 150 -- OPTIONS: (1-5000 KMH)

local defaultPrice60 = 100 -- THIS IS THE DEFAULT PRICE WITHOUT EXTRA COST FOR 60 ZONES
local defaultPrice80 = 300 -- THIS IS THE DEFAULT PRICE WITHOUT EXTRA COST FOR 80 ZONES
local defaultPrice120 = 500 -- THIS IS THE DEFAULT PRICE WITHOUT EXTRA COST FOR 120 ZONES

local extraZonePrice10 = 100 -- THIS IS THE EXTRA COST IF 10 KM/H ABOVE LIMIT (REQUIRES "useBilling" to be set to true)
local extraZonePrice20 = 500 -- THIS IS THE EXTRA COST IF 20 KM/H ABOVE LIMIT (REQUIRES "useBilling" to be set to true)
local extraZonePrice30 = 1000 -- THIS IS THE EXTRA COST IF 30 KM/H ABOVE LIMIT (REQUIRES "useBilling" to be set to true)
-- ABOVE IS YOUR SETTINGS, CHANGE THEM TO WHATEVER YOU'D LIKE & MORE SETTINGS WILL COME IN THE FUTURE!  --

ESX = nil
local hasBeenCaught = false
local finalBillingPrice = 0;

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

-- BLIP FOR SPEEDCAMERAS
local blips = {
	{title="Speedcamera [80 kph]", colour=1, id=744, x = 446.94,y = -517.51,z = 29.5},
	{title="Speedcamera [80 kph]", colour=1, id=744, x = 127.79,y = -983.37,z = 29.53},
	{title="Speedcamera [80 kph]", colour=1, id=744, x = 205.42,y = -1024.07,z = 29.53},
	{title="Speedcamera [80 kph]", colour=1, id=744, x = 265.17,y = -876.98,z = 29.53},
	{title="Speedcamera [80 kph]", colour=1, id=744, x = 191.39,y = -840.54,z = 30.92},
	{title="Speedcamera [110 kph]", colour=1, id=744, x = 1114.28,y = 407.45,z = 84.45},
	{title="Speedcamera [110 kph]", colour=1, id=744, x = 2255.16,y = 5911.59,z = 49.44},
	{title="Speedcamera [110 kph]", colour=1, id=744, x = -2570.80,y = 3348.04,z = 12.83},
	{title="Speedcamera [110 kph]", colour=1, id=744, x = -2604.98,y = 3001.32,z = 15.93},
}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
		if useBlips == true then
			info.blip = AddBlipForCoord(info.x, info.y, info.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		end
	end
end)

-- AREAS
local Speedcamera60Zone = {}

local Speedcamera80Zone = {
    {x = 446.94,y = -517.51,z = 29.5},
    {x = 127.79,y = -983.37,z = 29.53},
    {x = 205.42,y = -1024.07,z = 29.53},
    {x = 265.17,y = -876.98,z = 29.53},
    {x = 191.39,y = -840.54,z = 30.92}
}

local Speedcamera120Zone = {
    {x = 1114.28,y = 407.45,z = 84.45},
    {x = 2255.16,y = 5911.59,z = 49.44},
    {x = -2570.80,y = 3348.04,z = 12.83},
    {x = -2604.98,y = 3001.32,z = 15.93},
}

-- ZONES
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

		-- 60 zone
        for k in pairs(Speedcamera60Zone) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Speedcamera60Zone[k].x, Speedcamera60Zone[k].y, Speedcamera60Zone[k].z)

            if dist <= 20.0 then
				local playerPed = GetPlayerPed(-1)
				local playerCar = GetVehiclePedIsIn(playerPed, false)
				local veh = GetVehiclePedIsIn(playerPed)
				local SpeedKM = GetEntitySpeed(playerPed)*3.6
				local maxSpeed = 60.0 -- THIS IS THE MAX SPEED IN KM/H
				
				if SpeedKM > maxSpeed then
					if IsPedInAnyVehicle(playerPed, false) then
						if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then
							if hasBeenCaught == false then
								if GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "devcar" then -- BLACKLISTED VEHICLE
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE2" then -- BLACKLISTED VEHICLE
								-- VEHICLES ABOVE ARE BLACKLISTED
								else
									-- ALERT POLICE (START)
									if alertPolice == true then
										if SpeedKM > alertSpeed then
											local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
											TriggerServerEvent('esx_phone:send', 'police', ' Someone passed the speed camera, above ' .. alertSpeed.. ' KMH', true, {x =x, y =y, z =z})
										end
									end
									-- ALERT POLICE (END)								
								
									-- FLASHING EFFECT (START)
									if useFlashingScreen == true then
										TriggerServerEvent('esx_speedcamera:openGUI')
									end
									
									if useCameraSound == true then
										TriggerServerEvent("InteractSound_SV:PlayOnSource", "speedcamera", 0.5)
									end
									
									if useFlashingScreen == true then
										Citizen.Wait(200)
										TriggerServerEvent('esx_speedcamera:closeGUI')
									end
									-- FLASHING EFFECT (END)								
															
									if useFlashingScreen == true then
										if SpeedKM >= maxSpeed + 400 then
											TriggerServerEvent('esx_speedcamera:PayBill400000')
											ESX.ShowNotification("~r~You were caught speeding 400kph+ over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$400,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 300 then
											TriggerServerEvent('esx_speedcamera:PayBill100000')
											ESX.ShowNotification("~r~You were caught speeding 300kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$100,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 200 then
											TriggerServerEvent('esx_speedcamera:PayBill25000')
											ESX.ShowNotification("~r~You were caught speeding 200kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$25,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 150 then
											TriggerServerEvent('esx_speedcamera:PayBill10000')
											ESX.ShowNotification("~r~You were caught speeding 150kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$10,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 100 then
											TriggerServerEvent('esx_speedcamera:PayBill5000')
											ESX.ShowNotification("~r~You were caught speeding 100kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$5,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 70 then
											TriggerServerEvent('esx_speedcamera:PayBill2000')
											ESX.ShowNotification("~r~You were caught speeding 70kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$2,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 60 then
											TriggerServerEvent('esx_speedcamera:PayBill1500')
											ESX.ShowNotification("~r~You were caught speeding 60kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$1,500", true, true, 140)
										elseif SpeedKM >= maxSpeed + 50 then
											TriggerServerEvent('esx_speedcamera:PayBill1000')
											ESX.ShowNotification("~r~You were caught speeding 50kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$1,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 40 then
											TriggerServerEvent('esx_speedcamera:PayBill500')
											ESX.ShowNotification("~r~You were caught speeding 40kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$500", true, true, 140)
										elseif SpeedKM >= maxSpeed + 30 then
											TriggerServerEvent('esx_speedcamera:PayBill300')
											ESX.ShowNotification("~r~You were caught speeding 30kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$300", true, true, 140)
										elseif SpeedKM >= maxSpeed + 20 then
											TriggerServerEvent('esx_speedcamera:PayBill200')
											ESX.ShowNotification("~r~You were caught speeding 20kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$200", true, true, 140)
										elseif SpeedKM >= maxSpeed + 10 then
											ESX.ShowNotification("~r~You were caught speeding 10kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~g~Warning issued - 10kph", true, true, 140)
										else
											ESX.ShowNotification("~r~You were caught speeding under 10kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~g~Warning issued - under 10kph", true, true, 140)
										end
									end
										
									hasBeenCaught = true
									Citizen.Wait(5000) -- This is here to make sure the player won't get fined over and over again by the same camera!
								end
							end
						end
					end
					
					hasBeenCaught = false
				end
            end
        end
		
		-- 80 zone
		for k in pairs(Speedcamera80Zone) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Speedcamera80Zone[k].x, Speedcamera80Zone[k].y, Speedcamera80Zone[k].z)

            if dist <= 35.0 then
				local playerPed = GetPlayerPed(-1)
				local playerCar = GetVehiclePedIsIn(playerPed, false)
				local veh = GetVehiclePedIsIn(playerPed)
				local SpeedKM = GetEntitySpeed(playerPed)*3.6
				local maxSpeed = 80.0 -- THIS IS THE MAX SPEED IN KM/H
				
				if SpeedKM > maxSpeed then
					if IsPedInAnyVehicle(playerPed, false) then
						if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then					
							if hasBeenCaught == false then
								if GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "devcar" then -- BLACKLISTED VEHICLE
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE2" then -- BLACKLISTED VEHICLE
								-- VEHICLES ABOVE ARE BLACKLISTED
								else
									-- ALERT POLICE (START)
									if alertPolice == true then
										if SpeedKM > alertSpeed then
											local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
											TriggerServerEvent('esx_phone:send', 'police', ' Someone passed the speed camera, above ' .. alertSpeed.. ' KMH', true, {x =x, y =y, z =z})
										end
									end
									-- ALERT POLICE (END)								
								
									-- FLASHING EFFECT (START)
									if useFlashingScreen == true then
										TriggerServerEvent('esx_speedcamera:openGUI')
									end
									
									if useCameraSound == true then
										TriggerServerEvent("InteractSound_SV:PlayOnSource", "speedcamera", 0.5)
									end
									
									if useFlashingScreen == true then
										Citizen.Wait(200)
										TriggerServerEvent('esx_speedcamera:closeGUI')
									end
									-- FLASHING EFFECT (END)								
															
									if useFlashingScreen == true then
										if SpeedKM >= maxSpeed + 400 then
											TriggerServerEvent('esx_speedcamera:PayBill400000')
											ESX.ShowNotification("~r~You were caught speeding 400kph+ over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$400,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 300 then
											TriggerServerEvent('esx_speedcamera:PayBill100000')
											ESX.ShowNotification("~r~You were caught speeding 300kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$100,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 200 then
											TriggerServerEvent('esx_speedcamera:PayBill25000')
											ESX.ShowNotification("~r~You were caught speeding 200kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$25,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 150 then
											TriggerServerEvent('esx_speedcamera:PayBill10000')
											ESX.ShowNotification("~r~You were caught speeding 150kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$10,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 100 then
											TriggerServerEvent('esx_speedcamera:PayBill5000')
											ESX.ShowNotification("~r~You were caught speeding 100kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$5,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 70 then
											TriggerServerEvent('esx_speedcamera:PayBill2000')
											ESX.ShowNotification("~r~You were caught speeding 70kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$2,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 60 then
											TriggerServerEvent('esx_speedcamera:PayBill1500')
											ESX.ShowNotification("~r~You were caught speeding 60kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$1,500", true, true, 140)
										elseif SpeedKM >= maxSpeed + 50 then
											TriggerServerEvent('esx_speedcamera:PayBill1000')
											ESX.ShowNotification("~r~You were caught speeding 50kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$1,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 40 then
											TriggerServerEvent('esx_speedcamera:PayBill500')
											ESX.ShowNotification("~r~You were caught speeding 40kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$500", true, true, 140)
										elseif SpeedKM >= maxSpeed + 30 then
											TriggerServerEvent('esx_speedcamera:PayBill300')
											ESX.ShowNotification("~r~You were caught speeding 30kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$300", true, true, 140)
										elseif SpeedKM >= maxSpeed + 20 then
											TriggerServerEvent('esx_speedcamera:PayBill200')
											ESX.ShowNotification("~r~You were caught speeding 20kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$200", true, true, 140)
										elseif SpeedKM >= maxSpeed + 10 then
											ESX.ShowNotification("~r~You were caught speeding 10kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~g~Warning issued - 10kph", true, true, 140)
										else
											ESX.ShowNotification("~r~You were caught speeding under 10kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~g~Warning issued - under 10kph", true, true, 140)
										end
									end
										
										
									hasBeenCaught = true
									Citizen.Wait(1500) -- This is here to make sure the player won't get fined over and over again by the same camera!
								end
							end
						end
					end
					
					hasBeenCaught = false
				end
            end
        end
		
		-- 110 zone
		for k in pairs(Speedcamera120Zone) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Speedcamera120Zone[k].x, Speedcamera120Zone[k].y, Speedcamera120Zone[k].z)

            if dist <= 20.0 then
				local playerPed = GetPlayerPed(-1)
				local playerCar = GetVehiclePedIsIn(playerPed, false)
				local veh = GetVehiclePedIsIn(playerPed)
				local SpeedKM = GetEntitySpeed(playerPed)*3.6
				local maxSpeed = 110.0 -- THIS IS THE MAX SPEED IN KM/H
				
				if SpeedKM > maxSpeed then
					if IsPedInAnyVehicle(playerPed, false) then
						if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then 
							if hasBeenCaught == false then
								if GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "devcar" then -- BLACKLISTED VEHICLE
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE2" then -- BLACKLISTED VEHICLE
								-- VEHICLES ABOVE ARE BLACKLISTED
								else
									-- ALERT POLICE (START)
									if alertPolice == true then
										if SpeedKM > alertSpeed then
											local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
											TriggerServerEvent('esx_phone:send', 'police', ' Someone passed the speed camera, above ' .. alertSpeed.. ' KMH', true, {x =x, y =y, z =z})
										end
									end
									-- ALERT POLICE (END)
								
									-- FLASHING EFFECT (START)
									if useFlashingScreen == true then
										TriggerServerEvent('esx_speedcamera:openGUI')
									end
									
									if useCameraSound == true then
										TriggerServerEvent("InteractSound_SV:PlayOnSource", "speedcamera", 0.5)
									end
									
									if useFlashingScreen == true then
										Citizen.Wait(200)
										TriggerServerEvent('esx_speedcamera:closeGUI')
									end
									-- FLASHING EFFECT (END)
															
									if useFlashingScreen == true then
										if SpeedKM >= maxSpeed + 400 then
											TriggerServerEvent('esx_speedcamera:PayBill400000')
											ESX.ShowNotification("~r~You were caught speeding 400kph+ over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$400,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 300 then
											TriggerServerEvent('esx_speedcamera:PayBill100000')
											ESX.ShowNotification("~r~You were caught speeding 300kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$100,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 200 then
											TriggerServerEvent('esx_speedcamera:PayBill25000')
											ESX.ShowNotification("~r~You were caught speeding 200kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$25,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 150 then
											TriggerServerEvent('esx_speedcamera:PayBill10000')
											ESX.ShowNotification("~r~You were caught speeding 150kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$10,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 100 then
											TriggerServerEvent('esx_speedcamera:PayBill5000')
											ESX.ShowNotification("~r~You were caught speeding 100kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$5,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 70 then
											TriggerServerEvent('esx_speedcamera:PayBill2000')
											ESX.ShowNotification("~r~You were caught speeding 70kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$2,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 60 then
											TriggerServerEvent('esx_speedcamera:PayBill1500')
											ESX.ShowNotification("~r~You were caught speeding 60kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$1,500", true, true, 140)
										elseif SpeedKM >= maxSpeed + 50 then
											TriggerServerEvent('esx_speedcamera:PayBill1000')
											ESX.ShowNotification("~r~You were caught speeding 50kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$1,000", true, true, 140)
										elseif SpeedKM >= maxSpeed + 40 then
											TriggerServerEvent('esx_speedcamera:PayBill500')
											ESX.ShowNotification("~r~You were caught speeding 40kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$500", true, true, 140)
										elseif SpeedKM >= maxSpeed + 30 then
											TriggerServerEvent('esx_speedcamera:PayBill300')
											ESX.ShowNotification("~r~You were caught speeding 30kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$300", true, true, 140)
										elseif SpeedKM >= maxSpeed + 20 then
											TriggerServerEvent('esx_speedcamera:PayBill200')
											ESX.ShowNotification("~r~You were caught speeding 20kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~r~-$200", true, true, 140)
										elseif SpeedKM >= maxSpeed + 10 then
											ESX.ShowNotification("~r~You were caught speeding 10kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~g~Warning issued - 10kph", true, true, 140)
										else
											ESX.ShowNotification("~r~You were caught speeding under 10kph over the speed limit.", true, true, 140)
											Citizen.Wait(1000)
											ESX.ShowNotification("~g~Warning issued - under 10kph", true, true, 140)
										end
									end
										
									hasBeenCaught = true
									Citizen.Wait(2500) -- This is here to make sure the player won't get fined over and over again by the same camera!
								end
							end
						end
					end
					
					hasBeenCaught = false
				end
            end
        end
    end
end)

RegisterNetEvent('esx_speedcamera:openGUI')
AddEventHandler('esx_speedcamera:openGUI', function()
    SetNuiFocus(false,false)
    SendNUIMessage({type = 'openSpeedcamera'})
end)   

RegisterNetEvent('esx_speedcamera:closeGUI')
AddEventHandler('esx_speedcamera:closeGUI', function()
    SendNUIMessage({type = 'closeSpeedcamera'})
end)