local isBWVOn = false
local isShowingAxon = false
local isShowingReveal = false

RegisterCommand("bwv", function(source, args, rawCommand)

        local ped = PlayerPedId()

        while ( not HasAnimDictLoaded( "random@arrests" ) ) do
            RequestAnimDict( "random@arrests" )
            Citizen.Wait( 0 )
        end

        if isBWVOn then
            StopRecordingAndSaveClip()
            TriggerServerEvent('IFS:BWVPlay_SV', 2.0, Config.Model .. '_out')
        else
            StartRecording(1)
            TriggerServerEvent('IFS:BWVPlay_SV', 2.0, Config.Model .. '_in')
        end

        isBWVOn = not isBWVOn

        ClearPedTasks(ped)
        TaskPlayAnim(ped, "random@arrests", "generic_radio_enter", 8.0, 2.0, 1000, 50, 2.0, 0, 0, 0 )

end,false)


RegisterNetEvent('IFS:PlaySound')
AddEventHandler('IFS:PlaySound', function(player, maxDistance, soundFile)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = Config.soundVolume
        })
    end
end)

Citizen.CreateThread(function()
    while true do

        if GetFollowPedCamViewMode() == 4 then

            if isBWVOn then
                local year, month, day, hour, minute, second = GetLocalTime()

                if month < 10 then

                    month = "0" .. month

                end

                if day < 10 then

                    day = "0" .. day

                end

                if not isShowingAxon and Config.Model == 'axon' then
                    SendNUIMessage({
                        transactionType     = 'showAxon',
                        show     = true,
                        timestamp = year .. '-0' .. month .. '-' .. day .. ' ' .. 'T' .. hour .. ':' .. minute .. ':' .. second,
                    })
                    isShowingAxon = true
                end

                if not isShowingReveal and Config.Model == 'reveal' then
                    SendNUIMessage({
                        transactionType     = 'showReveal',
                        show     = true,
                        timestamp = year .. '/' .. month .. '/' .. day .. ' ' .. hour .. ':' .. minute .. ':' .. second,
                    })
                    isShowingReveal = true
                end

                if Config.Model == 'axon' then
                    SendNUIMessage({
                        transactionType     = 'updateTime',
                        timestamp = year .. '-' .. month .. '-' .. day .. ' ' .. 'T' .. hour .. ':' .. minute .. ':' .. second,
                    })
                else
                    SendNUIMessage({
                        transactionType     = 'updateTime',
                        timestamp = year .. '/' .. month .. '/' .. day .. ' ' .. hour .. ':' .. minute .. ':' .. second,
                    })
                end
            else
                if isShowingAxon and Config.Model == 'axon' then
                    SendNUIMessage({
                        transactionType     = 'showAxon',
                        show     = false,
                    })
                    isShowingAxon = false
                end

                if isShowingReveal and Config.Model == 'reveal' then
                    SendNUIMessage({
                        transactionType     = 'showReveal',
                        show     = false,
                    })
                    isShowingReveal = false
                end
            end
                
        else

            if isShowingAxon and Config.Model == 'axon' then
                SendNUIMessage({
                    transactionType     = 'showAxon',
                    show     = false,
                })
                isShowingAxon = false
            end

            if isShowingReveal and Config.Model == 'reveal' then
                SendNUIMessage({
                    transactionType     = 'showReveal',
                    show     = false,
                })
                isShowingReveal = false
            end

        end



    Citizen.Wait(100)
    end
end)