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



local owner = {"steam:11000010c5272ea","ip:",} -- Al Shebab
local comm = {"steam:","ip:",} 
local servermanager = {"steam:","ip:",}
local staffmanager = {"steam:","ip:",}
local dev = {"steam:110000115362d5f","ip:",} -- Mailar
local sadmin = {"steam:","ip:",}
local admin = {"steam:","ip:",}
local smod = {"steam:","ip:",}
local mod = {"steam:","ip:",}
local tmod = {"steam:","ip:",}

---------------------------------------

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
        elseif has_value(sadmin, player) then
            TriggerClientEvent('chatMessage', -1, "Senior Administrator | " .. Name, { 255, 180, 0 }, Msg)
	    elseif has_value(admin, player) then
            TriggerClientEvent('chatMessage', -1, "Administator | " .. Name, { 0, 255, 247 }, Msg)
        elseif has_value(smod, player) then
            TriggerClientEvent('chatMessage', -1, "Senior Moderator | " .. Name, { 148, 255, 87 }, Msg)
		elseif has_value(mod, player) then
            TriggerClientEvent('chatMessage', -1, "Moderator | " .. Name, { 74, 255, 121 }, Msg)
		elseif has_value(tmod, player) then
            TriggerClientEvent('chatMessage', -1, "Trial Moderator | " .. Name, { 24, 249, 255 }, Msg)
        else
            TriggerClientEvent('chatMessage', -1, "Member | " .. Name, { 93, 24, 255 }, Msg)
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

print('^8Aystralia Chat Permissions working!')