ESX = nil

RegisterNetEvent('vb-banking:client:refreshbalance')
AddEventHandler('vb-banking:client:refreshbalance', function(balance)
  local _streetcoords = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(PlayerPedId()))))
  local _pid = GetPlayerServerId(PlayerId())
  ESX.TriggerServerCallback('vb-banking:server:GetPlayerName', function(playerName)
  end)
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

Config              = {}
Config.DrawDistance = 100
Config.Size         = {x = 1.0, y = 1.0, z = 1.0}
Config.Color        = {r = 69, g = 97, b = 171}
Config.Type         = 40

local position = {
        {x = -119.29 , y = -977.18, z = 304.25},
        {x = -521.73 , y = 4427.68, z = 89.63},
        {x = 424.23 , y = 5614.0, z = 766.62},
}  

Citizen.CreateThread(function()
     for k in pairs(position) do
        local blip = AddBlipForCoord(position[k].x, position[k].y, position[k].z)
        SetBlipSprite(blip, 94)
        SetBlipColour(blip, 29)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Parachuting")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(position) do
            if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, position[k].x, position[k].y, position[k].z, true) < Config.DrawDistance) then
                DrawMarker(Config.Type, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, true, false, false, false)
                letSleep = false
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

RMenu.Add('parachute', 'main', RageUI.CreateMenu("", "~b~Ammunition", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('parachute', 'main'), true, true, true, function()

            RageUI.Button("1x Parachute", "Price: ~b~$1,000", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                TriggerServerEvent('h4ci:giveparachute')
                ESX.ShowNotification("You have purchased a ~b~Parachute")
                TriggerServerEvent('vb-banking:server:balance', inMenu)
            end
            end)
        end, function()
        end)
            Citizen.Wait(0)
        end
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then
                    ESX.ShowHelpNotification("Press ~INPUT_PICKUP~ to purchase a ~b~Parachute")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('parachute', 'main'), not RageUI.Visible(RMenu:Get('parachute', 'main')))
                    end   
                end
            end
        end
    end)