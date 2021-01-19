local staff = "1"

function sendWebhookMessage(staff,message)
	if staff ~= "none" then
		PerformHttpRequest(staff, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


local staffon = {}
local staffperm = "admin.tickets"




RegisterCommand('staffon',function(source)
    local user_id = vRP.getUserId(source)
    if not vRP.hasPermission(user_id,staffperm) then return end
    if staffon[source] == nil then
        vRPclient.getPosition(source,{},function(x,y,z)
            staffon[source] = vector3(x,y,z)
            vRPclient.notify(source,{"You entered in staff mode"})   
sendWebhookMessage(staff," User ID " .. user_id .." Used /Staffon ")			
            TriggerClientEvent("CMG:OMioDioMode", source,true)
        end)
    else
        vRPclient.notify(source,{"You're already on duty"})
    end
end)

RegisterCommand('staffoff',function(source)
    local user_id = vRP.getUserId(source)
    if not vRP.hasPermission(user_id,staffperm) then return end
    if staffon[source] ~= nil then
        vRPclient.setPosition(source,{table.unpack(staffon[source])})
        vRPclient.notify('You left the staff mode')
		sendWebhookMessage(staff," User ID " .. user_id .." Used /Staffoff ")	
        TriggerClientEvent("CMG:OMioDioMode", source,false)
		staffon[source] = nil
    else
        vRPclient.notify(source,{"You're not on staff mode"})
    end
end)