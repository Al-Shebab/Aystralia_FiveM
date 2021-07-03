------------------------------Death System Modified by Mailar--------------------------------------
IsDead = false
local secondsRemaining = 30 --< Remaining seconds until you can respawn!
-- Functions --
function drawTxt(x,y,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
    SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
-- Load Animation --
function loadAnimDict(dict)
    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do        
        Citizen.Wait(1)
    end
end
-- StartUI --
function startT(source)
    local helth = GetEntityHealth(GetPlayerPed(-1))
	if secondsRemaining > 1 then 
 	drawTxt(0.76, 1.4, 1.0,1.3,0.6, "~w~You are dead ~w~[~r~" .. secondsRemaining .. "~w~] seconds remaining until ~w~respawn", 255, 255, 255, 255)
    DrawRect(0.494, 0.78, 1.025, 0.08, 5, 5, 3, 192)
	end
   	if secondsRemaining < 1 then 
   drawTxt(0.86, 1.4, 1.0,1.3,0.6, "~w~[~r~E~w~] to respawn or wait for ~r~EMS TO COME~w~", 255, 255, 255, 255)
   DrawRect(0.494, 0.78, 1.025, 0.08, 5, 5, 3, 192)
end 
        if IsControlJustReleased(1, 38) and secondsRemaining < 1 then 
        local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
        IsDead = false
        Citizen.Wait(1000) -- How long to wait in fade
        NetworkResurrectLocalPlayer(playerPos, true, true, false) -- Keep this to fix Weapon Wheel
        SetEntityHealth(GetPlayerPed(-1), 200)      
        SetEntityCoords(GetPlayerPed(-1), -11.07,-1828.86,25.4)
        secondsRemaining = 10
    end
end
-- Code -- 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if secondsRemaining > 0 and IsDead == true then 
            secondsRemaining = secondsRemaining -1
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    	local health = GetEntityHealth(GetPlayerPed(-1))
        Citizen.Wait(0)
		if health < 2 then
		IsDead = true    
	    end
	end
end)

Citizen.CreateThread(function()
    while true do
    	local player = GetPlayerPed(-1)
        Citizen.Wait(0)
        	if IsDead == true then
    exports.spawnmanager:setAutoSpawn(false)                
        	startT()
        	SetEntityHealth(player, 200) 
			loadAnimDict( "dead" )
			TaskPlayAnim(GetPlayerPed(-1), "dead", "dead_a", 1.0, 1.0, -1, 1, 0, 0, 0, 0)            
 	   end
	end
end)

--Die Command--
RegisterCommand("die", function(source, args, rawCommand)
	IsDead = true
end)

RegisterCommand("revive", function(source, args, rawCommand)
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)    
    if IsDead == true then 
    secondsRemaining = 15  -- < change this one too!
    IsDead = false
    Citizen.Wait(100)
    SetPlayerInvisibleLocally(player, true)
    Wait(100)
    ClearPedTasks(player)
    SetPlayerInvisibleLocally(player, false)        
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, true, false)
    end      
end)