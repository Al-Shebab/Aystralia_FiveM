local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chatroles")

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
		local user_id = vRP.getUserId({source})
		local player = vRP.getUserSource({user_id})
		if vRP.hasPermission({user_id,"cofounder.chattitle"}) then
			TriggerClientEvent('chatMessage', -1, "^4Co-Founder 💎 ^7| " .. author .. " ^1-> ^0" ..  message)
		elseif vRP.hasPermission({user_id,"owner.chattitle"}) then
			TriggerClientEvent('chatMessage', -1, "^2Developer 🐌 ^7| " .. author .. " ^1-> ^0" ..  message)
		elseif vRP.hasPermission({user_id,"admin.chattitle"}) then
			TriggerClientEvent('chatMessage', -1, "^1Admin 🔥 ^7| " .. author .. " ^1-> ^0" ..  message)
		elseif vRP.hasPermission({user_id,"mod.chattitle"}) then	
			TriggerClientEvent('chatMessage', -1, "^5Moderator 👁️ ^7| " .. author .. " ^1-> ^0" ..  message)
		elseif vRP.hasGroup({user_id,"cop"}) then
			TriggerClientEvent('chatMessage', -1, "^4Cop 👮 ^7| " .. author .. " ^1-> ^0" ..  message)
		elseif vRP.hasGroup({user_id,"ems"}) then
			TriggerClientEvent('chatMessage', -1, "^9EMS 🚑 ^7| " .. author .. " ^1-> ^0" ..  message)
		elseif vRP.hasGroup({user_id,"Firefighter"}) then
			TriggerClientEvent('chatMessage', -1, "^3FIREFIGHTER ^7| " .. author .. " ^1-> ^0" ..  message)
		else
			TriggerClientEvent('chatMessage', -1, "Civilian 🚶‍ | " .. author,  { 128, 128, 128 }, message)
		end
    end

    print(author .. ': ' .. message)
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

	TriggerEvent('chatMessage', source, name, '/' .. command )
	
	local msgs = '	❌	H^2u^3r^4D^5u^6r^7 n^1o^2t^3 a^4 c^5o^6m^7m^1a^2n^3d 🙃'

    if not WasEventCanceled() then
		local user_id = vRP.getUserId({source})
		local player = vRP.getUserSource({user_id})
		if vRP.hasPermission({user_id,"cofounder.chattitle"}) then
			TriggerClientEvent('chatMessage', -1, "^4Co-Founder 💎 ^7| " .. name .. ": ^1" .. '/' .. command .. msgs )
		elseif vRP.hasPermission({user_id,"owner.chattitle"}) then
			TriggerClientEvent('chatMessage', -1, "^2Developer 🐌 ^7| " .. name .. ": ^1" .. '/' .. command .. msgs )
		elseif vRP.hasPermission({user_id,"admin.chattitle"}) then
			TriggerClientEvent('chatMessage', -1, "^1Admin 🔥 ^7| " .. name .. ": ^1" .. '/' .. command .. msgs )
		elseif vRP.hasPermission({user_id,"mod.chattitle"}) then	
			TriggerClientEvent('chatMessage', -1, "^5Moderator 👁️ ^7| " .. name .. ": ^1" .. '/' .. command .. msgs )
		elseif vRP.hasGroup({user_id,"cop"}) then
			TriggerClientEvent('chatMessage', -1, "4Cop 👮 ^7| " .. name .. ": ^4" .. '/' .. command .. msgs )
		elseif vRP.hasGroup({user_id,"ems"}) then
			TriggerClientEvent('chatMessage', -1, "^9EMS 🚑 ^7| " .. name .. ": ^9" .. '/' .. command .. msgs )
		elseif vRP.hasGroup({user_id,"Firefighter"}) then
			TriggerClientEvent('chatMessage', -1, "^3FIREFIGHTER ^7| " .. name .. ": ^3" .. '/' .. command .. msgs )
		else
			TriggerClientEvent('chatMessage', -1, "Civilian 🚶‍ | " .. name, { 128, 128, 128 } .. '/' .. command .. msgs ) 
		end	
    end

    CancelEvent()
end)

--player join messages
AddEventHandler('playerConnecting', function()
    TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) .. ' joined ^2 Greater Sandy RP! 👌 ')
end)

AddEventHandler('playerDropped', function(reason)
    TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) ..' left (' .. reason .. ')')
end)

RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and 'console' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)