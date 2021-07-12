ESX =							 nil
local v1 = vector4(446.78, -965.41, 30.34, 360)
local v2 = vector4(-968.97, -2607.88, 14.0, 360)
local v3 = vector4(687.52, 239.89, 93.6, 360)
local v4 = vector4(1989.81, 3055.3, 47.22, 360)
local v5 = vector4(-217.71, 6175.97, 31.21, 360)
local v6 = vector4(1663.46, 4818.73, 41.98, 360)
local ped = GetPlayerPed(-1)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
		while GetDistanceBetweenCoords(446.78, -965.41, 27.8, GetEntityCoords(LocalPed())) < 12 do
			Citizen.Wait(1)
		end
		while GetDistanceBetweenCoords(-968.97, -2607.88, 13.98, GetEntityCoords(LocalPed())) < 12 do
			Citizen.Wait(1)
		end
		while GetDistanceBetweenCoords(687.52, 3055.3, 93.6, GetEntityCoords(LocalPed())) < 12 do
			Citizen.Wait(1)
		end
		while GetDistanceBetweenCoords(1989.81, 3055.3, 47.22, GetEntityCoords(LocalPed())) < 12 do
			Citizen.Wait(1)
		end
		while GetDistanceBetweenCoords(-217.71, 6175.97, 31.21, GetEntityCoords(LocalPed())) < 12 do
			Citizen.Wait(1)
		end
		while GetDistanceBetweenCoords(1663.46, 4818.73, 41.98, GetEntityCoords(LocalPed())) < 12 do
			Citizen.Wait(1)
		end
end)

Citizen.CreateThread(function()
	
	for i=1, #Config.Map, 1 do
		
		local blip = AddBlipForCoord(Config.Map[i].x, Config.Map[i].y, Config.Map[i].z)
		SetBlipSprite (blip, Config.Map[i].id)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, Config.Map[i].color)
		SetBlipScale (blip, Config.Map[i].scale)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Map[i].name)
		EndTextCommandSetBlipName(blip)
		
	end

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

			DrawMarker(25, 446.78, -965.41, 27.8, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.0001, 255, 255, 102, 165, 0, 0, 0,0) -- #1
			DrawMarker(25, -968.97, -2607.88, 12.98, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.0001, 255, 255, 102, 165, 0, 0, 0,0) -- #2
			DrawMarker(25, 687.52, 239.89, 92.6, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.0001, 255, 255, 102, 165, 0, 0, 0,0) -- #3
			DrawMarker(25, 1989.81, 3055.3, 46.22, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.0001, 255, 255, 102, 165, 0, 0, 0,0) -- #4
			DrawMarker(25, -217.71, 6175.97, 30.21, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.0001, 255, 255, 102, 165, 0, 0, 0,0) -- #5
			DrawMarker(25, 1663.46, 4818.73, 40.98, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.0001, 255, 255, 102, 165, 0, 0, 0,0) -- #6

			
			if GetDistanceBetweenCoords(446.78, -965.41, 30.34, GetEntityCoords(LocalPed())) < 0.8 or GetDistanceBetweenCoords(-968.97, -2607.88, 13.98, GetEntityCoords(LocalPed())) < 0.8 or GetDistanceBetweenCoords(687.52, 239.89, 93.6, GetEntityCoords(LocalPed())) < 0.8 or GetDistanceBetweenCoords(1989.81, 3055.3, 47.22, GetEntityCoords(LocalPed())) < 0.8 or GetDistanceBetweenCoords(-217.71, 6175.97, 31.21, GetEntityCoords(LocalPed())) < 0.8 or GetDistanceBetweenCoords(1663.46, 4818.73, 41.98, GetEntityCoords(LocalPed())) < 0.8 then
				SetTextComponentFormat('STRING');
				AddTextComponentString("Press ~INPUT_CONTEXT~ to go on a bus trip");
				DisplayHelpTextFromStringLabel(0, 0, 1, -1);
				if IsControlJustReleased(0, 38) then
							Wait(100)
							OpenMenu()
						end
				elseif not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'przystanek_menu') then
						
						if GetDistanceBetweenCoords(446.78, -965.41, 27.8, GetEntityCoords(LocalPed())) < 12 then
						end
						if GetDistanceBetweenCoords(-968.97, -2607.88, 13.98, GetEntityCoords(LocalPed())) < 12 then
						end
						if GetDistanceBetweenCoords(687.52, 3055.3, 93.6, GetEntityCoords(LocalPed())) < 12 then
						end
						if GetDistanceBetweenCoords(1989.81, 3055.3, 47.22, GetEntityCoords(LocalPed())) < 12 then
						end
						if GetDistanceBetweenCoords(-217.71, 6175.97, 31.21, GetEntityCoords(LocalPed())) < 12 then
						end
						if GetDistanceBetweenCoords(1663.46, 4818.73, 41.98, GetEntityCoords(LocalPed())) < 12 then
						end

				end
			end
		end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if IsControlJustReleased(0, 202) and ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'przystanek_menu') then
				FreezeEntityPosition(ped, false)
				ESX.UI.Menu.CloseAll()
			end
	end
