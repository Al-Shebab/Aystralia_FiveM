local cfg = {}

--[[
Developed by Leo SHK
Version 1.1

cmd - chat call command
display - visual display in the chat
anonymous - invisible nickname (true or false)
userdb - true show firstname and lastname from database, false show steam/fivem nickname
permission - create permission and insert to group in vrp/cfg/group.lua
]]--

--standard chat, for users who do not have groups (permission)
cfg.chatuserdefault = {display = "[Citizen]", userdb = true, r = 239, g = 229, b = 255}

cfg.chatcmd = {
  {cmd = "/twitter", display= "@twitter | ", anonymous = false, userdb = true, permission ="player.phone", r =  7, g = 206, b = 246},
  {cmd = "/anon", display= "Anonymous | ", anonymous = true, userdb = false, permission = "player.phone", r =  129, g = 154, b = 151},
  {cmd = "/ooc", display= "OOC | ", anonymous = true, userdb = true, permission = "player.phone", r =  129, g = 154, b = 151},
  {cmd = "//", display= "OOC | ", anonymous = true, userdb = true, permission = "player.phone", r =  129, g = 154, b = 151},
}

cfg.chatgroups = {
  {display = "[Owner]", userdb = true, permission = "chatrules.owner", r = 255, g = 0, b = 0 },  
}

cfg.ad = {
  {display = "[Information]", text = "Join our Discord! https://discord.gg/hWN7zXtbQP", r = 255, g = 255, b = 255},

}

return cfg
