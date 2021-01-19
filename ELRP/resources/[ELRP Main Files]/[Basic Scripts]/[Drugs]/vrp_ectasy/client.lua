local coordonate = {

  {-1076.4598388672,-88.922103881836,42.409366607666},
}

Citizen.CreateThread(function ()--
while true do
  Wait(1)
  local ped = GetPlayerPed(-1)
      local coords = GetEntityCoords(ped)
      for k,v in pairs (coordonate) do
          local distanta = GetDistanceBetweenCoords(coords.x, coords.y, coords.z,v[1],v[2],v[3] , true)
          if distanta < 15 then
              DrawMarker(21, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 147,147,147, 100, 0, 0, 0, 3, 0, 0, 0)
              if distanta < 2 then
                  text("~p~Press ~INPUT_CONTEXT~ to claim ~r~opium")
                  if IsControlJustPressed(0,38) then
                    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
                      TriggerServerEvent('uwu:opium1')
                      Wait(12000)
                      ClearPedTasks(ped)
                      TriggerServerEvent('uwu:opium1')
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
  {-232.61666870117,-2663.3684082031,5.0002908706665},

}

Citizen.CreateThread(function()
  while true do 
    Wait(0)
    local ped = GetPlayerPed(-1)
      local coordonateVINDE = GetEntityCoords(ped)
      for k,v in pairs (plm) do
        local distantaVINDE = GetDistanceBetweenCoords(coordonateVINDE.x, coordonateVINDE.y, coordonateVINDE.z, v[1], v[2], v[3],true)
         if distantaVINDE < 2 then
          text("~p~Press ~INPUT_CONTEXT~ to sell ~r~opium")
          if IsControlJustPressed(0,38) then
            TriggerServerEvent('uwu:opium')
          
          end
        end
      end
    end
end)