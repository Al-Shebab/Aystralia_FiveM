RMenu.Add('vrpgunshops', 'main', RageUI.CreateMenu("", "~b~Ammunition", nil, nil, "gunstore", "gunstore"))
RMenu.Add('vrpgunshops', 'knifes', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Knifes", nil, nil, "gunstore", "gunstore"))
RMenu.Add('vrpgunshops', 'pistols', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Pistols", nil, nil, "gunstore", "gunstore"))
RMenu.Add('vrpgunshops', 'smgs', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Submachine Guns", nil, nil, "gunstore", "gunstore"))
RMenu.Add('vrpgunshops', 'shotgun', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Shotguns", nil, nil, "gunstore", "gunstore"))
RMenu.Add('vrpgunshops', 'ars', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Assault Rifles", nil, nil, "gunstore", "gunstore"))
RMenu.Add('vrpgunshops', 'sniper', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Sniper Rifles", nil, nil, "gunstore", "gunstore"))
RMenu.Add('vrpgunshops', 'throw', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Throwables", nil, nil, "gunstore", "gunstore"))

-- RageUI.CreateWhile(wait, menu, key, closure)
RageUI.CreateWhile(1.0, RMenu:Get('vrpgunshops', 'main'), nil, function()

 -- RageUI.IsVisible(menu, header, glare, instructional, items, panels)
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'main'), true, false, true, function()
        knifesBtn()
        pistolBtn()
        smgsBtn()
        shotgunBtn()
        arsBtn()
        sniperBtn()
        throwBtn()
     
    end, function()
        ---Panels
    end)
    knifesSM()
    pistolSM()
    smgsSM()
    shotgunSM()
    arsSM()
    sniperSM()
    throwSM()
end)

RegisterNetEvent('VRPGUNSHOPS:menu')
AddEventHandler('VRPGUNSHOPS:menu', function()
    RageUI.Visible(RMenu:Get("vrpgunshops", "main"))
    alert('Insufficent funds')
end)

function knifesBtn() 
    RageUI.Button("Knifes" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('vrpgunshops', 'knifes'))
end

function pistolBtn() 
    RageUI.Button("Pistols" , nil, {

        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('vrpgunshops', 'pistols'))
end

function smgsBtn() 
    RageUI.Button("Submachine Guns" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            if Selected then
                -- My action the button is selected
            end
        end
    end, RMenu:Get('vrpgunshops', 'smgs'))
end

function shotgunBtn() 
    RageUI.Button("Shotguns" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('vrpgunshops', 'shotgun'))
end

function arsBtn() 
    RageUI.Button("Assault Rifles" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('vrpgunshops', 'ars'))
end

function sniperBtn() 
    RageUI.Button("Sniper Rifles" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('vrpgunshops', 'sniper'))
end

function throwBtn() 
    RageUI.Button("Throwables" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('vrpgunshops', 'throw'))
end

--[[Sub Menus]]

function knifesSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'knifes'), true, false, true, function()
        for i , p in pairs(cfg.guns.knifes) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                   TriggerServerEvent('VRPGUNSHOPS:buywap', p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function pistolSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'pistols'), true, false, true, function()
        for i , p in pairs(cfg.guns.pistols) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                   TriggerServerEvent('VRPGUNSHOPS:buywap', p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function smgsSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'smgs'), true, false, true, function()
        for i , p in pairs(cfg.guns.smgs) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("VRPGUNSHOPS:buywap",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function shotgunSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'shotgun'), true, false, true, function()
        for i , p in pairs(cfg.guns.shotguns) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("VRPGUNSHOPS:buywap",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function arsSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'ars'), true, false, true, function()
        for i , p in pairs(cfg.guns.ars) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("VRPGUNSHOPS:buywap",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function sniperSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'sniper'), true, false, true, function()
        for i , p in pairs(cfg.guns.sniper) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("VRPGUNSHOPS:buywap",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function throwSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'throw'), true, false, true, function()
        for i , p in pairs(cfg.guns.throw) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("VRPGUNSHOPS:buywap",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

--! Currently Broken (Dynamic#0001)
--! Hot Fix for now
-- for k,v in pairs(cfg.gunshops) do 
--     local px,py,pz,ph = table.unpack(v.ped)
--     local model = -1643617475
--     local v2 = vector3(px,py,pz)
--     RequestModel(model)
--     while not HasModelLoaded(model) do
--         RequestModel(model)
--         Citizen.Wait(0)
--     end
--     ped = CreatePed(5, model, v2, ph, true, false)
--     SetEntityInvincible(ped, true)
--     SetEntityCanBeDamaged(ped, false)
--     SetPedCanRagdoll(GetPlayerPed(-1), false)
-- end

isInMenu = false
currentAmmunition = nil
Citizen.CreateThread(function() 
    while true do
        for k, v in pairs(cfg.gunshops) do 
            local x,y,z = table.unpack(v.marker)
            local v1 = vector3(x,y,z)
            if cfg.blipsenabled then 
                local temp2 = AddBlipForCoord(x,y,z)
                SetBlipSprite(temp2, 110)
            end
            if isInArea(v1, 100.0) then 
                DrawMarker(25, v1.x,v1.y,v1.z - 0.999999, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 2.5, 255, 0, 0, 150, 0, 0, 2, 0, 0, 0, false)
            end
            if isInMenu == false then
            if isInArea(v1, 1.4) then 
                alert('Press ~INPUT_VEH_HORN~ to buy weapons')
                if IsControlJustPressed(0, 51) then 
                    currentAmmunition = k
                    RageUI.Visible(RMenu:Get("vrpgunshops", "main"), true)
                    isInMenu = true
                    currentAmmunition = k 
                end
            end
            end
            if isInArea(v1, 1.4) == false and isInMenu and k == currentAmmunition then
                RageUI.Visible(RMenu:Get("vrpgunshops", "main"), false)
                isInMenu = false
                currentAmmunition = nil
            end
        end
        Citizen.Wait(0)
    end
end)


RegisterNetEvent("VRPGUNSHOPS:givewap")
AddEventHandler("VRPGUNSHOPS:givewap", function(hash) 
    GiveWeaponToPed(PlayerPedId(), hash, 250, false, false)
end)

function isInArea(v, dis) 

    if Vdist2(GetEntityCoords(PlayerPedId(-1)), v) < dis then  
        return true
    else 
        return false
    end
end

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end