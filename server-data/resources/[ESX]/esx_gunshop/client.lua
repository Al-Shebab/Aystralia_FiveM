RMenu.Add('gunshop', 'main', RageUI.CreateMenu("", "~r~Gun Store", 1200, 300, "shopui_title_gunclub", "shopui_title_gunclub"))
RMenu.Add('gunshop', 'knifes', RageUI.CreateSubMenu(RMenu:Get('gunshop', 'main'), "", "~b~Knifes", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub"))
RMenu.Add('gunshop', 'pistols', RageUI.CreateSubMenu(RMenu:Get('gunshop', 'main'), "", "~b~Pistols", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub"))
RMenu.Add('gunshop', 'smgs', RageUI.CreateSubMenu(RMenu:Get('gunshop', 'main'), "", "~b~Submachine Guns", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub"))
RMenu.Add('gunshop', 'shotgun', RageUI.CreateSubMenu(RMenu:Get('gunshop', 'main'), "", "~b~Shotguns", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub"))
RMenu.Add('gunshop', 'ars', RageUI.CreateSubMenu(RMenu:Get('gunshop', 'main'), "", "~b~Assault Rifles", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub"))
RMenu.Add('gunshop', 'sniper', RageUI.CreateSubMenu(RMenu:Get('gunshop', 'main'), "", "~b~Sniper Rifles", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub"))
RMenu.Add('gunshop', 'throw', RageUI.CreateSubMenu(RMenu:Get('gunshop', 'main'), "", "~b~Throwables", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub"))

-- RageUI.CreateWhile(wait, menu, key, closure)
RageUI.CreateWhile(1.0, RMenu:Get('gunshop', 'main'), nil, function()

 -- RageUI.IsVisible(menu, header, glare, instructional, items, panels)
    RageUI.IsVisible(RMenu:Get('gunshop', 'main'), true, false, true, function()
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

RegisterNetEvent('gunshop:menu')
AddEventHandler('gunshop:menu', function()
    RageUI.Visible(RMenu:Get("gunshop", "main"))
    alert('Insufficent funds')
end)

function knifesBtn() 
    RageUI.Button("Knifes" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('gunshop', 'knifes'))
end

function pistolBtn() 
    RageUI.Button("Pistols" , nil, {

        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('gunshop', 'pistols'))
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
    end, RMenu:Get('gunshop', 'smgs'))
end

function shotgunBtn() 
    RageUI.Button("Shotguns" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('gunshop', 'shotgun'))
end

function arsBtn() 
    RageUI.Button("Assault Rifles" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('gunshop', 'ars'))
end

function sniperBtn() 
    RageUI.Button("Sniper Rifles" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('gunshop', 'sniper'))
end

function throwBtn() 
    RageUI.Button("Throwables" , nil, {
        RightLabel = "→→→",
    }, true, function(Hovered, Active, Selected)
        if Selected then
            -- My action the button is selected
        end
    end, RMenu:Get('gunshop', 'throw'))
end

--[[Sub Menus]]

function knifesSM() 
    RageUI.IsVisible(RMenu:Get('gunshop', 'knifes'), true, false, true, function()
        for i , p in pairs(cfg.guns.knifes) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                   TriggerServerEvent('gunshop:buyweapon', p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function pistolSM() 
    RageUI.IsVisible(RMenu:Get('gunshop', 'pistols'), true, false, true, function()
        for i , p in pairs(cfg.guns.pistols) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                   TriggerServerEvent('gunshop:buyweapon', p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function smgsSM() 
    RageUI.IsVisible(RMenu:Get('gunshop', 'smgs'), true, false, true, function()
        for i , p in pairs(cfg.guns.smgs) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("gunshop:buyweapon",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function shotgunSM() 
    RageUI.IsVisible(RMenu:Get('gunshop', 'shotgun'), true, false, true, function()
        for i , p in pairs(cfg.guns.shotguns) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("gunshop:buyweapon",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function arsSM() 
    RageUI.IsVisible(RMenu:Get('gunshop', 'ars'), true, false, true, function()
        for i , p in pairs(cfg.guns.ars) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("gunshop:buyweapon",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function sniperSM() 
    RageUI.IsVisible(RMenu:Get('gunshop', 'sniper'), true, false, true, function()
        for i , p in pairs(cfg.guns.sniper) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("gunshop:buyweapon",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

function throwSM() 
    RageUI.IsVisible(RMenu:Get('gunshop', 'throw'), true, false, true, function()
        for i , p in pairs(cfg.guns.throw) do 
            RageUI.Button(p.name , nil, {
                RightLabel = cfg.currency..tostring(p.price)
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("gunshop:buyweapon",p.price, p.hash)
                end
            end)
        end
        end, function()
    end)
end

for k,v in pairs(cfg.gunshops) do 
    local px,py,pz,ph = table.unpack(v.ped)
    local model = -1643617475
    local v2 = vector3(px,py,pz)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    ped = CreatePed(5, model, v2, ph, true, false)
    SetEntityInvincible(ped, true)
    SetEntityCanBeDamaged(ped, false)
    SetPedCanRagdoll(GetPlayerPed(-1), false)
end

isInMenu = false
currentAmmunition = nil
Citizen.CreateThread(function() 
    while true do
        for k, v in pairs(cfg.gunshops) do 
            local x,y,z = table.unpack(v.marker)
            local v1 = vector3(x,y,z)
            if cfg.blipsenabled then 
                local temp2 = AddBlipForCoord(x,y,z)
                SetBlipSprite(temp2, 154)
                SetBlipColour(temp2, 3)
            end
            if isInArea(v1, 100.0) then 
                DrawMarker(25, v1.x,v1.y,v1.z - 0.999999, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 2.5, 255, 0, 0, 150, 0, 0, 2, 0, 0, 0, false)
            end
            if isInMenu == false then
            if isInArea(v1, 1.4) then 
                alert('Press ~INPUT_VEH_HORN~ to buy weapons')
                if IsControlJustPressed(0, 51) then 
                    currentAmmunition = k
                    RageUI.Visible(RMenu:Get("gunshop", "main"), true)
                    isInMenu = true
                    currentAmmunition = k 
                end
            end
            end
            if isInArea(v1, 1.4) == false and isInMenu and k == currentAmmunition then
                RageUI.Visible(RMenu:Get("gunshop", "main"), false)
                isInMenu = false
                currentAmmunition = nil
            end
        end
        Citizen.Wait(0)
    end
end)


RegisterNetEvent("gunshop:giveweapon")
AddEventHandler("gunshop:giveweapon", function(hash) 
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