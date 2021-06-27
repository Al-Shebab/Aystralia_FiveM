cfg = {}
cfg.blipsenabled = false
cfg.currency = "$"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Los Santos
        ped = {22.815418243408,-1105.5479736328,29.797027587891, 153.03},
        marker = {335.93,-916.77,29.25},
    },
    [1] = { -- Sandy Shores
        ped = {1692.3840332031,3761.2175292969,34.705310821533, 219.69},
        marker = {1693.6604003906,3759.9497070313,34.705299377441},
    },
    [2] = { -- Paleto Bay
        ped = {-331.5198059082,6085.45703125,31.454765319824, 217.52},
        marker = {-330.22994995117,6083.5791015625,31.454767227173},
    },
    [32] = { -- Lesters Crib
        ped = {842.12078857422,-1035.6414794922,28.194869995117, 0.52},
        marker = {842.13067626953,-1033.2801513672,28.194854736328},
    },
}

cfg.guns = {
    knifes = {
        {name = "Switchblade", price = 0, hash = "WEAPON_SWITCHBLADE"},
        {name = "Machete", price = 0, hash = "WEAPON_MACHETE"},
        {name = "Stone Hatchet", price = 0, hash = "WEAPON_STONE_HATCHET"},
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