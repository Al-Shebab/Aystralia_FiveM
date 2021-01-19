cfg = {}
cfg.blipsenabled = false
cfg.perm = "player.phone" -- player.phone is default for everyone
cfg.currency = "£"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Los Santos
        ped = {22.815418243408,-1105.5479736328,29.797027587891, 153.03},
        marker = {22.032308578491,-1107.3022460938,29.797027587891},
    }
}

cfg.guns = {
    knifes = {
        {name = "Antique Cavalry Dagger", price = 2000, hash = "weapon_dagger"},
        {name = "Baseball Bat", price = 2000, hash = "weapon_bat"},
        {name = "Broken Bottle", price = 2000, hash = "weapon_bottle"},
        {name = "Crowbar", price = 2000, hash = "weapon_crowbar"},
        {name = "Hammer", price = 2000, hash = "weapon_hammer"},
        {name = "Hatchet", price = 2000, hash = "weapon_hatchet"},
        {name = "Brass Knuckles", price = 2000, hash = "weapon_knuckle"},
        {name = "Knife", price = 2000, hash = "weapon_knife"},
        {name = "Machete", price = 2000, hash = "weapon_machete"},
        {name = "Switchblade", price = 2000, hash = "weapon_switchblade"},
        {name = "Pipe Wrench", price = 2000, hash = "weapon_wrench"},
        {name = "Battle Axe", price = 2000, hash = "weapon_battleaxe"},
        {name = "Stone Hatchet", price = 2000, hash = "weapon_stone_hatchet"},
    }
}

return cfg