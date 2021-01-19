cfg = {}
cfg.blipsenabled = false
cfg.perm = "player.phone" -- player.phone is default for everyone
cfg.currency = "£"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Los Santos
        ped = {-1778.2728271484,2974.3452148438,32.809036254883, 153.03},
        marker = {-1778.2728271484,2974.3452148438,32.809036254883},
    }
}

cfg.guns = {
    knifes = {
        {name = "Switchblade", price = 500, hash = "WEAPON_SWITCHBLADE"},
        {name = "Machete", price = 500, hash = "WEAPON_MACHETE"},
        {name = "Stone Hatchet", price = 500, hash = "WEAPON_STONE_HATCHET"},
    },
    pistols = {
        {name = "Pistol", price = 1000, hash = "WEAPON_PISTOL"},
        {name = "Combat Pistol", price = 5000, hash = "WEAPON_COMBATPISTOL"}
    },
    smgs = {
        {name = "Micro SMG", price = 1000, hash = "WEAPON_SUBMACHINEGUN"},
        {name = "SMG", price = 1000, hash = "WEAPON_SMG"}
    },
    shotguns = {
        {name = "Shotgun", price = 1000, hash = "WEAPON_SHOTGUN"},
        {name = "Pump Shotgun", price = 15000, hash = "WEAPON_PUMPSHOTGUN"},
    },
    ars = {
        {name = "Carbine Rifle", price = 1000, hash = "WEAPON_CARBINERIFLE"},
        {name = "Special Carbine", price = 1000, hash = "WEAPON_SPECIALCARBINE"},
        {name = "Assault Rifle", price = 1000, hash = "WEAPON_ASSAULTRIFLE"},
        {name = "Bullpup Rifle", price = 1000, hash = "WEAPON_BULLPUPRIFLE"},
    },
    sniper = {
        {name = "Sniper Rifle", price = 500000, hash = "WEAPON_SNIPERRIFLE"},
        {name = "Heavy Sniper", price = 500000, hash = "WEAPON_HEAVYSNIPER"},
        {name = "Marksman Rifle", price = 500000, hash = "WEAPON_MARKSMANRIFLE"},
    },
    throw = {
        {name = "Grenade", price = 1000, hash = "WEAPON_GRENADE"},
        {name = "Molotov", price = 1000, hash = "WEAPON_MOLOTOV"},
        {name = "Sticky Bomb", price = 1000, hash = "WEAPON_STICKYBOMB"},
    },
}

return cfg