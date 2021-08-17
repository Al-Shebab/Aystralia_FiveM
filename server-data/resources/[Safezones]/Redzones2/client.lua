local isMeldingVerstuurd = false -- Puts isMeldingVerstuurd to false
local leaveMessage = 5000 -- Amount of miliseconds to show the "You just left the redzone", you can change this to your liking
local isLeaveMessagePresent = false -- The "You just left the redzone"


Redzones = { -- Add more zones in here. Do not forget the comma!
    ["H Farm"] = { Coords = vector3(3522,3729,35), Radius3 = 200.0 },
  }



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = GetEntityCoords(GetPlayerPed(-1))
        for zoneTitel, zoneData in pairs(Redzones) do
            DrawMarker(28, zoneData.Coords.x, zoneData.Coords.y, zoneData.Coords.z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, --[[scalex]]zoneData.Radius3, --[[scaley]]zoneData.Radius3, --[[scalez]]zoneData.Radius3, 255, 0, 0, 0,0,0,0,0,0)
            if Vdist(zoneData.Coords, ped) < zoneData.Radius3 then
                DrawTextOnScreen("YOU ARE IN A REDZONE", 0.77, 0.95, 255, 0, 0, 200, 0.8, 7)
            elseif Vdist(zoneData.Coords, ped) < zoneData.Radius3 + 200 then
                DrawTextOnScreen("ENTERING REDZONE", 0.8, 0.95, 255, 0, 0, 200, 0.8, 7)
            end
        end
    end
end)

Citizen.CreateThread(function() -- Adds the blips
    for zoneTitel, zoneData in pairs(Redzones) do
      local RedzoneBlip = AddBlipForRadius(zoneData.Coords, zoneData.Radius3)
      SetBlipColour(RedzoneBlip, 1)
      SetBlipAlpha(RedzoneBlip, 100)
    end
  end)

  function DrawTextOnScreen(text, x, y, r, g, b, a, s, font)
    SetTextColour(r, g, b, a)   -- Color
    SetTextFont(font)                      -- Font
    SetTextScale(s, s)              -- Scale
    --SetTextWrap(0.0, 1.0)               -- Wrap the text
    SetTextCentre(false)                -- Align to center(?)
    SetTextDropshadow(0, 0, 0, 0, 255)  -- Shadow. Distance, R, G, B, Alpha.
    --SetTextEdge(50, 0, 0, 0, 255)       -- Edge. Width, R, G, B, Alpha.
    SetTextOutline()                    -- Necessary to give it an outline.
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)               -- Position
end