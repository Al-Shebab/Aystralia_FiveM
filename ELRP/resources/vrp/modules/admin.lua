local htmlEntities = module("lib/htmlEntities")
local Tools = module("lib/Tools")

-- this module define some admin menu functions

local player_lists = {}

local function ch_list(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.list") then
    if player_lists[player] then -- hide
      player_lists[player] = nil
      vRPclient.removeDiv(player,{"user_list"})
    else -- show
      local content = ""
      local count = 0
      for k,v in pairs(vRP.rusers) do
        count = count+1
        local source = vRP.getUserSource(k)
        vRP.getUserIdentity(k, function(identity)
          if source ~= nil then
            content = content.."<br />"..k.." => <span class=\"pseudo\">"..vRP.getPlayerName(source).."</span> <span class=\"endpoint\">"..vRP.getPlayerEndpoint(source).."</span>"
            if identity then
              content = content.." <span class=\"name\">"..htmlEntities.encode(identity.firstname).." "..htmlEntities.encode(identity.name).."</span> <span class=\"reg\">"..identity.registration.."</span> <span class=\"phone\">"..identity.phone.."</span>"
            end
          end

          -- check end
          count = count-1
          if count == 0 then
            player_lists[player] = true
            local css = [[
.div_user_list{ 
  margin: auto; 
  padding: 8px; 
  width: 650px; 
  margin-top: 80px; 
  background: black; 
  color: white; 
  font-weight: bold; 
  font-size: 1.1em;
} 

.div_user_list .pseudo{ 
  color: rgb(0,255,125);
}

.div_user_list .endpoint{ 
  color: rgb(255,0,0);
}

.div_user_list .name{ 
  color: #309eff;
}

.div_user_list .reg{ 
  color: rgb(0,125,255);
}
              
.div_user_list .phone{ 
  color: rgb(211, 0, 255);
}
            ]]
            vRPclient.setDiv(player,{"user_list", css, content})
          end
        end)
      end
    end
  end
end

local function ch_whitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.whitelist") then
    vRP.prompt(player,"User id to whitelist: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,true)
      vRPclient.notify(player,{"whitelisted user "..id})
    end)
  end
end

local function ch_unwhitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unwhitelist") then
    vRP.prompt(player,"User id to un-whitelist: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,false)
      vRPclient.notify(player,{"un-whitelisted user "..id})
    end)
  end
end

local function ch_addgroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add") then
    vRP.prompt(player,"User id: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Group to add: ","",function(player,group)
	if group == superadmin and not vRP.hasPermission(user_id,"player.group.add.superadmin") then
	  do return end
	end
	if group == admin and not vRP.hasPermission(user_id,"player.group.add.admin") then
	  do return end
	end  		  
	vRP.addUserGroup(id,group)
	vRPclient.notify(player,{group.." added to user "..id})
      end)
    end)
  end
end

local function ch_removegroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove") then
    vRP.prompt(player,"User id: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Group to remove: ","",function(player,group)
        vRP.removeUserGroup(id,group)
        vRPclient.notify(player,{group.." removed from user "..id})
      end)
    end)
  end
end

local function ch_kick(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.kick") then
    vRP.prompt(player,"User id to kick: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          saveKickLog(id,GetPlayerName(player),reason)
          vRP.kick(source,reason)
          vRPclient.notify(player,{"kicked user "..id})
        end
      end)
    end)
  end
end

local function ch_ban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.ban") then
    vRP.prompt(player,"User id to ban: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
	  vRP.prompt(player,"Hours: ","",function(player,duration)
	    if tonumber(duration) then
	      vRPclient.notify(player,{"banned user "..id})
	      saveBanLog(id,GetPlayerName(player),reason,duration)
	      vRP.ban(source,reason)
    	    else
		vRPclient.notify(player,{"~r~Invalid ban time!"})
            end
	end)
      end)
    end)
  end
end

local function ch_unban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRP.prompt(player,"User id to unban: ","",function(player,id)
      id = parseInt(id)
      vRP.setBanned(id,false)
      vRPclient.notify(player,{"un-banned user "..id})
    end)
  end
end

local function ch_revive_stn(player,choice) -- Admin Revive By Sul6an
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Revive:","",function(player,user_id) 
	  	vRPclient.varyHealth(user_id, {200})
    end)
  end
end



local function ch_coords(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"Copy the coordinates using Ctrl-A Ctrl-C",x..","..y..","..z,function(player,choice) end)
  end)
end

