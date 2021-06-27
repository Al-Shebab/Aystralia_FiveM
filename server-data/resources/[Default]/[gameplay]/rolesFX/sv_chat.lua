--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE



local owner = {"steam:11000010c5272ea","ip:",}
local comm = {"steam:","ip:",}
local servermanager = {"steam:","ip:",}
local staffmanager = {"steam:","ip:",}
local dev = {"steam:110000115362d5f","ip:",}
---------------------------------------
local Sheriff = {"steam:","ip:",}
local Moderator = {"steam:","ip:",}
local StateTroopers = {"steam:","ip:",}
local Test = {"steam:","ip:",}

AddEventHandler('chatMessage', function(Source, Name, Msg)
    args = stringsplit(Msg, " ")
    CancelEvent()
    if string.find(args[1], "/") then
        local cmd = args[1]
        table.remove(args, 1)
    else     
        local player = GetPlayerIdentifiers(Source)[1]
        if has_value(owner, player) then
            TriggerClientEvent('chatMessage', -1, "Owner | " .. Name, { 255, 0, 0 }, Msg)           
        elseif has_value(comm, player) then
            TriggerClientEvent('chatMessage', -1, "Community Manager | " .. Name, { 255, 72, 72 }, Msg)
        elseif has_value(servermanager, player) then
            TriggerClientEvent('chatMessage', -1, "Server Manager | " .. Name, { 255, 89, 89 }, Msg)
        elseif has_value(staffmanager, player) then
            TriggerClientEvent('chatMessage', -1, "Staff Manager | " .. Name, { 255, 101, 101 }, Msg)
        elseif has_value(dev, player) then
            TriggerClientEvent('chatMessage', -1, "Developer | " .. Name, { 255, 152, 152 }, Msg)
        elseif has_value(Sheriff, player) then
            TriggerClientEvent('chatMessage', -1, "Sheriff's Department | " .. Name, { 0, 0, 255 }, Msg)
	    elseif has_value(Moderator, player) then
            TriggerClientEvent('chatMessage', -1, "Moderator | " .. Name, { 0, 255, 247 }, Msg)
        elseif has_value(StateTroopers, player) then
            TriggerClientEvent('chatMessage', -1, "State Troopers | " .. Name, { 222, 0, 255 }, Msg)
		elseif has_value(Test, player) then
            TriggerClientEvent('chatMessage', -1, "State Troopers | Admin " .. Name, { 222, 0, 255 }, Msg)
		elseif has_value(ScriptCreator, player) then
            TriggerClientEvent('chatMessage', -1, "Chat Roles Creator | " .. Name, { 0, 255, 43 }, Msg)
        else
            TriggerClientEvent('chatMessage', -1, "Civilian | " .. Name, { 235, 214, 51 }, Msg)
        end
            
    end
end)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

---ALLOWS YOU TO CHECK VERSIONS IN GAME

AddEventHandler('chatMessage', function(source, name, msg)
  if msg:sub(1, 1) == "/" then
    sm = stringsplit(msg, " ");
	   if sm[1] == "/fversion" then
		     CancelEvent()
	TriggerClientEvent('chatMessage', source, "^0[^1RolesFX Script Version Check^0]", {30, 144, 255}, " ^2Version 1.1.0 | RolesFX By Jay Gatsby!^0 ) " .. string.sub(msg,11))
     end
  end

end)

---PRINTS THIS CODE BELOW TO THE CONSOLE 

print('Jays Roles FX has loaded in to the server! Type in chat to test it out!')

--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
