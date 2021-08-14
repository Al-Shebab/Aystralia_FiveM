
RegisterNetEvent('IFS:BWVPlay_SV')
AddEventHandler('IFS:BWVPlay_SV', function(max, sound)
    local player = source
    TriggerClientEvent('IFS:PlaySound', -1, player, max, sound)
end)