local function ch_tptome(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"User id:","",function(player,user_id) 
      local tplayer = vRP.getUserSource(tonumber(user_id))
      if tplayer ~= nil then
        vRPclient.teleport(tplayer,{x,y,z})
      end
    end)
  end)
end

local function ch_tpto(player,choice)
  vRP.prompt(player,"User id:","",function(player,user_id) 
    local tplayer = vRP.getUserSource(tonumber(user_id))
    if tplayer ~= nil then
      vRPclient.getPosition(tplayer,{},function(x,y,z)
        vRPclient.teleport(player,{x,y,z})
      end)
    end
  end)
end

local function ch_tptocoords(player,choice)
  vRP.prompt(player,"Coords x,y,z:","",function(player,fcoords) 
    local coords = {}
    for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
      table.insert(coords,tonumber(coord))
    end

    local x,y,z = 0,0,0
    if coords[1] ~= nil then x = coords[1] end
    if coords[2] ~= nil then y = coords[2] end
    if coords[3] ~= nil then z = coords[3] end

    vRPclient.teleport(player,{x,y,z})
  end)
end

local function ch_givemoney_bank(player,choice)
vRP.prompt(player,"Player Perm ID:","",function(player,user_id)
	if user_id ~= nil and user_id~="" then
	user_id=parseInt(user_id)
    vRP.prompt(player,"Amount:","",function(player,amount) 
      amount = parseInt(amount)
      vRP.giveBankMoney(user_id, amount)
	  local target = vRP.getUserSource(user_id)
	  vRPclient.notify(player,{"You Gave " ..user_id.. " £ " ..amount})
	  vRPclient.notify(target,{"You Recieved Money From " ..user_id.. " £ " ..amount})
		end)
	end
  end)
end

local function ch_givemoney_cash(player,choice)
vRP.prompt(player,"Player Perm ID:","",function(player,user_id)
	if user_id ~= nil and user_id~="" then
	user_id=parseInt(user_id)
    vRP.prompt(player,"Amount:","",function(player,amount) 
      amount = parseInt(amount)
      vRP.giveMoney(user_id, amount)
	  local target = vRP.getUserSource(user_id)
	  vRPclient.notify(player,{"You Gave " ..user_id.. " £ " ..amount})
	  vRPclient.notify(target,{"You Recieved Money From " ..user_id.. " £ " ..amount})
		end)
	end
  end)
end

local function ch_giveitem(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Id name:","",function(player,idname) 
      idname = idname or ""
      vRP.prompt(player,"Amount:","",function(player,amount) 
        amount = parseInt(amount)
        vRP.giveInventoryItem(user_id, idname, amount,true)
      end)
    end)
  end
end

nwrpAdminTicketSavedLocations = {}
--nwrpAdminTicketSavedLocations = ["admin_id"] = {x,y,z}

local function ch_calladmin(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Describe your problem:","",function(player,desc) 
      desc = desc or ""
      if desc ~= nil and desc ~= "" then
      local answered = false
      local players = {}
      for k,v in pairs(vRP.rusers) do
        local player = vRP.getUserSource(tonumber(k))
        -- check user
        if vRP.hasPermission(k,"admin.tickets") and player ~= nil then
          table.insert(players,player)
        end
      end

      -- send notify and alert to all listening players
      for k,v in pairs(players) do
	  print ("Admin Ticket Sent!")
        vRP.request(v,"Admin ticket (user_id = "..user_id..") take/TP to ?: "..htmlEntities.encode(desc), 60, function(v,ok)
          if ok then -- take the call
			print("accepted admin call")
            if not answered then
				print("ticket not taken")
              -- answer the call
				vRPclient.notify(player,{"An admin took your ticket."})
				vRPclient.getPosition(v, {}, function(x,y,z)
					local admin_id = vRP.getUserId(v)
					print("Saving pos of admin id: " .. tostring(admin_id))
					nwrpAdminTicketSavedLocations[admin_id] = {x,y,z}
				end)
				vRPclient.getPosition(player, {}, function(x,y,z)
			  
                vRPclient.teleport(v,{x,y,z})
				print ("ticket taken!")
				TriggerClientEvent("CMG:OMioDioMode",v,true)
              end)
				answered = true
				else
              vRPclient.notify(v,{"Ticket already taken."})
            end
		  else
			print("not accepted for id: " .. tostring(v))
          end
        end)
      end
      else
        vRPclient.notify(player,{"Empty Admin Call."})
      end
    end)
  end
end


