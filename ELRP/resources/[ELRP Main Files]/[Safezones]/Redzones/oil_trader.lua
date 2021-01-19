local blips = {

    {title="Oil Trader", colour=49, id=378, x = -2077.3427734375, y = -1020.6162719727, z = 15.988883972168},
    }
    Citizen.CreateThread(function()
    
            Citizen.Wait(0)
    
    local bool = true
      
      if bool then
            
            for k,v in pairs(blips) do
               
    
                   zoneblip = AddBlipForRadius(v.x,v.y,v.z, 110.0)
                              SetBlipSprite(zoneblip,4 * 3.14159)
                              SetBlipColour(zoneblip,49)
                              SetBlipAlpha(zoneblip,75)
                             
            end
             
        
             for _, info in pairs(blips) do
            
                 info.blip = AddBlipForCoord(info.x, info.y, info.z)
                             SetBlipSprite(info.blip, info.id)
                             SetBlipDisplay(info.blip, 1)
                             SetBlipColour(info.blip, info.colour)
                             SetBlipAsShortRange(info.blip, true)
                             BeginTextCommandSetBlipName("STRING")
                             AddTextComponentString(info.title)
                             EndTextCommandSetBlipName(info.blip)
             end
           
           bool = false
       
       end
    end)