end)

RegisterNetEvent('nr1')
AddEventHandler('nr1',function() 
	FreezeEntityPosition(ped, false)
	ClearPedTasks(ped)
	SetNewWaypoint(446.78, -965.41)
	ESX.ShowNotification("Relax and enjoy your journey!")
	ESX.UI.Menu.CloseAll()
	Citizen.Wait(7500)
	DoScreenFadeOut(100)
	Citizen.Wait(5000)
	TeleportPrzystanek()
	DoScreenFadeIn(100)
	ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('nr2')
AddEventHandler('nr2',function() 
	FreezeEntityPosition(ped, false)
	ClearPedTasks(ped)
	SetNewWaypoint(-968.97, -2607.88)
	ESX.ShowNotification("Relax and enjoy your journey!")
	ESX.UI.Menu.CloseAll()
	Citizen.Wait(7500)
	DoScreenFadeOut(100)
	Citizen.Wait(7500)
	TeleportPrzystanek()
	DoScreenFadeIn(100)
	ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('nr3')
AddEventHandler('nr3',function() 
	FreezeEntityPosition(ped, false)
	ClearPedTasks(ped)
	SetNewWaypoint(687.52, 239.89)
	ESX.ShowNotification("Relax and enjoy your journey!")
	ESX.UI.Menu.CloseAll()
	Citizen.Wait(7500)
	DoScreenFadeOut(100)
	Citizen.Wait(7500)
	TeleportPrzystanek()
	DoScreenFadeIn(100)
	ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('nr4')
AddEventHandler('nr4',function() 
	FreezeEntityPosition(ped, false)
	ClearPedTasks(ped)
	SetNewWaypoint(-217.71, 6175.97)
	ESX.ShowNotification("Relax and enjoy your journey!")
	ESX.UI.Menu.CloseAll()
	Citizen.Wait(7500)
	DoScreenFadeOut(100)
	Citizen.Wait(13000)
	TeleportPrzystanek()
	DoScreenFadeIn(100)
	ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('nr5')
AddEventHandler('nr5',function() 
	FreezeEntityPosition(ped, false)
	ClearPedTasks(ped)
	SetNewWaypoint(1989.81, 3055.3)
	ESX.ShowNotification("Relax and enjoy your journey!")
	ESX.UI.Menu.CloseAll()
	Citizen.Wait(7500)
	DoScreenFadeOut(100)
	Citizen.Wait(9000)
	TeleportPrzystanek()
	DoScreenFadeIn(100)
	ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('nr6')
AddEventHandler('nr6',function() 
	FreezeEntityPosition(ped, false)
	ClearPedTasks(ped)
	SetNewWaypoint(1663.46, 4818.73)
	ESX.ShowNotification("Relax and enjoy your journey!")
	ESX.UI.Menu.CloseAll()
	Citizen.Wait(7500)
	DoScreenFadeOut(100)
	Citizen.Wait(11000)
	TeleportPrzystanek()
	DoScreenFadeIn(100)

	ESX.UI.Menu.CloseAll()
end)

function OpenMenu(target)

	local elements = {}

	table.insert(elements, {label = ('Mission Row'), value = 'nr1'})
	table.insert(elements, {label = ('Airport'), value = 'nr2'})
	table.insert(elements, {label = ('Vinewood Depot'), value = 'nr3'})
	table.insert(elements, {label = ('Sandy Shores'), value = 'nr5'})
	table.insert(elements, {label = ("Paleto Bay"), value = 'nr4'})
	table.insert(elements, {label = ("Grapeseed"), value = 'nr6'})
  		ESX.UI.Menu.CloseAll()	

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'przystanek_menu',
		{
			title    = ('Select a location           '),
			align    = 'top-right',
			elements = elements
		},
		
    function(data, menu)
		
		if data.current.value == 'nr1' then
		TriggerEvent('nr1')
		elseif data.current.value == 'nr2' then
		TriggerEvent('nr2')
		elseif data.current.value == 'nr3' then
		TriggerEvent('nr3')
		elseif data.current.value == 'nr4' then
		TriggerEvent('nr4')
		elseif data.current.value == 'nr5' then
		TriggerEvent('nr5')
		elseif data.current.value == 'nr6' then
		TriggerEvent('nr6')
	
		end
	end)
end


TeleportPrzystanek = function()

            local WaypointHandle = GetFirstBlipInfoId(8)

            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end

                    Citizen.Wait(5)
                end
            end
end

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function LocalPed()
	return ped
end

-- Skrypt autorstwa Soulyy#4480