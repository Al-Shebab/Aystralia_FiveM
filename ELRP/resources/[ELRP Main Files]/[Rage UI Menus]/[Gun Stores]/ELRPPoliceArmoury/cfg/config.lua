cfg = {}
cfg.blipsenabled = false
cfg.perm = "cop.whitelisted","police.onduty"
cfg.currency = "£"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Los Santos
        ped = {460.970703125,-980.08630371094,30.689588546753, 153.03},
        marker = {460.970703125,-980.08630371094,30.689588546753},
    },
    [1] = { -- Sandy
        ped = {1841.6265869141,3691.2766113281,34.258232116699, 153.03},
        marker = {1841.6265869141,3691.2766113281,34.258232116699},
    },
    [2] = { -- Paleto
        ped = {-449.67065429688,6016.71875,31.716402053833, 153.03},
        marker = {-449.67065429688,6016.71875,31.716402053833},
    }
}

cfg.guns = {
    melee = {
        {name = "Nightstick", price = 100, hash = "WEAPON_NIGHTSTICK"},
    },
    pistols = {
        {name = "Taser", price = 100, hash = "WEAPON_STUNGUN"},
        {name = "Glock 17", price = 1000, hash = "GLOCK_17"},
    },
    smgs = {
        {name = "MP7", price = 3000, hash = "MPSEVEN"},
        {name = "UMP", price = 3000, hash = "UMP"}
    },
    shotguns = {
        {name = "Winchester", price = 2000, hash = "WINCHESTER"},
    },
    armour = {
        {name = "Armour", price = 25000},
    }
}

return cfg