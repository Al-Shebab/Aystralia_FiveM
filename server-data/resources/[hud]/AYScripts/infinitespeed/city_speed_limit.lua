local blips = {

    {title="City Speed Limit", colour=62, id=378, x = 291.50555419922, y = -857.20031738281, z = 29.216951370239},
    }
    Citizen.CreateThread(function()
    
            Citizen.Wait(0)
    
    local bool = true
      
      if bool then
            
            for k,v in pairs(blips) do
               
    
                   zoneblip = AddBlipForRadius(v.x,v.y,v.z, 300.0)
                              SetBlipSprite(zoneblip,4 * 3.14159)
                              SetBlipColour(zoneblip,62)
                              SetBlipAlpha(zoneblip,0)
                             
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
