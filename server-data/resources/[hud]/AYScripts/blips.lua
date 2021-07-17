--Modded Locations have a colour ID of 3 (Blue)

 local blips = {
   {title="City Hall", colour=29, id=590, x = -551.79, y = -192.37, z = 38.29},
   {title="Han's Garage", colour=29, id=590, x = -67.41, y = 123.9, z = 122.05},
   {title="Splits Side", colour=29, id=590, x = -436.44, y = 274.72, z = 97.2},
   {title="Offroad Vehicles", colour=29, id=590, x = -442.52, y = -2178.19, z = 38.29},
   {title="Cocaine Processing", colour=29, id=590, x = 1138.12, y = -990.97, z = 51},
   {title="Motorcycle Dealer", colour=29, id=590, x = 1224.28, y = 2733.53, z = 38.29},
 }
     
Citizen.CreateThread(function()
   for _, info in pairs(blips) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, 0.9)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
end)