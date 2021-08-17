-- Config
local ChopShop = vector3(602.38,-438.98,24.76)
local ScrapTrader = vector3(-429.33,-1728.33,19.78)

ScrapTraderPrices = {
    aluminium = 100,
    airbag = 250,
    radio = 600,
    wheel_rim = 300,
    battery = 440,
}

carblacklist = {
	"ADDER",
	"ZENTORNO",
}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local source = GetPlayerPed( -1 )

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist =  #(vector3(ChopShop['x'],ChopShop['y'],ChopShop['z']) - playerCoords)
		if dist <= 7 and IsPedInAnyVehicle(ped, false) then
			DrawText3Ds(ChopShop['x'],ChopShop['y'],ChopShop['z'],'Press ~r~[E]~s~ To Chop This Vehicle')
			if IsControlJustPressed(2, 86) then
				vehicle = GetVehiclePedIsIn(ped, false)
				plate = GetVehicleNumberPlateText(vehicle)
				carModel = GetEntityModel(vehicle)
				carName = GetDisplayNameFromVehicleModel(carModel)
				if not isCarBlacklisted(carName) then
					ChopVehicle()
					TriggerServerEvent('RemoveOwnedVehicle', plate)
				else
					exports['mythic_notify']:SendAlert('error', "Sorry, I won't take this model")
				end
			end
		end
	Citizen.Wait(0)
    end
end)

RegisterNetEvent('DeleteEntity')
AddEventHandler( 'DeleteEntity', function()
    local ped = GetPlayerPed( -1 )
    local vehicle = GetVehiclePedIsIn( ped, false )
    if IsPedSittingInAnyVehicle( ped ) then 
        SetEntityAsMissionEntity( vehicle, true, true )
        TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
        Citizen.Wait(2000)
        NetworkFadeOutEntity(vehicle, true,false)
        Citizen.Wait(200)
        ESX.Game.DeleteVehicle(vehicle)
        notifyCops = math.random(0,4)--Change odds of police being called here 
        if notifyCops == 2 then
           notifyPolice()
        end
    end 
end)

function isCarBlacklisted(carName)
	for _, blacklistedCar in pairs(carblacklist) do
		if carName == blacklistedCar then
			return true
		end
	end

	return false
end

ChopVehicle = function(status)
		if not status then
			FreezeEntityPosition(PlayerPedId(), true)
			TriggerEvent('DeleteEntity')
			ESX.ShowNotification("Chopping Vehicle - Please wait...")
			Citizen.Wait(5000)
			ESX.ShowNotification("Chopping Vehicle - Please wait...")
			Citizen.Wait(5000)
			ESX.ShowNotification("Chopping Vehicle - Please wait...")
			Citizen.Wait(5000)
			ESX.ShowNotification("Vehicle Chopped!")
			TriggerServerEvent('Payout', source)
			Citizen.Wait(100)
			TriggerServerEvent('esx:activateMoney')
			FreezeEntityPosition(PlayerPedId(), false)
		end
end

--Text police
function notifyPolice()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)
	ESX.ShowNotification('Somebody has spotted you and reported you to the police')
	TriggerServerEvent('esx_phone:send', 'police', 'Somebody has just chopped a vehicle', false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end

DrawText3Ds = function(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local factor = #text / 370
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	DrawRect(_x,_y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 120)
end
