local markers = { 
{308.78799438477,-592.63098144531,43.283977508545},
{1828.8068847656,3685.703125,34.271068572998},
}

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(0)
        for k, v in pairs(markers) do 
            local v1 = vector3(table.unpack(v))
            DrawMarker(20, v1.x,v1.y,v1.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.5, 51, 255, 255, 80, 0, 0, 2, 0, 0, 0, false)
            if Vdist2(GetEntityCoords(PlayerPedId()), v1) <= 1.4 then 
                alert('Recieve medical treatment ~INPUT_VEH_HORN~') -- ~INPUT_VEH_HORN~ = [E]
                if IsControlJustPressed(0, 51) then 
                    SetEntityHealth(PlayerPedId(), 200)
                    notify('~g~You have been healed.')
                end
            end
        end
    end
end)

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
  end