RegisterCommand("return", function(source, args)
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.tickets") then
		if nwrpAdminTicketSavedLocations[user_id] ~= nil then
			local adminPos = nwrpAdminTicketSavedLocations[user_id]
			local x,y,z = table.unpack(adminPos)
			vRPclient.teleport(source,{x,y,z})
			nwrpAdminTicketSavedLocations[user_id] = nil
			TriggerClientEvent("CMG:OMioDioMode",source,false)
			vRPclient.notify(source,{"~g~Returned to position"})
	    else
			vRPclient.notify(source,{"~r~Couldn't get your last saved location!"})	
		end
	end
end,false)

RegisterCommand("calladmin", function(source, args)
ch_calladmin(source,0)
end,false)

local player_customs = {}

local function ch_display_custom(player, choice)
  vRPclient.getCustomization(player,{},function(custom)
    if player_customs[player] then -- hide
      player_customs[player] = nil
      vRPclient.removeDiv(player,{"customization"})
    else -- show
      local content = ""
      for k,v in pairs(custom) do
        content = content..k.." => "..json.encode(v).."<br />" 
      end

      player_customs[player] = true
      vRPclient.setDiv(player,{"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content})
    end
  end)
end

local function ch_noclip(player, choice)
  vRPclient.toggleNoclip(player, {})
end


-- Hotkey Open Admin Menu 1/2
function vRP.openAdminMenu(source)
  vRP.buildMenu("admin", {player = source}, function(menudata)
    menudata.name = "Admin"
    menudata.css = {top="75px",header_color="rgba(0,125,255,0.75)"}
    vRP.openMenu(source,menudata)
  end)
end

-- Hotkey Open Admin Menu 2/2
function tvRP.openAdminMenu()
  vRP.openAdminMenu(source)
end

vRP.registerMenuBuilder("main", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    local choices = {}

    -- build admin menu
    choices["Admin"] = {function(player,choice)
      vRP.buildMenu("admin", {player = player}, function(menu)
        menu.name = "Admin"
        menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
        menu.onclose = function(player) vRP.openMainMenu(player) end -- nest menu

        if vRP.hasPermission(user_id,"player.list") then
          menu["User list"] = {ch_list,"Show/hide user list."}
        end
        if vRP.hasPermission(user_id,"player.group.add") then
          menu["Add group"] = {ch_addgroup}
        end
        if vRP.hasPermission(user_id,"player.group.remove") then
          menu["Remove group"] = {ch_removegroup}
        end
        if vRP.hasPermission(user_id,"player.kick") then
          menu["Kick"] = {ch_kick}
        end
        if vRP.hasPermission(user_id,"player.ban") then
          menu["Ban"] = {ch_ban}
        end
        if vRP.hasPermission(user_id,"player.unban") then
          menu["Unban"] = {ch_unban}
        end
	if vRP.hasPermission(user_id,"player.revive") then -- new
          menu["Admin Revive"] = {ch_revive_stn}
        end
        if vRP.hasPermission(user_id,"player.noclip") then
          menu["Noclip"] = {ch_noclip}
        end
        if vRP.hasPermission(user_id,"player.coords") then
          menu["Coords"] = {ch_coords}
        end
        if vRP.hasPermission(user_id,"player.tptome") then
          menu["TpToMe"] = {ch_tptome}
        end
        if vRP.hasPermission(user_id,"player.tpto") then
          menu["TpTo"] = {ch_tpto}
        end
        if vRP.hasPermission(user_id,"player.tpto") then
          menu["TpToCoords"] = {ch_tptocoords}
        end
        if vRP.hasPermission(user_id,"player.calladmin") then
          menu["Call admin"] = {ch_calladmin}
        end
        if vRP.hasPermission(user_id,"player.givebank") then
          menu["Give Bank Money"] = {ch_givemoney_bank}
        end
        if vRP.hasPermission(user_id,"player.givecash") then
          menu["Give Cash In Hand"] = {ch_givemoney_cash}
        end

        vRP.openMenu(player,menu)
      end)
    end}

    add(choices)
	end
end)

-- admin god mode
-- function task_god()
  -- SetTimeout(10000, task_god)

  -- for k,v in pairs(vRP.getUsersByPermission("admin.god")) do
    -- vRP.setHunger(v, 0)
    -- vRP.setThirst(v, 0)

    -- local player = vRP.getUserSource(v)
    -- if player ~= nil then
      -- vRPclient.setHealth(player, {200})
    -- end
  -- end
-- end

-- task_god()
