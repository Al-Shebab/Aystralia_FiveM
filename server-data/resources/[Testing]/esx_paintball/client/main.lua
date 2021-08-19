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

local tenue = {x=3079.19,y=-4646.23,z=6.07} -- Team Selector
local gamestart = {x=3077.78,y=-4641.86,z=7.07} -- Start Game Marker
local millieu = {x=3077.78,y=-4641.86,z=7.07} -- Start Game
local equipebleu = {x=3039.99,y=-4688.84,z=11.07} -- Blue Triangle
local equiperouge = {x=3079.11,y=-4806.96,z=12.08} -- Red Triangle
local spawnbleu = {x=3039.99,y=-4688.84,z=6.07} -- Blue Spawnpoint
local spawnrouge = {x=3079.11,y=-4806.96,z=7.08} -- Red Spawnpoint
local miseazero = {x=3080.58,y=-4650.93,z=7.07} -- Score Reset

local home = {x=12.93,y=-1098.56,z=29.8} -- Game Start
local homeblip = {x=12.93,y=-1098.56,z=29.8} -- Blip
local activity = {x=3069.5,y=-4648.44,z=6.08} -- Exit

ESX                           = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local PlayerData                = {}
local modele = 0

local playerJob = ""
local playerGrade = ""


Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
   playerJob = xPlayer.job.name
   playerGrade = xPlayer.job.grade_name
   PlayerData = xPlayer
end)

function DrawSub(text, time)
  ClearPrints()
  SetTextEntry_2('STRING')
  AddTextComponentString(text)
  DrawSubtitleTimed(time, 1)
end


Citizen.CreateThread(function()

    homeblip = AddBlipForCoord(homeblip.x, homeblip.y, homeblip.z)
	SetBlipSprite(homeblip, 437)
	SetBlipColour(homeblip, 3)
	SetBlipAsShortRange(homeblip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Paintball")
	EndTextCommandSetBlipName(homeblip)

	
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		
		RegisterNetEvent('esx:playerLoaded')
		AddEventHandler('esx:playerLoaded', function(xPlayer)
		playerJob = xPlayer.job.name
		playerGrade = xPlayer.job.grade_name
		PlayerData = xPlayer
		end)
		
		
		
		DrawMarker(1,tenue.x,tenue.y,tenue.z-1,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0) -- Vestiaire du paintballw
		DrawMarker(5,gamestart.x,gamestart.y,gamestart.z-1,0,0,0,0,0,0,2.001,2.0001,1.7001,0,155,255,200,0,1,0,0) -- gamestart
		DrawMarker(0,equipebleu.x,equipebleu.y,equipebleu.z-1,0,0,0,0,0,0,2.001,2.0001,5.5001,0,155,255,200,0,0,0,0) -- gamestart
		DrawMarker(0,equiperouge.x,equiperouge.y,equiperouge.z-1,0,0,0,0,0,0,2.001,2.0001,5.5001,255,0,0,200,0,0,0,0) -- gamestart
		DrawMarker(24,miseazero.x,miseazero.y,miseazero.z-1,0,0,0,0,0,0,1.001,1.0001,1.5001,255,0,0,200,0,1,0,0) -- gamestart
		
		DrawMarker(1,home.x,home.y,home.z-1,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0) -- gamestart
		DrawMarker(1,homeblip.x,home.y,home.z-1,0,0,0,0,0,0,2.001,2.0001,0.5001,255,0,0,200,0,0,0,0) -- gamestart
		DrawMarker(1,activity.x,activity.y,activity.z-1,0,0,0,0,0,0,2.001,2.0001,0.5001,255,255,255,200,0,0,0,0) -- Reset Marker
		
		
		if(isNear(tenue)) then
				Info("Press ~INPUT_PICKUP~ to select a team")
				if(IsControlJustPressed(1, 38)) then
					OuvrirVestiaire()
				end
		end
		
		if(isNear(gamestart)) then
				Info("Press ~INPUT_PICKUP~ to start the match")
				if(IsControlJustPressed(1, 38)) then
					debutpartie()
				end
		end
		
		if(isNear(miseazero)) then
				Info("Press ~INPUT_PICKUP~ to reset the score")
				if(IsControlJustPressed(1, 38)) then
					remettrezero()
				end
		end
		
	
		if (Vdist(pos.x, pos.y, pos.z, home.x, home.y, home.z) < 2.0) then
				Info("Press ~INPUT_PICKUP~ to play Paintball")
				if(IsControlJustPressed(1, 38)) then
					allerjouer()
				end
		end
		
		if (Vdist(pos.x, pos.y, pos.z, activity.x, activity.y, activity.z) < 2.0) then
				Info("Press ~INPUT_PICKUP~ to return to the city")
				if(IsControlJustPressed(1, 38)) then
					quitterpaintball()
				end
		end
	
		
		
end
end)



function OuvrirVestiaire()

  local elements = {
    { label = ('Return to Civilian Clothing'), value = 'citizen_wear' }
  }


    table.insert(elements, {label = "Ballas", value = 'tenue_equipe'})
	table.insert(elements, {label = "Families", value = 'tenue_equipedeux'})


ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vestiaire',
    {
      title    = ('Team Selector'),
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)
      menu.close()

      if data.current.value == 'citizen_wear' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local model = nil
          if skin.sex == 0 then
            model = GetHashKey("mp_m_freemode_01")
          else
            model = GetHashKey("mp_f_freemode_01")
          end

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)

          TriggerEvent('skinchanger:loadSkin', skin)
          local playerPed = GetPlayerPed(-1)
          SetPedArmour(playerPed, 0)
          ClearPedBloodDamage(playerPed)
          ResetPedVisibleDamage(playerPed)
          ClearPedLastWeaponDamage(playerPed)
		  modele = 1
        end)
      end
	  
	    if data.current.value == 'tenue_equipe' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin.sex == 0 then

          local model = GetHashKey("g_m_y_ballaorig_01")
			
          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
		    local playerPed  = GetPlayerPed(-1)
		    local weaponHash = GetHashKey("WEAPON_PISTOL50")
		    GiveWeaponToPed(playerPed, weaponHash, 250, false, false)
		    modele = 2
        team = 1
		    autorevive()
          end

        end)
      end
	  
	  	if data.current.value == 'tenue_equipedeux' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin.sex == 0 then

          local model = GetHashKey("g_m_y_famca_01")
			
          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
		    local playerPed  = GetPlayerPed(-1)
		    local weaponHash = GetHashKey("WEAPON_PISTOL50")
		    GiveWeaponToPed(playerPed, weaponHash, 250, false, false)
		    modele = 3
        team = 2
		  
		    autorevive()
          end

        end)
      end
		
		CurrentAction     = 'menu_vestiaire'
		CurrentActionMsg  = ('ouvrir_vestiaire')
		CurrentActionData = {}
	end,	
	function(data, menu)
      menu.close()

      CurrentAction     = 'menu_vestiaire'
      CurrentActionMsg  = ('ouvrir_vestiaire')
      CurrentActionData = {}
	end
  )

