local cfg = module("cfg/survival")
local lang = vRP.lang


---- revive
local revive_seq = {
    {"amb@medic@standing@kneel@enter","enter",1},
    {"amb@medic@standing@kneel@idle_a","idle_a",1},
    {"amb@medic@standing@kneel@exit","exit",1}
  }
  
  local choice_revive = {function(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      vRPclient.getNearestPlayer(player,{10},function(nplayer)
        local nuser_id = vRP.getUserId(nplayer)
        if nuser_id ~= nil then
          vRPclient.isInComa(nplayer,{}, function(in_coma)
            if in_coma then
              if vRP.tryGetInventoryItem(user_id,"medkit",1,true) then
                vRPclient.playAnim(player,{false,revive_seq,false}) -- anim
                SetTimeout(15000, function()
                  vRPclient.varyHealth(nplayer,{50}) -- heal 50
                end)
              end
            else
              vRPclient.notify(player,{lang.emergency.menu.revive.not_in_coma()})
            end
          end)
        else
          vRPclient.notify(player,{lang.common.no_player_near()})
        end
      end)
    end
  end,lang.emergency.menu.revive.description()}
  
  -- add choices to the main menu (emergency)
  vRP.registerMenuBuilder("main", function(add, data)
    local user_id = vRP.getUserId(data.player)
    if user_id ~= nil then
      local choices = {}
      if vRP.hasPermission(user_id,"emergency.revive") then
        choices[lang.emergency.menu.revive.title()] = choice_revive
      end
  
      add(choices)
    end
  end)