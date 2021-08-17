--		Created by Wallbanged				--
--		Custom Add-On Spawner V 1.0.0			--



local menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu('Vehicle Spawner', "", 1420, 0)
local HondaMenu = menuPool:AddSubMenu(mainMenu, 'Honda', "", 1420, 0)
local FerrariMenu = menuPool:AddSubMenu(mainMenu, 'Ferrari', "", 1420, 0)
local FordMenu = menuPool:AddSubMenu(mainMenu, 'Ford', "", 1420, 0)
local NissanMenu = menuPool:AddSubMenu(mainMenu, 'Nissan', "", 1420, 0)
local PontiacMenu = menuPool:AddSubMenu(mainMenu, 'Pontiac', "", 1420, 0)
local TeslaMenu = menuPool:AddSubMenu(mainMenu, 'Tesla', "", 1420, 0)

-- Honda --
local Honda = {}
Honda.civicek9rb = NativeUI.CreateItem('Honda Civic - Stanced', 'Press [ENTER] to spawn')
Honda.km86civic = NativeUI.CreateItem('Honda Civic 86', 'Press [ENTER] to spawn')
Honda.fk2 = NativeUI.CreateItem('Honda Type R', 'Press [ENTER] to spawn')

HondaMenu:AddItem(Honda.civicek9rb)
HondaMenu:AddItem(Honda.km86civic)
HondaMenu:AddItem(Honda.fk2)

HondaMenu.OnItemSelect = function(sender, item, index)
    if item == Honda.civicek9rb then
        deleteVeh()
        spawnVehicle('civicek9rb', 'Honda Civic - Stanced')
    elseif item == Honda.km86civic then
        deleteVeh()
        spawnVehicle('km86civic', 'Honda Civic 86')
    elseif item == Honda.fk2 then
        deleteVeh()
        spawnVehicle('fk2', 'Honda Type R')
    end
end

-- Ferrari --
local Ferrari = {}
Ferrari.bb512 = NativeUI.CreateItem('Ferrari 512', 'Press [ENTER] to spawn')

FerrariMenu:AddItem(Ferrari.bb512)

FerrariMenu.OnItemSelect = function(sender, item, index)
    if item == Ferrari.bb512 then
        deleteVeh()
        spawnVehicle('bb512', 'Ferrari 512')
    end
end

-- Ford --
local Ford = {}
Ford.xbgt = NativeUI.CreateItem('Ford Falcon', 'Press [ENTER] to spawn')

FordMenu:AddItem(Ford.xbgt)

FordMenu.OnItemSelect = function(sender, item, index)
    if item == Ford.xbgt then
        deleteVeh()
        spawnVehicle('xbgt', 'Ford Falcon')
    end
end

-- Nissan --
local Nissan = {}
Nissan.er34 = NativeUI.CreateItem('Nissan R34', 'Press [ENTER] to spawn')

NissanMenu:AddItem(Nissan.er34)

NissanMenu.OnItemSelect = function(sender, item, index)
    if item == Nissan.er34 then
        deleteVeh()
        spawnVehicle('er34', 'Nissan R34')
    end
end

-- Pontiac --
local Pontiac = {}
Pontiac.outlaw = NativeUI.CreateItem('Pontiac Outlaw', 'Press [ENTER] to spawn')
Pontiac.sjpontiac = NativeUI.CreateItem('Pontiac SJ', 'Press [ENTER] to spawn')

PontiacMenu:AddItem(Pontiac.outlaw)
PontiacMenu:AddItem(Pontiac.sjpontiac)

PontiacMenu.OnItemSelect = function(sender, item, index)
    if item == Pontiac.outlaw then
        deleteVeh()
        spawnVehicle('outlaw', 'Pontiac Outlaw')
    elseif item == Pontiac.sjpontiac then
        deleteVeh()
        spawnVehicle('sjpontiac', 'Pontiac SJ')
    end
end

-- Tesla --
local Tesla = {}
Tesla.teslax = NativeUI.CreateItem('Tesla Model X', 'Press [ENTER] to spawn')

TeslaMenu:AddItem(Tesla.teslax)

TeslaMenu.OnItemSelect = function(sender, item, index)
    if item == Tesla.teslax then
        deleteVeh()
        spawnVehicle('teslax', 'Tesla Model X')
    end
