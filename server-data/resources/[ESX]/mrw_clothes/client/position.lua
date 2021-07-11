-- Author : Morow 
-- GitHub : https://github.com/Morow73
-- No Edit, No Sell !!!!!!! 

local isInZone, isInZoneJob = false, false

position = {

    {72.254, -1399.102, 29.376},
    {-703.776, -152.258, 37.415},
    {-167.863, -298.969, 39.733},
    {428.694, -800.106, 29.491},
    {-829.413,-1073.710, 11.328},
    {-1447.797, -242.461, 49.820},
    {11.632, 6514.224, 30.877},
    {123.646, -219.440, 54.557},
    {1696.291, 4829.312, 42.063},
    {618.093, 2759.629, 42.088},
    {1190.550, 2713.441, 38.222},
    {-1193.429, -772.262, 17.324},
    {-3172.496, 1048.133, 10.863},
    {-1108.441, 2708.923, 19.107},

}

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        for _,v in pairs(position) do 
            if Vdist(GetEntityCoords(PlayerPedId()), v[1], v[2], v[3]) < 20.0 then 
               DrawMarker(20, v[1], v[2], v[3], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.1, 255, 0, 0, 200, false, true, 2, false, false, false, false)
               isInZoneJob = true
            end          
        end    
    end    
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)

        for _,v in pairs(position) do
            if Vdist(GetEntityCoords(PlayerPedId()), v[1], v[2], v[3]) < 1.5 then 
                isInZone = true  
            else 
                distance = false      
            end   
        end

        if isInZone then         
            BeginTextCommandDisplayHelp("STRING")
            AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to access the clothes shop")
            EndTextCommandDisplayHelp(0, 0, 1, -1)

            if IsControlJustPressed(0, 38) then 
                if not RageUI.Visible() then 
                   GetComponent()
                   RageUI.Visible(RMenu:Get('mrw_clothes', 'Clothe Shop'), true)  
                   MenuOpen = true 
                end
            end 

            isInZone = false    
            distance = true
        else
            if RageUI.Visible(RMenu:Get('mrw_clothes', 'Clothe Shop')) then
                RageUI.Visible(RMenu:Get('mrw_clothes', 'Clothe Shop'), false) 
            end	
            if RageUI.Visible(RMenu:Get('mrw_clothes', 'Shirts')) then
                RageUI.Visible(RMenu:Get('mrw_clothes', 'Shirts'), false) 
            end	
            if RageUI.Visible(RMenu:Get('mrw_clothes', 'Suits')) then
                RageUI.Visible(RMenu:Get('mrw_clothes', 'Suits'), false) 
            end	
            if RageUI.Visible(RMenu:Get('mrw_clothes', 'Branding')) then
                RageUI.Visible(RMenu:Get('mrw_clothes', 'Branding'), false) 
            end	
            if RageUI.Visible(RMenu:Get('mrw_clothes', 'Arms')) then
                RageUI.Visible(RMenu:Get('mrw_clothes', 'Arms'), false) 
            end
            if RageUI.Visible(RMenu:Get('mrw_clothes', 'Chains')) then
                RageUI.Visible(RMenu:Get('mrw_clothes', 'Chains'), false) 
            end	
            if RageUI.Visible(RMenu:Get('mrw_clothes', 'Backpacks')) then
                RageUI.Visible(RMenu:Get('mrw_clothes', 'Backpacks'), false) 
            end	
            if RageUI.Visible(RMenu:Get('mrw_clothes', 'Pants')) then
                RageUI.Visible(RMenu:Get('mrw_clothes', 'Pants'), false) 
            end	
            if RageUI.Visible(RMenu:Get('mrw_clothes', 'Shoes')) then
                RageUI.Visible(RMenu:Get('mrw_clothes', 'Shoes'), false) 
            end		
        end
    end 
end)


Citizen.CreateThread(function()
    for _,v in pairs(position) do

        local blip = AddBlipForCoord(v[1], v[2], v[3])

        SetBlipSprite (blip, 73)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.6)
        SetBlipColour (blip, 7)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Boutique de vétement')
        EndTextCommandSetBlipName(blip)
    end    
end)


