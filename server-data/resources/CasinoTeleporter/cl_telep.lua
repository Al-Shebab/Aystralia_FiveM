local asc1 = vector3(925.01,46.46,81.11)
local asc2 = vector3(-1097.7854003906,-848.30633544922,23.038433074951)
local asc3 = vector3(-1097.6999511719,-848.39636230469,26.827432632446)
local asc4 = vector3(-1097.7384033203,-848.33282470703,30.756952285767)
local asc5 = vector3(-1097.6417236328,-848.53894042969,34.36100769043)
local asc6 = vector3(1090,207.11,-49) ---
local ascm3 = vector3(-1097.5833740234,-848.49346923828,13.687081336975)
local ascm2 = vector3(-1097.6983642578,-848.33142089844,10.276823043823)
local ascm1 = vector3(925.01,46.46,81.11) ---

local rota = 35.0

RMenu.Add('ELEVATOR', 'ELEVATOR', RageUI.CreateMenu("", "",1250,300,"shopui_title_casino", "shopui_title_casino"))

RMenu:Get('ELEVATOR', 'ELEVATOR'):SetSubtitle("~b~Teleporter")

function showAsc(flag)
    RageUI.Visible(RMenu:Get('ELEVATOR', 'ELEVATOR'), flag)
end

RageUI.CreateWhile(1.0, true, function()
    if RageUI.Visible(RMenu:Get('ELEVATOR', 'ELEVATOR')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()           
            RageUI.Button("~b~ Inside Casino", "",{ RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Hovered) then

                end
                if (Active) then

                end
                if (Selected) then
                    DoScreenFadeOut(500)
                    Citizen.Wait(500)
                    SetEntityCoords(PlayerPedId(),asc6.x,asc6.y,asc6.z)
                    SetEntityHeading(PlayerPedId(), rota)
                    DoScreenFadeIn(500)
                    Citizen.Wait(500)
                end
            end)

            RageUI.Button("~b~ Outside Casino", "",{ RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Hovered) then

                end
                if (Active) then

                end
                if (Selected) then
                    DoScreenFadeOut(500)
                    Citizen.Wait(500)
                    SetEntityCoords(PlayerPedId(),ascm1.x,ascm1.y,ascm1.z)
                    SetEntityHeading(PlayerPedId(), rota)
                    DoScreenFadeIn(500)
                    Citizen.Wait(500)
                end
            end)

        end, function()
        end)
    else
		Citizen.Wait(1000)
	end
end, 1)

fols = true
lwin = false

Citizen.CreateThread(function()
    while true do 
        if dAsc1 < 1.5  then
            fols = false 
            showAsc(true)
        elseif dAsc2 < 1.5 then
            fols = false
            showAsc(true)
        elseif dAsc3 < 1.5 then
            fols = false
            showAsc(true)
        elseif dAsc4 < 1.5 then
            fols = false
            showAsc(true)
        elseif dAsc5 < 1.5 then
            fols = false
            showAsc(true)
        elseif dAsc6 < 1.5 then
            fols = false
            showAsc(true)
        elseif dAsc7 < 1.5 then
            fols = false
            showAsc(true)
        elseif dAsc8 < 1.5 then
            fols = false
            showAsc(true)
        elseif dAsc9 < 1.5 then
            fols = false
            showAsc(true)
        elseif not fols then
            fols = true
            showAsc(false)
        elseif lwin then
            Wait(duree)
        end
        Wait(0)
    end
end)

dAsc1 = 10
dAsc2 = 10
dAsc3 = 10
dAsc4 = 10
dAsc5 = 10
dAsc6 = 10
dAsc7 = 10
dAsc8 = 10
dAsc9 = 10

Citizen.CreateThread(function()
    while true do

        local playerCoords = GetEntityCoords(PlayerPedId())

        dAsc1 = #(playerCoords-asc1)
        dAsc2 = #(playerCoords-asc2)
        dAsc3 = #(playerCoords-asc3)
        dAsc4 = #(playerCoords-asc4)
        dAsc5 = #(playerCoords-asc5)
        dAsc6 = #(playerCoords-asc6)
        dAsc7 = #(playerCoords-ascm3)
        dAsc8 = #(playerCoords-ascm2)
        dAsc9 = #(playerCoords-ascm1)

        if dAsc1 < 50 then
            lwin = false
        end
		
        if dAsc1 > 50 then
            duree = 3000
			lwin = true
			
            if dAsc1 > 200 then
                if dAsc1 > 500 then
                    duree = 30000
                    Wait(30000)
                else
                    duree = 15000
                    Wait(15000)
                end
            else
                Wait(3000)
            end
        end

        Wait(1000)
    end
end)

-- M-A-D-E B-Y X-O-N-A-A --
