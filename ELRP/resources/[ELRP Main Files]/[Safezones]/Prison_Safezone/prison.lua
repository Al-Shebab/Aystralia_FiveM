local blips = {

    {title="Prison", colour=2, id=60, x = 1738.4659423828, y = 2604.6096191406, z = 46.676712036133},
    }
    Citizen.CreateThread(function()
    
            Citizen.Wait(0)
    
    local bool = true
      
      if bool then
            
            for k,v in pairs(blips) do
               
    
                   zoneblip = AddBlipForRadius(v.x,v.y,v.z, 125.0)
                              SetBlipSprite(zoneblip,4 * 3.14159)
                              SetBlipColour(zoneblip,57)
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