end





---------------------------------------------------------------------------------------------------------------

--PontiacMenu.OnItemSelect = function(sender, item, index)
--    if item == Pontiac.Tesla_Roadster then
--       deleteVeh()
--        spawnVehicle('Tesla_Roadster', '2011 CVPI')
--    elseif item == Pontiac.so13 then
--        deleteVeh()
--        spawnVehicle('so13', '2014 Charger')
--    end
--end


--[[                           EXAMPLE
local audi = menuPool:AddSubMenu(vehiclesMenu, 'Audi', "", 1420, 0)

local aVehiclesMenus = {}

aVehiclesMenus.a8audi = NativeUI.CreateItem('2010 Audi A8', 'Press [ENTER] to spawn')
aVehiclesMenus.audirs6tk = NativeUI.CreateItem('2013 Audi RS6 Avant', 'Press [ENTER] to spawn')
aVehiclesMenus.audis8om = NativeUI.CreateItem('2014 Audi S8', 'Press [ENTER] to spawn')
aVehiclesMenus.rs7 = NativeUI.CreateItem('2015 Audi RS7', 'Press [ENTER] to spawn')

audi:AddItem(aVehiclesMenus.a8audi)
audi:AddItem(aVehiclesMenus.audirs6tk)
audi:AddItem(aVehiclesMenus.audis8om)
audi:AddItem(aVehiclesMenus.rs7)

audi.OnItemSelect = function(sender, item, index)
    if item == aVehiclesMenus.a8audi then
        deleteVeh()
        spawnVehicle ('a8audi', '2010 Audi A8')
    elseif item == aVehiclesMenus.audirs6tk then
        deleteVeh()
        spawnVehicle ('audirs6tk', '2013 Audi RS6 Avant')
    elseif item == aVehiclesMenus.audis8om then
        deleteVeh()
        spawnVehicle ('audis8om', '2014 Audi S8')
    elseif item == aVehiclesMenus.rs7 then
        deleteVeh()
        spawnVehicle ('rs7', '2015 Audi RS7')
    end
end]]

RegisterCommand('spawn', function() -- edit this line to change the command to open the menu
    mainMenu:Visible(not mainMenu:Visible())
end, false)
------------------------------------------------DO NOT EDIT BELOW THIS LINE---------------------------------------------------------------

function deleteVeh()
    local ped = GetPlayerPed(-1)
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)

		if (IsPedSittingInAnyVehicle(ped)) then 
			local handle = GetVehiclePedIsIn(ped, false)
			NetworkRequestControlOfEntity(handle)
			SetEntityHealth(handle, 100)
			SetEntityAsMissionEntity(handle, true, true)
			SetEntityAsNoLongerNeeded(handle)
			DeleteEntity(handle)
            ShowInfo("The vehicle you were in has been deleted.")
        end
    end
end

function ShowInfo(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)
end


function spawnVehicle(vehicle, name)
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
        local color = "~y~"
        local color2 = "~r~"
        local ped = GetPlayerPed(-1)
        if DoesEntityExist(ped) then
            vehiclehash = GetHashKey(vehicle)
            RequestModel(vehiclehash)
            Citizen.CreateThread(function() 
                local waiting = 0
                while not HasModelLoaded(vehiclehash) do
                    waiting = waiting + 100
                    Citizen.Wait(100)
                    if waiting > 5000 then
                        ShowInfo(color2 .."Could not load model in time. Crash was prevented.")
                        break
                    end
                end
                local spawnedVeh = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
                SetPedIntoVehicle(PlayerPedId(), spawnedVeh, -1)
                SetVehicleDirtLevel(spawnedVeh, 0.0)
            end)
            ShowInfo("You have spawned in a ".. color .. name .. "")
            Wait(1000)
            return true
    end
    ShowInfo("All parking spots are currently full.")
    return false
end


function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

menuPool:Add(mainMenu)

menuPool:RefreshIndex()

menuPool:MouseControlsEnabled(false)
menuPool:ControlDisablingEnabled(false)

CreateThread(function()
    while true do
        Wait(0)

        menuPool:ProcessMenus()
    end
end)


function HelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 1, 1, -1)
end
