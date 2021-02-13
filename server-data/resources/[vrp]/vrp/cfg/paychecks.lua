local cfg = {}

cfg.paychecks = {
    {
        name = "Server Management",
        paycheck = 150000,
        permissions = {"management.paycheck"}
    },
    {
        name = "Server Management",
        paycheck = 45000,
        permissions = {"staff.paycheck"}
    },
    {
        name = "Centerlink",
        paycheck = 1500,
        permissions = {"centerlink.paycheck"},
        isGift = true
    },

}

cfg.interval = 900000
return cfg

