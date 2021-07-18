ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:on')
AddEventHandler('duty:on', function(job)
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

RegisterServerEvent('duty:off')
AddEventHandler('duty:off', function(job)
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




