cfg = {}

cfg.key = 288

cfg.perm = "nhs.menu"
cfg.IgnoreButtonPerms = true

cfg.lang = "en"

--[[
    en = English
    fr = French
    ger = German
    es = Spanish
    pt = Portuguese
    it = Italian
    de = Deutsch 


]]

--[[ {enabled -- true or false}, permission required ]]
cfg.buttonsEnabled = {             
    ["revive"] = {true, "emergency.revive"},
    ["putinveh"] = {true, "police.putinveh"},
    ["getoutveh"] = {true, "police.getoutveh"}
    --[[
        FREEZE = Freeze Player
        ban = ban player
        kick = kick player
        revive = Revive Player,
        TP2 = Teleport to Player,
        TP2ME = Teleport player to me

    ]]

}

cfg.langs = {
    ["en"] = {
        title = "NHS Interaction",
        subtitle = "~g~Emergency Procedure",
        revPlayer = "Revive Player"
    },
    ["ft"] = {
        title = "NHS Interaction",
        subtitle = "~g~Emergency Procedure",
        revPlayer = "Revive Player"
    },
    ["ger"] = {
        title = "NHS Interaction",
        subtitle = "~g~Emergency Procedure",
        revPlayer = "Revive Player"
    },
    ["es"] = {
        title = "NHS Interaction",
        subtitle = "~g~Emergency Procedure",
        revPlayer = "Revive Player"
    },
    ["pt"] = {
        title = "NHS Interaction",
        subtitle = "~g~Emergency Procedure",
        revPlayer = "Revive Player"
    },
    ["it"] = {
        title = "NHS Interaction",
        subtitle = "~g~Emergency Procedure",
        revPlayer = "Revive Player"
    },
    ["de"] = {
        title = "NHS Interaction",
        subtitle = "~g~Emergency Procedure",
        revPlayer = "Revive Player"
    }








}

return cfg
