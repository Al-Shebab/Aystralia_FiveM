ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty2:on')
AddEventHandler('duty2:on', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade

    if job == Config.JobOffDuty then
        xPlayer.setJob(Config.Job, grade)
        TriggerClientEvent("esx:showNotification", source, Config.OnDutyMessage)
    else
        TriggerClientEvent("esx:showNotification", source, Config.AlreadyOnDuty)
    end
end)

RegisterServerEvent('duty2:off')
AddEventHandler('duty2:off', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    
    if job == Config.Job then
        xPlayer.setJob(Config.JobOffDuty, grade)
        TriggerClientEvent("esx:showNotification", source, Config.OffDutyMessage)
    else
        TriggerClientEvent("esx:showNotification", source, Config.AlreadyOffDuty)
    end
end)




