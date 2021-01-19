cfg = {}
cfg.blipsenabled = false
cfg.perm = "gc.whitelisted","police.onduty"
cfg.currency = "£"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Los Santos
        ped = {451.91851806641,-973.73419189453,30.689598083496, 153.03},
        marker = {451.91851806641,-973.73419189453,30.689598083496},
    }
}

cfg.guns = {
    weapons = {
        {name = "M249", price = 100000, hash = "M249"},
        {name = "Barrett .50", price = 200000, hash = "MSR_SNIPER"},
    },
    armour = {
        {name = "Armour", price = 10000},
    }
}

return cfg