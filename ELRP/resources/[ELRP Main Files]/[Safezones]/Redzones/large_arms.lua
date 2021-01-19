local blips = {

    {title="Large Arms", colour=49, id=378, x = -1821.35, y = 2971.17, z = 32.81},
    }
    Citizen.CreateThread(function()
    
            Citizen.Wait(0)
    
    local bool = true
      
      if bool then
            
            for k,v in pairs(blips) do
               
    
                   zoneblip = AddBlipForRadius(v.x,v.y,v.z, 86.0)
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