end

function isNear(tabl)
	local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),tabl.x,tabl.y,tabl.z, true)

	if(distance<3) then
		return true
	end

	return false
end

function quitterpaintball()
DoScreenFadeOut(1000)
if modele == 2 or modele == 3 then

ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local model = nil

          if skin.sex == 0 then
            model = GetHashKey("mp_m_freemode_01")
          else
            model = GetHashKey("mp_f_freemode_01")
          end

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)

          TriggerEvent('skinchanger:loadSkin', skin)
          local playerPed = GetPlayerPed(-1)
          SetPedArmour(playerPed, 0)
          ClearPedBloodDamage(playerPed)
          ResetPedVisibleDamage(playerPed)
          ClearPedLastWeaponDamage(playerPed)
		  modele = 1
end)
end


Citizen.Wait(2000)
SetEntityCoords(GetPlayerPed(-1),home.x,home.y,home.z+1)
Citizen.Wait(1000)
DoScreenFadeIn(1000)


end

function Info(text, loop)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, loop, 1, 0)
end


function autorevive()
	while true do
		Citizen.Wait(0)
		local myPed = GetPlayerPed(-1)
		local vie = GetEntityHealth(myPed)
		local weaponHash = GetHashKey("WEAPON_PISTOL50")
    local model1 = GetHashKey("g_m_y_ballaorig_01")
    local model2 = GetHashKey("g_m_y_famca_01")
			if team == 1 then
				if vie <= 2 then
          SetPlayerModel(PlayerId(), model)
          ESX.ShowNotification('Respawning in 5')
          Citizen.Wait(1000)
          ESX.ShowNotification('Respawning in 4')
          Citizen.Wait(1000)
          ESX.ShowNotification('Respawning in 3')
          Citizen.Wait(1000)
          ESX.ShowNotification('Respawning in 2')
          Citizen.Wait(1000)
          ESX.ShowNotification('Respawning in 1')
          Citizen.Wait(1000)
					revive()
          RequestModel("g_m_y_ballaorig_01")
          SetPlayerModel(PlayerId(), "g_m_y_ballaorig_01")
          Citizen.Wait(500)
          SetPlayerModel(PlayerId(), "g_m_y_ballaorig_01")
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), 250, false, false)
          Citizen.Wait(1000)
					SetEntityCoords(GetPlayerPed(-1),3079.11,-4806.96,7.08)
				end
			elseif team == 2 then
				if vie <= 2 then
          ESX.ShowNotification('Respawning in 5')
          Citizen.Wait(1000)
          ESX.ShowNotification('Respawning in 4')
          Citizen.Wait(1000)
          ESX.ShowNotification('Respawning in 3')
          Citizen.Wait(1000)
          ESX.ShowNotification('Respawning in 2')
          Citizen.Wait(1000)
          ESX.ShowNotification('Respawning in 1')
          Citizen.Wait(1000)
					revive()
          RequestModel("g_m_y_famca_01")
          SetPlayerModel(PlayerId(), "g_m_y_famca_01")
          Citizen.Wait(500)
          SetPlayerModel(PlayerId(), "g_m_y_famca_01")
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), 250, false, false)
          Citizen.Wait(1000)
					SetEntityCoords(GetPlayerPed(-1),3039.99,-4688.84,6.07)
				end
			end
  end
