RMenu.Add('vrpgunshops', 'main', RageUI.CreateMenu("", "~b~SCO Armoury", nil, nil, "scoarmoury", "scoarmoury"))
RMenu.Add('vrpgunshops', 'shotgun', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Shotgun", nil, nil, "scoarmoury", "scoarmoury"))
RMenu.Add('vrpgunshops', 'assault', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Assault", nil, nil, "scoarmoury", "scoarmoury"))
RMenu.Add('vrpgunshops', 'armour', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Armour", nil, nil, "scoarmoury", "scoarmoury"))

-- RageUI.CreateWhile(wait, menu, key, closure)
RageUI.CreateWhile(1.0, RMenu:Get('vrpgunshops', 'main'), nil, function()

 -- RageUI.IsVisible(menu, header, glare, instructional, items, panels)
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'main'), true, false, true, function()
        shotgunBtn()
        assaultBtn()
        armourBtn()
     
    end, function()
        ---Panels
    end)
    shotgunSM()
    assaultSM()
    armourSM()
end)

RegisterNetEvent('VRPGUNSHOPS:menu')
AddEventHandler('VRPGUNSHOPS:menu', function()
    RageUI.Visible(RMenu:Get("vrpgunshops", "main"))
    alert('Insufficent funds')
end)

function shotgunBtn() 
    RageUI.Button("Shotgun" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('vrpgunshops', 'shotgun'))
end

function assaultBtn() 
    RageUI.Button("Assault" , nil, {

        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('vrpgunshops', 'assault'))
end

function armourBtn() 
    RageUI.Button("Armour" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('vrpgunshops', 'armour'))
end
--[[Sub Menus]]

function shotgunSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'shotgun'), true, false, true, function()
        for i , p in pairs(cfg.guns.shotgun) do 
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

function assaultSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'assault'), true, false, true, function()
        for i , p in pairs(cfg.guns.assault) do 
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

function armourSM() 
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'armour'), true, false, true, function()
        for i , p in pairs(cfg.guns.armour) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                   TriggerServerEvent('VRPGUNSHOPS:buyarmour', p.price)
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

RegisterNetEvent("VRPGUNSHOPS:givearmour")
AddEventHandler("VRPGUNSHOPS:givearmour", function(hash) 
    SetPedArmour(PlayerPedId(), 100)
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