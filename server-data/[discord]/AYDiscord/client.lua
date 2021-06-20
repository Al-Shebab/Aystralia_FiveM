Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(755792927891914812)
		SetDiscordRichPresenceAsset('background')
        SetDiscordRichPresenceAssetText('Aystralia RP')
        SetDiscordRichPresenceAssetSmall('logo_name')
        SetDiscordRichPresenceAssetSmallText('Aystralia RP')
		Citizen.Wait(3000)
	end
end)
Citizen.CreateThread(function()
	while true do
		local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
		if VehName == "NULL" then VehName = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))) end
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
		local StreetHash = GetStreetNameAtCoord(x, y, z)
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		Citizen.Wait(1000)
		if StreetHash ~= nil then
			StreetName = GetStreetNameFromHashKey(StreetHash)
			if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				if IsPedSprinting(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Sprinting")
				elseif IsPedRunning(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Running")
				elseif IsPedWalking(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Walking")
				elseif IsPedFalling(PlayerPedId()) or IsPedInParachuteFreeFall(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Falling")
				elseif IsPedPerformingMeleeAction(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Punching")
				elseif GetEntityHealth(PlayerPedId()) < 15 then
					SetRichPresence("[ID "..pId.."] Seriously Injured")
				elseif IsPedJumping(PlayerPedId()) or IsPedVaulting(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Jumping")
				elseif IsPedClimbing(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Climbing")
				elseif IsPedClimbing(PlayerPedId()) and IsPedRunning(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Climbing")
				elseif IsPedClimbing(PlayerPedId()) and IsPedWalking(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Climbing")
				elseif IsPedStill(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Standing")
				elseif IsPedGettingIntoAVehicle(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Getting inside "..VehName)
				elseif IsPedJumpingOutOfVehicle(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Getting out of "..VehName)
				elseif IsPedSittingInAnyVehicle(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Going for a ride")
				end
			elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				local MPH = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 3.6)
				if MPH > 220 then
					SetRichPresence("[ID "..pId.."] Bolting at "..MPH.."kph")
				elseif MPH <= 220 and MPH > 150 then
					SetRichPresence("[ID "..pId.."] Racing at "..MPH.."kph")
				elseif MPH <= 150 and MPH > 70 then
					SetRichPresence("[ID "..pId.."] Driving at "..MPH.."kph")
				elseif MPH <= 70 and MPH > 0 then
					SetRichPresence("[ID "..pId.."] Cruising at "..MPH.."kph")
				elseif MPH == 0 then
					SetRichPresence("[ID "..pId.."] Inside "..VehName)
				elseif PedJumpingOutOfVehicle(PlayerPedId()) or IsPedGettingIntoAVehicle(PlayerPedId()) then
					SetRichPresence("[ID "..pId.."] Inside "..VehName)
				end
			elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
				if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then
				local HIH = math.ceil(GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) * 1.15)
					SetRichPresence("[ID "..pId.."] Flying at "..HIH.."m")
				else
					SetRichPresence("[ID "..pId.."] Landed")
				end
			elseif IsPedSwimming(PlayerPedId()) then
				SetRichPresence("[ID "..pId.."] Swimming")
			elseif IsPedSwimming(PlayerPedId()) and IsPedSwimmingUnderWater(PlayerPedId()) then
				SetRichPresence("[ID "..pId.."] Diving")
			elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("[ID "..pId.."] Sailing at "..MPH.."kph")
			elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("[ID "..pId.."] In a Submarine")
			end
		end
	end
end)