end

function revive()
local localPlayerId = PlayerId()
local serverId = GetPlayerServerId(localPlayerId)
TriggerServerEvent('esx_ambulancejob:revive', serverId)
TriggerServerEvent('esx_ambulancejob:paintballrevive', serverId)
end


function distancenotification(point)
	local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),point.x,point.y,point.z, true)

	if(distance<100) then
		return true
	end

	return false
end


function debutpartie()
  local myPed = GetPlayerPed(-1)
  local vie = GetEntityHealth(myPed)
  local model1 = GetHashKey("g_m_y_ballaorig_01")
  local model2 = GetHashKey("g_m_y_famca_01")
	if(distancenotification(millieu)) then
		ESX.ShowNotification('Match starting in 3')
		Citizen.Wait(1000)
		ESX.ShowNotification('Match starting in 2')
		Citizen.Wait(1000)
		ESX.ShowNotification('Match starting in 1')
		Citizen.Wait(1000)
		ESX.ShowNotification('GO!')
     if team == 1 then
      SetEntityCoords(GetPlayerPed(-1),3079.11,-4806.96,7.08)
      GiveWeaponToPed(myPed, weaponHash, 250, false, false)
    elseif team == 2 then	
      SetEntityCoords(GetPlayerPed(-1),3039.99,-4688.84,6.07)
      GiveWeaponToPed(myPed, weaponHash, 250, false, false)
    end
	end
end

function allerjouer()
DoScreenFadeOut(1000)
Citizen.Wait(2000)
SetEntityCoords(GetPlayerPed(-1),activity.x,activity.y,activity.z+1)
Citizen.Wait(1000)
DoScreenFadeIn(1000)

Citizen.CreateThread(function()
    function Initialize(scaleform)
        local scaleform = RequestScaleformMovie(scaleform)

        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end
        PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
        PushScaleformMovieFunctionParameterString("~r~Bon paintball !!")
		PushScaleformMovieFunctionParameterString("J'espère que vos armes sont dans votre coffre !")
        PopScaleformMovieFunctionVoid()
        return scaleform
    end
    scaleform = Initialize("mp_big_message_freemode")
	local temps = 0
    while temps<200 do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
		temps = temps + 1
    end
end)
end


function notif(modele)
Citizen.Wait(2000)
TriggerServerEvent('esx_paintball:pointage', modele)
end


RegisterNetEvent('showNotify')
AddEventHandler('showNotify', function(notify)
	ShowAboveRadarMessage(notify)
end)

function ShowAboveRadarMessage(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function remettrezero()
TriggerServerEvent('esx_paintball:remmetrezero')
ESX.ShowNotification('~p~Le score est maintenant à zéro')
end

RegisterCommand("quit", function()
  local model1 = GetHashKey("g_m_y_ballaorig_01")
  local model2 = GetHashKey("g_m_y_famca_01")
  if model1 then
    allerjouer()
  elseif model2 then
    allerjouer()
  else
    ESX.ShowNotification("You can not quit a game you are not in...", true)
  end
end)





