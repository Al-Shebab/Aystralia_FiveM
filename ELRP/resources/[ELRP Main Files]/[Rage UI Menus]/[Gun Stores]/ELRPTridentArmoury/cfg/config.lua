cfg = {}
cfg.blipsenabled = false
cfg.perm = "trident.whitelisted","police.onduty"
cfg.currency = "£"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Los Santos
        ped = {456.14785766602,-979.95764160156,30.689607620239, 153.03},
        marker = {456.14785766602,-979.95764160156,30.689607620239},
    }
}

cfg.guns = {
    shotgun = {
        {name = "Striker", price = 15000, hash = "STRIKER"},
    },
    assault = {
        {name = "AUG A3", price = 25000, hash = "AUG_A3"},
        {name = "G36C", price = 25000, hash = "GTHREESIXC"},
        {name = "M4A1", price = 25000, hash = "MFOURAONE"},
        {name = "FN SCAR", price = 25000, hash = "SCAR"},
        {name = "Warrior CQC", price = 50000, hash = "WARRIOR"},
    },
    armour = {
        {name = "Armour", price = 25000},
    }
}

return cfg