local coordonate = {
  {-279.86331176758,-1625.3310546875,31.848825454712}, -- [COLLECTING]

}

Citizen.CreateThread(function ()--
while true do
  Wait(1)
  local ped = GetPlayerPed(-1)
      local coords = GetEntityCoords(ped)
      for k,v in pairs (coordonate) do
          local distanta = GetDistanceBetweenCoords(coords.x, coords.y, coords.z,v[1],v[2],v[3] , true)
          if distanta < 15 then
              DrawMarker(20, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 147,147,147, 100, 0, 0, 0, 1, 0, 0, 0)
              if distanta < 2 then
                  text("~g~Press ~INPUT_CONTEXT~ to claim ~r~ketamine")
                  if IsControlJustPressed(0,38) then
                    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
                      TriggerServerEvent('uwu:ketamine1')
                      Wait(15000)
                      ClearPedTasks(ped)
                      TriggerServerEvent('uwu:ketamine1')
                  end
              end
          end
      end
end
end)

function text(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local plm = {
  {90.988441467285,6361.8251953125,31.225801467896}, -- [SELLING]

}

Citizen.CreateThread(function()
  while true do 
    Wait(0)
    local ped = GetPlayerPed(-1)
      local coordonateVINDE = GetEntityCoords(ped)
      for k,v in pairs (plm) do
        local distantaVINDE = GetDistanceBetweenCoords(coordonateVINDE.x, coordonateVINDE.y, coordonateVINDE.z, v[1], v[2], v[3],true)
         if distantaVINDE < 2 then
          text("~g~Press ~INPUT_CONTEXT~ to sell ~r~ketamine")
          if IsControlJustPressed(0,38) then
            TriggerServerEvent('uwu:ketamine')
          
          end
        end
      end
    end
end)