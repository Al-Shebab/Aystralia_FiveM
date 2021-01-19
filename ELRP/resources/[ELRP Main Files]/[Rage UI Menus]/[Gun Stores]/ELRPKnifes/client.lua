RMenu.Add('vrpgunshops', 'main', RageUI.CreateMenu("", "~b~Ammunition", nil, nil, "knifestore", "knifestore"))
RMenu.Add('vrpgunshops', 'knifes', RageUI.CreateSubMenu(RMenu:Get('vrpgunshops', 'main'), "", "~b~Knifes", nil, nil, "knifestore", "knifestore"))

-- RageUI.CreateWhile(wait, menu, key, closure)
RageUI.CreateWhile(1.0, RMenu:Get('vrpgunshops', 'main'), nil, function()

 -- RageUI.IsVisible(menu, header, glare, instructional, items, panels)
    RageUI.IsVisible(RMenu:Get('vrpgunshops', 'main'), true, false, true, function()
        knifesBtn()
     
    end, function()
        ---Panels
    end)
    knifesSM()
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