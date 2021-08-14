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
        Citizen.Wait(2000)
        ESX.Game.DeleteVehicle(vehicle)
        notifyCops = math.random(0,3)--Change odds of police being called here 
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

ChopVehicle = function(hash, source)
    	exports['mythic_progbar']:Progress({
		name = "Chop",
		duration = 20000,
		label = "Chopping in progress",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
		if not status then
			TriggerEvent('DeleteEntity')
			TriggerServerEvent('Payout', source)
		end
	end)
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

--Scrap Trader
local menuOpen = false
local wasOpen = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local dist =  #(vector3(ScrapTrader['x'],ScrapTrader['y'],ScrapTrader['z']) - coords)
		if dist <= 2 then
			DrawText3Ds(ScrapTrader['x'],ScrapTrader['y'],ScrapTrader['z'],"Press ~r~[E]~s~ to talk with the ~r~ Scrap Trader")
			if not menuOpen then
				if IsControlJustReleased(0, 38) then
					wasOpen = true
					OpenScrapShop()
				end
			else
				Citizen.Wait(500)
			end
		end
	end
end)

function OpenScrapShop()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen = true

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = ScrapTraderPrices[v.name]

		if price and v.count > 0 then
			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(v.label, '$'..price, ESX.Math.GroupDigits(price)),
				name = v.name,
				price = price,

				type = 'slider',
				value = 1,
				min = 1,
				max = v.count
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'scrap_trader', {
		title    = 'Scrap Trader',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('sellScrap', data.current.name, data.current.value)
	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

--Creates NPC for Scrap Trader
Citizen.CreateThread(function()
    npcHash = GetHashKey("mp_m_waremech_01")
    RequestModel(npcHash)
    while not HasModelLoaded(npcHash) do
        Wait(1)
    end
    scrap_trader = CreatePed(1, npcHash, -429.33,-1728.33,18.78, 79.12, false, true)
    SetBlockingOfNonTemporaryEvents(scrap_trader, true)
    SetPedDiesWhenInjured(scrap_trader, false)
    SetPedCanPlayAmbientAnims(scrap_trader, true)
    SetPedCanRagdollFromPlayerImpact(scrap_trader, false)
    SetEntityInvincible(scrap_trader, true)
    FreezeEntityPosition(scrap_trader, true)
	TaskStartScenarioInPlace(scrap_trader, "WORLD_HUMAN_SMOKING", 0, true);
	
	chopshop_ped = CreatePed(1, npcHash, 596.6,-437.89,23.74,258.34, false, true)
    SetBlockingOfNonTemporaryEvents(chopshop_ped, true)
    SetPedDiesWhenInjured(chopshop_ped, false)
    SetPedCanPlayAmbientAnims(chopshop_ped, true)
    SetPedCanRagdollFromPlayerImpact(chopshop_ped, false)
    SetEntityInvincible(chopshop_ped, true)
    FreezeEntityPosition(chopshop_ped, true)
    TaskStartScenarioInPlace(chopshop_ped, "world_human_leaning", 0, true);
end)
--End of Scrap Trader 

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
