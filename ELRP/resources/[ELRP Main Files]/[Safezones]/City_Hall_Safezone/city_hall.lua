local blips = {

    {title="City Hall", colour=2, id=60, x = -539.84484863281, y = -213.07205200195, z = 37.649799346924},
    }
    Citizen.CreateThread(function()
    
            Citizen.Wait(0)
    
    local bool = true
      
      if bool then
            
            for k,v in pairs(blips) do
               
    
                   zoneblip = AddBlipForRadius(v.x,v.y,v.z, 52.0)
                              SetBlipSprite(zoneblip,4 * 3.14159)
                              SetBlipColour(zoneblip,69)
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