Keys = {
  ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
  ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
  ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
  ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
  ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
  ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
  ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
  ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = Config or {}

--Available languages: en, it, es, fr, pt, de, ru, tr.
--But you can modify them or create your own language below.
--Don't forget to translate some things into HTML.
Config.Language = 'en'

--Configure your Framework here, it will only work with ESX bases.
Config.getSharedObject = 'esx:getSharedObject'

--Unfortunately it is only available for 'progressbar' or 'mythic_progbar'
--I include 'progressbar' in this package.
Config.Progbar = 'progressbar'

--If you use true, you will use black money.
--Use false if you want sellers to pay you with regular money.
Config.BlackMoney = true

Config.RequiredCops = 0 --Minimum police to sell drugs.
Config.VehiclePrice = 1500 --Price of the vehicle to distribute the drugs.
Config.CustomersFindPrice = 750 --Price for requesting data from buyers..
Config.MinWholesaleCount = 50 --Minimum drug to start the sale.
Config.WholesaleVehicle = "burrito3" --Delivery vehicle https://wiki.rage.mp/index.php?title=Vehicles.
Config.CopsRefreshTime = 30000 --Min 10000ms.
Config.NormalSellChance = 55 -- 45% Normal Sale.
Config.DruggedSellChance = 50 -- 5% NPC is drugged and paid 2x.
Config.AttackSellChance = 35 -- 15% NPC robbing us.
Config.PoliceSellChance = 0 -- 35% NPC notifies the LSPD.

--Customize your notification system here.
function SendTextMessage(msg)
	--SetNotificationTextEntry('STRING')
	--AddTextComponentString(msg)
	--DrawNotification(0,1)
    
	exports['mythic_notify']:DoHudText('inform', msg)
end

--Here you configure the collectable objects, you can change the name, the time of the progressbar and its prop.
--https://gta-objects.xyz/
--http://www.test.raccoon72.ru/
Config.CollectItems = {
  ["weed"] = {
    prop = 'prop_weed_01',
    item = 'weed',
    time = 4000,
  },
  ["meth"] = {
    prop = 'prop_barrel_exp_01a',
    item = 'chemicals',
    time = 4000,
  },
  ["cocaine"] = {
    prop = 'prop_plant_cane_02b',
    item = 'cocaine',
    time = 4000,
  },
}

--Modify the parking marker here.
--https://docs.fivem.net/docs/game-references/markers/
Config.Marker = { 
  type = 2, 
  scale = {x = 0.2, y = 0.2, z = 0.1}, 
  colour = {r = 71, g = 181, b = 255, a = 120},
  movement = 1 --Use 0 to disable movement
}

--Here you can customize buyers' blips.
--You can modify the name of the blip.
--https://docs.fivem.net/docs/game-references/blips/
Config.CustomerBlip = { 
  sprite = 205, 
  color = 2, 
  scale = 0.5,
  name = '[Dealer] Place of meeting',
}

--Modify the police blip here.
--You can modify the name of the blip.
--https://docs.fivem.net/docs/game-references/blips/
Config.PoliceBlip = { 
  sprite = 403, 
  color = 1, 
  scale = 1.2,
  alpha = 250,
  name = '[Drugs] Drug sales',
}

--Add all collectable plants or barrels here.
--The 'coords' section is the general area where the plants will be, such as a radius.
Config.CircleZones = {
--Weed.
	WeedField = {coords = vector3(1320.04, 1870.26, 90.83), SpawnCoords = {
    vector3(1320.215, 1870.333, 90.85452),
    vector3(1327.837, 1868.747, 92.27645),
    vector3(1324.869, 1861.578, 92.30363),
    vector3(1315.104, 1860.166, 90.54333),
    vector3(1308.948, 1866.706, 88.88728),
    vector3(1310.077, 1876.98, 88.63334),
    vector3(1319.797, 1881.809, 90.20747),
    vector3(1333.231, 1879.296, 92.46505),
    vector3(1343.808, 1869.762, 94.27966),
    vector3(1337.932, 1861.433, 93.82767),
    vector3(1332.817, 1850.088, 93.33994),
    vector3(1340.589, 1849.246, 94.33746),
    vector3(1350.098, 1859.028, 95.41202),
    vector3(1343.933, 1866.611, 94.42379),
    vector3(1328.526, 1885.29, 91.4468),
    vector3(1320.057, 1891.196, 89.80909),
    vector3(1299.274, 1869.89, 86.87721),
    vector3(1301.823, 1859.475, 87.80598),
  }},
--Chemicals.
	ChemicalsField = {coords = vector3(817.46, -3192.84, 5.9), SpawnCoords = {
    vector3(814.7153, -3195.444, 5.900818),
    vector3(817.7902, -3200.771, 5.900818),
    vector3(820.09, -3194.618, 5.900818),
    vector3(817.5483, -3189.987, 5.900818),
    vector3(811.2111, -3189.486, 5.900818),
    vector3(810.2635, -3192.79, 5.900818),
    vector3(812.1355, -3199.094, 5.900818),
    vector3(808.2501, -3201.11, 5.900818),
    vector3(812.5481, -3200.223, 5.900815),
  }},
--Cocaine.
	CocainaField = {coords = vector3(16.34, 6875.94, 12.64), SpawnCoords = {
    vector3(16.33991, 6875.94, 12.63982),
    vector3(20.36974, 6871.238, 13.07422),
    vector3(15.21229, 6865.497, 12.72771),
    vector3(6.707561, 6867.579, 12.6143),
    vector3(8.672844, 6873.903, 12.46061),
    vector3(16.59974, 6882.196, 12.51987),
    vector3(22.7651, 6876.811, 13.19112),
    vector3(27.99341, 6872.438, 13.75746),
    vector3(14.50345, 6869.238, 12.67547),
    vector3(6.396118, 6860.454, 12.84791),
    vector3(-0.7274725, 6865.107, 12.78476),
  }},
}

--Configure here the process and text zones.
--You can modify the objects in: requireItem and rewardItem.
--And the amount in: requireRate and rewardRate
--IMPORTANT: I don't recommend touching the locations a lot, only the coordinates of the entrances and exits.
Config.Progress = {
  Meth = {
    inside = {
      coords = vec3(996.81, -3200.64, -36.39)
    },
    outside = {
      coords = vec3(1561.46, -1693.57, 89.21)
    },
    ["cook_meth"] = {
      mainText = "~b~E~s~ - Process meth",
      progText    = "Processing methamphetamine...",
      requireRate = 10, 
      requireItem = 'chemicals',
      rewardItem  = "meth",
      rewardRate  = 30,
      locations = {
        [1] = {
          location    = vector3(1005.80,-3200.40,-38.90),
          offset      = vector3(-4.88,-1.95,0.0),
          rotation    = vector3(0.0, 0.0, 0.0),
          active = true,
        }
      },
      time        = 73000,
      act         = "Meth",
      scene       = 1,
      active = true,
    },
    ["package_meth"] = {
      mainText = "~b~E~s~ - Package meth",
      progText    = "Packing methamphetamine...",
      requireRate = 10, 
      requireItem = "meth",
      rewardItem  = "meth_packaged",
      rewardRate  = 10,
      locations = {
        [1] = {
          location    = vector3(1011.80,-3194.90,-38.99),
          offset      = vector3(4.48,1.7,1.0),
          rotation    = vector3(0.0, 0.0, 0.0),
          active = true,
        },
        [2] = {
          location    = vector3(1014.19, -3195.02, -38.99),
          offset      = vector3(4.48,1.7,1.0),
          rotation    = vector3(0.0, 0.0, 0.0),
          active = true,
        },
        [3] = {
          location    = vector3(1016.49, -3194.9, -38.99),
          offset      = vector3(4.48,1.7,1.0),
          rotation    = vector3(0.0, 0.0, 0.0),
          active = true,
        },
      },
      time        = 50000,
      act         = "Meth",
      scene       = 2,
      active = true,
    },
  },
  Cocaine = {
    inside = {
      coords = vec3(1088.66,-3187.55,-38.99)
    },
    outside = {
      coords = vec3(465.00, -1894.07, 25.90)
    },
    ["process_cocaine"] = {
      mainText    = "~b~E~s~ - Process cocaine",
      progText    = "Processing cocaine...",

      requireRate = 10, 
      requireItem = "cocaine",
      rewardItem  = "cocaine_cut",
      rewardRate  = 5,
      locations = {
        [1] = {
          location = vector3(1099.544,-3194.13,-39.60),
          rotation = vector3(0.0, 0.0, -90.0),
          offset = vector3(0.31, -1.71, 0.0),
          active = true,
        },
        [2] = {
          location = vector3(1095.41, -3196.57, -38.99),
          rotation = vector3(0.0, 0.0, -180.0),
          offset = vector3(-1.8, -0.4, 0.6),
          active = true,
        },
        [3] = {
          location = vector3(1093.03, -3196.59, -38.99),
          rotation = vector3(0.0, 0.0, -180.0),
          offset = vector3(-1.8, -0.4, 0.6),
          active = true,
        },
        [4] = {
          location = vector3(1090.39, -3196.57, -38.99),
          rotation = vector3(0.0, 0.0, -180.0),
          offset = vector3(-1.8, -0.4, 0.6),
          active = true,
        },
        [5] = {
          location = vector3(1101.86, -3193.74, -38.99),
          rotation = vector3(0.0, 0.0, -180),
          offset = vector3(-2, -0.4, 0.6),
          active = true,
        },
      },
      time        = 25000,
      act         = "Cocaine",
      scene       = 1,
      active = true,
    }, 
    ["package_cocaine"] = {
      mainText    = "~b~E~s~ - Packaged cocaine",
      progText    = "Packing cocaine...",

      requireRate = 5, 
      requireItem = "cocaine_cut",
      rewardItem  = "cocaine_packaged",
      rewardRate  = 3,
      locations = {
        [1] = {
          location    = vector3(1101.245,-3198.82,-39.60),
          offset      = vector3(7.663,-2.222,0.395),
          rotation    = vector3(0.0, 0.0, 0.0),
          active = true,
        }
      },
      time        = 59000,
      act         = "Cocaine",
      scene       = 2,
      active = true,
    }, 
  },
  Weed = {
    inside = {
      coords = vec3(1066.4, -3183.41, -39.16)
    },
    outside = {
      coords = vec3(183.03, -1836.59, 28.10)
    },
    ["trim_plant"] = {
      mainText    = "~b~E~s~ - Process weed",
      progText    = "Processing weed...",

      requireRate = 5, 
      requireItem = "weed",
      rewardItem  = "weed_packaged",
      rewardRate  = 5,
      locations = {
        [1] = {
          location    = vector3(1038.14,-3205.45,-38.16),
          offset      = vector3(-0.3, 0.4, 0.96),
          rotation    = vector3(0.0, 0.0, 90.0),
          active = true,
        },
        [2] = {
          location    = vector3(1033.67,-3205.56,-38.16),
          offset      = vector3(-0.3, 0.4, 0.96),
          rotation    = vector3(0.0, 0.0, 90.0),
          active = true,
        }
      },
      time        = 30000,
      act         = "Weed",
      scene       = 2,
      active = true,
    },
  }
}

--These are the drugs that the dealer will ask to sell.
Config.Drugs = {
    Weed = {
        ItemName = "weed_packaged",
        ItemWholesalePrice = 40, --Wholesaler's price.
        ItemSinglyPrice = 80, --Retail.
    },
    Meth = {
        ItemName = "meth_packaged",
        ItemWholesalePrice = 45, --Wholesaler's price.
        ItemSinglyPrice = 90, --Retail.
    },
    Coke = {
        ItemName = "cocaine_packaged",
        ItemWholesalePrice = 85, --Wholesaler's price.
        ItemSinglyPrice = 170, --Retail.
    },
}

--Here you can modify the position of the distributor and the phrases of all buyers, even the order.
--https://docs.fivem.net/docs/game-references/ped-models/
Config.SellDrugs = {
    Dealer = {
		Pos   = {x = -62.8, y = -1214.14, z = 28.61, h = 318.45},
    WholesaleVehicleSpawnPoint = {x = -49.22, y = -1222.01, z = 28.93, h = 88.14},
    DealerPed = "g_m_y_famca_01",

        CustomerWholesaleText = {
            [1] = {text = "Do you have something good for me?"},
            [2] = {text = "Do you have what it was about?"},
            [3] = {text = "Fast action, people drive here..."},
            [4] = {text = "Move faster, we don't have time!"},
            [5] = {text = "Hope the drugs are top shelf"},
            [6] = {text = "Hope everything is converted to milligrams"},
        },
        CustomerSinglyText = {
            [1] = {text = "Yo, have you got any good for me?"},
            [2] = {text = "Hi buddy, do you have any drugs?"},
            [3] = {text = "How long can i wait for you... Do you have drugs?"},
            [4] = {text = "Wassup, hurry up, I don't have time!"},
            [5] = {text = "Yoo, hope the drugs are top shelf"},
            [6] = {text = "Hey, hope everything is converted to milligrams..."},
        },
        CustomerSinglyNormalText = {
            [1] = {text = "Thank you, I'm going to have a little fun"},
            [2] = {text = "All right bro, till the next..."},
            [3] = {text = "We are in touch mate!"},
            [4] = {text = "Today i'm going to be crazy"},
            [5] = {text = "I'll be in touch for more soon!"},
            [6] = {text = "I'm going to the club, take care of yourself"},
        },
        CustomerSinglyDruggedText = {
            [1] = {text = "I'm gonna get more high, cross your fingers"},
            [2] = {text = "Fuck, but these drugs are pounding"},
            [3] = {text = "Thanks, my dear, take care..."},
            [4] = {text = "Fuck! I had an appointment with someone, but i don't remember with who..."},
            [5] = {text = "I'm coming home to rest until the next one"},
            [6] = {text = "H... H... Hey buddy!"},
        },
        CustomerSinglyAttackText = {
            [1] = {text = "Get your hands up, bitch!"},
            [2] = {text = "Give up you fucker!"},
            [3] = {text = "What now bitch?! Give me the drugs!"},
            [4] = {text = "Haha! Choose well bastard!"},
            [5] = {text = "No jerky movements or i'll blow your head off!"},
            [6] = {text = "What would you say for that?"},
        },
        CustomerSinglyPoliceText = {
            [1] = {text = "I don't want your shit!"},
            [2] = {text = "Fuck off with this"},
            [3] = {text = "I'm not interested, thanks"},
            [4] = {text = "I'm calling the police"},
            [5] = {text = "Get away from me with it!"},
            [6] = {text = "Maybe another time"},
        },
	},
    SinglyPeds = {
        [1] = {ped = "a_m_y_beach_03"},
        [2] = {ped = "a_m_y_breakdance_01"},
        [3] = {ped = "g_m_m_chicold_01"},
        [4] = {ped = "s_m_y_dealer_01"},
        [5] = {ped = "a_m_y_downtown_01"},
        [6] = {ped = "g_m_y_famfor_01"},
        [7] = {ped = "csb_g"},
        [8] = {ped = "ig_jimmydisanto"},
        [9] = {ped = "u_m_y_militarybum"},
        [10] = {ped = "ig_ortega"},
	},
    DocksCustomer = {
        DocksPed = "s_m_m_gardener_01",
	},
    EastVinewoodCustomer = {
        EastVinewoodPed = "s_m_m_bouncer_01",
	},
    SandyShoresCustomer = {
        SandyShoresPed = "a_m_m_eastsa_01",
	},
    PaletoBayCustomer = {
        PaletoBayPed = "a_m_m_hillbilly_02",
	},
}

--I do not recommend modifying this.
--Do not add more.
Config.SinglyLocations = {
    {Location = "Loc1"},
    {Location = "Loc2"},
    {Location = "Loc3"},
    {Location = "Loc4"},
    {Location = "Loc5"},
    {Location = "Loc6"},
    {Location = "Loc7"},
    {Location = "Loc8"},
    {Location = "Loc9"},
    {Location = "Loc10"},
    {Location = "Loc11"},
    {Location = "Loc12"},
    {Location = "Loc13"},
    {Location = "Loc14"},
    {Location = "Loc15"},
    {Location = "Loc16"},
    {Location = "Loc17"},
    {Location = "Loc18"},
    {Location = "Loc19"},
    {Location = "Loc20"},
}

--Here you can modify all possible trips to sell drugs.
--Do not add more.
Config.Loc1 = {
    {x = 581.66, 
    y = -2728.68, 
    z = 6.06 - 0.1, 
    h = 189.28,
    gx = 582.23,
    gy = -2723.09,
    gz = 7.19,
    blip,
    ped},
}

Config.Loc2 = {
    {x = 859.23,
    y = -2273.51, 
    z = 30.35 - 0.1, 
    h = 86.60,
    gx = 856.22,
    gy = -2284.15,
    gz = 30.35,
    blip,
    ped},
}

Config.Loc3 = {
    {x = 974.69,
    y = -2366.70, 
    z = 30.52 - 0.1, 
    h = 177.90,
    gx = 975.64,
    gy = -2358.18,
    gz = 31.82,
    blip,
    ped},
}

Config.Loc4 = {
    {x = 1078.17,
    y = -1967.82, 
    z = 31.01 - 0.1, 
    h = 63.56,
    gx = 1083.57,
    gy = -1974.09,
    gz = 31.01,
    blip,
    ped},
}

Config.Loc5 = {
    {x = 1411.30,
    y = -2048.84, 
    z = 52.00 - 0.1, 
    h = 173.76,
    gx = 1414.01,
    gy = -2042.01,
    gz = 52.00,
    blip,
    ped},
}

Config.Loc6 = {
    {x = 138.77,
    y = -1333.59, 
    z = 29.20 - 0.1, 
    h = 310.05,
    gx = 138.62,
    gy = -1348.53,
    gz = 29.20,
    blip,
    ped},
}

Config.Loc7 = {
    {x = 43.51,
    y = -1447.94, 
    z = 29.31 - 0.1, 
    h = 47.66,
    gx = 49.98,
    gy = -1453.60,
    gz = 29.31,
    blip,
    ped},
}

Config.Loc8 = {
    {x = -31.08,
    y = -1497.87, 
    z = 30.55 - 0.1, 
    h = 141.21,
    gx = -25.38,
    gy = -1491.27,
    gz = 30.36,
    blip,
    ped},
}

Config.Loc9 = {
    {x = -356.80,
    y = -1460.36, 
    z = 29.57 - 0.1, 
    h = 4.09,
    gx = -356.27,
    gy = -1466.82,
    gz = 30.87,
    blip,
    ped},
}

Config.Loc10 = {
    {x = -646.38,
    y = -1222.01, 
    z = 11.20 - 0.1, 
    h = 304.78,
    gx = -643.12,
    gy = -1227.65,
    gz = 11.55,
    blip,
    ped},
}

Config.Loc11 = {
    {x = -1407.18,
    y = -456.70, 
    z = 34.48 - 0.1, 
    h = 210.40,
    gx = -1402.51,
    gy = -452.20,
    gz = 34.48,
    blip,
    ped},
}

Config.Loc12 = {
    {x = -1470.42,
    y = -391.72, 
    z = 38.68 - 0.1, 
    h = 137.57,
    gx = -1467.74,
    gy = -387.50,
    gz = 38.77,
    blip,
    ped},
}

Config.Loc13 = {
    {x = -1560.84,
    y = -412.85, 
    z = 42.38 - 0.1, 
    h = 227.57,
    gx = -1567.30,
    gy = -403.89,
    gz = 42.39,
    blip,
    ped},
}

Config.Loc14 = {
    {x = -1696.27,
    y = -468.86, 
    z = 41.65 - 0.1, 
    h = 239.87,
    gx = -1700.22,
    gy = -474.50,
    gz = 41.65,
    blip,
    ped},
}

Config.Loc15 = {
    {x = -1776.32,
    y = -434.20, 
    z = 42.11 - 0.1, 
    h = 195.12,
    gx = -1778.11,
    gy = -427.52,
    gz = 41.45,
    blip,
    ped},
}

Config.Loc16 = {
    {x = 1923.26,
    y = 3733.66, 
    z = 32.77 - 0.1, 
    h = 25.40,
    gx = 1920.92,
    gy = 3728.55,
    gz = 32.79,
    blip,
    ped},
}

Config.Loc17 = {
    {x = 1781.21,
    y = 3644.36, 
    z = 34.44 - 0.1, 
    h = 296.70,
    gx = 1776.50,
    gy = 3640.95,
    gz = 34.52,
    blip,
    ped},
}

Config.Loc18 = {
    {x = 1442.02,
    y = 3650.48, 
    z = 34.34 - 0.1, 
    h = 221.48,
    gx = 1426.07,
    gy = 3644.88,
    gz = 37.89,
    blip,
    ped},
}

Config.Loc19 = {
    {x = 913.06,
    y = 3588.33, 
    z = 33.34 - 0.1, 
    h = 272.65,
    gx = 905.82,
    gy = 3586.49,
    gz = 33.42,
    blip,
    ped},
}

Config.Loc20 = {
    {x = 1769.44,
    y = 3337.62, 
    z = 41.43 - 0.1, 
    h = 299.44,
    gx = 1776.61,
    gy = 3327.63,
    gz = 41.43,
    blip,
    ped},
}

Config.WholesaleLocations = {
	{Location = "Docks"},
    {Location = "East Vinewood"},
    {Location = "Sandy Shores"},
    {Location = "Paleto Bay"},
}

Config.Docks = {
    {x = 1216.20, 
    y = -2990.94, 
    z = 5.68, 
    h = 89.91, 
    ped, 
    blip, 
    PedPosX = 1230.93, 
    PedPosY = -3002.17, 
    PedPosZ = 9.32, 
    PedPosH = 89.06,
    PedGoX = 1222.13,
    PedGoY = -2990.95,
    PedGoZ = 5.87,
    PedGoH = 85.69},
}

Config.EastVinewood = {
    {x = 601.46, 
    y = -454.80, 
    z = 24.56, 
    h = 355.60, 
    ped, 
    blip, 
    PedPosX = 608.72, 
    PedPosY = -459.64, 
    PedPosZ = 24.74, 
    PedPosH = 168.34,
    PedGoX = 604.93,
    PedGoY = -459.78,
    PedGoZ = 24.74,
    PedGoH = 39.70},
}

Config.SandyShores = {
    {x = 1354.00, 
    y = 3619.38, 
    z = 34.61, 
    h = 109.01, 
    ped, 
    blip, 
    PedPosX = 1363.69, 
    PedPosY = 3616.45, 
    PedPosZ = 34.89, 
    PedPosH = 22.83,
    PedGoX = 1359.42,
    PedGoY = 3621.19,
    PedGoZ = 34.81,
    PedGoH = 101.93},
}

Config.PaletoBay = {
    {x = -22.33, 
    y = 6457.40, 
    z = 31.20, 
    h = 223.36, 
    ped, 
    blip, 
    PedPosX = -29.62, 
    PedPosY = 6457.64, 
    PedPosZ = 31.46, 
    PedPosH = 221.25,
    PedGoX = -26.41,
    PedGoY = 6461.58,
    PedGoZ = 31.45,
    PedGoH = 220.46},
}

--Languages ​​available.
--But you can create your own by modifying one or creating a new one.
Config.Languages = {
  ['en'] = {
      ["ENTER_LABS"] = "~b~E~s~ - Enter the lab",
      ["EXIT_LABS"] = "~b~E~s~ - Exit the lab",
      ["SELL_DRUGS"] = "~b~E~s~ - Sell drugs",
      ["DRUG_DEALER"] = "~b~E~s~ - Drug dealer",
      ["SEE_COCAINE"] = "~b~E~s~ - Collect cocaine",
      ["SEE_MARIHUANA"] = "~b~E~s~ - Collect marijuana",
      ["SEE_METH"] = "~b~E~s~ - Collect chemicals",
      ["NO_POLICE"] = "There are not enough policemen",
      ["SELECT_OPTION"] = "What type of sale do you want to make?",
      ["YOU_CHOOSE"] = "We have two sale options, you choose champion...",
      ["INTERESTED_BUYER"] = "~b~E~s~ - Wholesaler | ~b~G~s~ - Retailer",
      ["BUY_CAR"] = "If you want to sell that much, you must buy a car for ~g~$",
      ["BUY_CUSTOMER"] = "I can give you a buyer's information for ~g~$",
      ["ACCEPT_REJECT"] = "~b~E~s~ - Accept | ~b~G~s~ - Reject",
      ["CANCEL_MISSION"] = "~b~E~s~ - Cancel delivery",
      ["SAVE_VEHICLE"] = "~b~E~s~ - Save vehicle",
      ["OPEN_TRUNK"] = "~b~E~s~ - Open trunk",
      ["CLOSE_GIVE"] = "~b~E~s~ - Close trunk | ~b~G~s~ - Take out the drugs",
      ["CUSTOMER_STEAL"] = "~b~E~s~ - Give drugs | ~b~G~s~ - Try to escape",
      ["SAVE_DRUGS"] = "~b~E~s~ - You keep drugs in the trunk",
      ["PARK_VEHICLE"] = "~b~E~s~ - Park",
      ["UNPARK_VEHICLE"] = "~b~E~s~ - Exit the parking lot",
      ["DRUG_TRUNK_TEXT"] = "Take the drugs out of the trunk",
      ["CUSTOMER_GIVE"] = "~b~E~s~ - Deliver drugs",

      ["POLICE_NOTIFY"] = "There have been drug sales in",
      ["INSUFFICIENT_ITEM"] = "You don't have enough",
      ["CUSTOMER_ON_DRUGS"] = "The customer was very high and paid double",
      ["NO_DRUGS"] = "You don't have enough drugs",
      ["INSUFFICIENT_DRUG"] = "You do not have enough drug, you need minimum",
      ["YOU_CANCEL"] = "You canceled a drug errand!",
      ["POLICE_ALERT"] = "The seller called the police!",
      ["SAVE_CAR"] = "First leave the vehicle in the garage!",
      ["SELL_DONE"] = "You have no more drugs, the order is done",
      ["WAITING_ORDER"] = "You are waiting for the order from the distributor...",
      ["FAKE_CUSTOMER"] = "The buyer turned out to be a thief!",
      ["NO_CAR"] = "This vehicle is not yours",
      ["ORDER_CANCELED"] = "Order canceled",
      ["STEAL_DRUGS"] = "All your drugs were stolen",
      ["NO_MONEY"] = "You don't have enough money",
      ["LEAVE_CAR"] = "Get off the vehicle!",
      ["NO_DRUGS_TRUNK"] = "There are no drugs here",
      ["FIND_CUSTOMER"] = "I found a client, go meet him",
      ["CUSTOMER_PURCHASE"] = "Look for the buyer to sell the drugs",
      ["RETURN_VEHICLE"] = "You finished the errand, return to the base to return the vehicle",
      ["YOU_NO_DRUGS"] = "You have no drugs, go back to base and return the vehicle.",
      ["VEHICLE_SPAWN"] = "The vehicle is waiting near the warehouse near the stairs, drive to the designated place...",
      ["YOU_NEED"] = "You need to have minimum:",
      ["SELL_WEED"] = "You sold marijuana for $",
      ["SELL_METH"] = "You sold methamphetamine for $",
      ["SELL_COCAINE"] = "You sold cocaine for $",

      ["OPEN_TRUNK_BAR"] = "Opening the trunk...",
      ["CLOSE_TRUNK_BAR"] = "Closing the trunk...",
      ["TAKE_DRUGS_BAR"] = "Taking the drugs out of the pot...",
      ["SAVE_DRUGS_BAR"] = "Saving the drug dealer's drugs...",
      ["TALKING_BAR"] = "Talking to the buyer...",
      ["COLLECT_MARIHUANA"] = "Colecting marijuana...",
      ["COLLECT_METH"] = "Colecting meth...",
      ["COLLECT_COCAINE"] = "Colecting cocaine...",
  },

  ['es'] = {
      ["ENTER_LABS"] = "~b~E~s~ - Entrar al laboratorio",
      ["EXIT_LABS"] = "~b~E~s~ - Salir del laboratorio",
      ["SELL_DRUGS"] = "~b~E~s~ - Vender drogas",
      ["DRUG_DEALER"] = "~b~E~s~ - Narcotraficante",
      ["SEE_COCAINE"] = "~b~E~s~ - Recolectar cocaina",
      ["SEE_MARIHUANA"] = "~b~E~s~ - Recolectar marihuana",
      ["SEE_METH"] = "~b~E~s~ - Recolectar quimicos",
      ["NO_POLICE"] = "No hay policias suficientes",
      ["SELECT_OPTION"] = "¿Que tipo de venta quieres hacer?",
      ["YOU_CHOOSE"] = "Tenemos dos opciones de venta, tu eliges campeon...",
      ["INTERESTED_BUYER"] = "~b~E~s~ - Mayorista | ~b~G~s~ - Minorista",
      ["BUY_CAR"] = "Si quieres vender tanta cantidad, debes comprar un coche por ~g~$",
      ["BUY_CUSTOMER"] = "Puedo darte la informacion de un comprador por ~g~$",
      ["ACCEPT_REJECT"] = "~b~E~s~ - Aceptar | ~b~G~s~ - Rechazar",
      ["CANCEL_MISSION"] = "~b~E~s~ - Cancelar entrega",
      ["SAVE_VEHICLE"] = "~b~E~s~ - Guardar vehículo",
      ["OPEN_TRUNK"] = "~b~E~s~ - Abrir maletero",
      ["CLOSE_GIVE"] = "~b~E~s~ - Cerrar maletero | ~b~G~s~ - Sacar las drogas",
      ["CUSTOMER_STEAL"] = "~b~E~s~ - Dar drogas | ~b~G~s~ - Intentar escapar",
      ["SAVE_DRUGS"] = "~b~E~s~ - Guardas drogas en el maletero",
      ["PARK_VEHICLE"] = "~b~E~s~ - Estacionar",
      ["UNPARK_VEHICLE"] = "~b~E~s~ - Salir del estacionamiento",
      ["DRUG_TRUNK_TEXT"] = "Saca las drogas del maletero",
      ["CUSTOMER_GIVE"] = "~b~E~s~ - Entregar drogas",

      ["POLICE_NOTIFY"] = "Ha habido ventas de drogas en ",
      ["INSUFFICIENT_ITEM"] = "No tiene suficiente ",
      ["CUSTOMER_ON_DRUGS"] = "El cliente estaba muy drogado y pago el doble",
      ["NO_DRUGS"] = "No tienes drogas suficientes",
      ["INSUFFICIENT_DRUG"] = "No tiene suficiente droga, necesitas minimo ",
      ["YOU_CANCEL"] = "¡Cancelaste un recado de drogas!",
      ["POLICE_ALERT"] = "¡El vendedor llamo a la policia!",
      ["SAVE_CAR"] = "¡Primero deja el vehiculo en el garaje!",
      ["SELL_DONE"] = "No tienes más drogas, el pedido está hecho",
      ["WAITING_ORDER"] = "Estás esperando el pedido del distribuidor...",
      ["FAKE_CUSTOMER"] = "¡El comprador resulto ser un ladron!",
      ["NO_CAR"] = "Este vehiculo no es tuyo",
      ["ORDER_CANCELED"] = "Orden cancelada",
      ["STEAL_DRUGS"] = "Todas tus drogas fueron robadas",
      ["NO_MONEY"] = "No tienes dinero suficiente",
      ["LEAVE_CAR"] = "¡Bajate del vehiculo!",
      ["NO_DRUGS_TRUNK"] = "No hay drogas aqui",
      ["FIND_CUSTOMER"] = "Encontre un cliente, ve a reunirte con el",
      ["CUSTOMER_PURCHASE"] = "Busca al comprador para vender las drogas",
      ["RETURN_VEHICLE"] = "Terminaste el mandado, regresa a la base para devolver el vehículo",
      ["YOU_NO_DRUGS"] = "No tienes drogas, regrese a la base y devuelva el vehículo.",
      ["VEHICLE_SPAWN"] = "El vehículo está esperando cerca del almacén cerca de las escaleras, conduzca hasta el lugar designado...",
      ["YOU_NEED"] = "Necesitas tener mínimo: ",
      ["SELL_WEED"] = "Vendiste marihuana por $",
      ["SELL_METH"] = "Vendiste metanfetaminas por $",
      ["SELL_COCAINE"] = "Vendiste cocaina por $",

      ["OPEN_TRUNK_BAR"] = "Abriendo el maletero...",
      ["CLOSE_TRUNK_BAR"] = "Cerrando el maletero...",
      ["TAKE_DRUGS_BAR"] = "Sacando las drogas del meltero...",
      ["SAVE_DRUGS_BAR"] = "Guardando las drogas del meltero...",
      ["TALKING_BAR"] = "Hablando con el comprador...",
      ["COLLECT_MARIHUANA"] = "Recolectando marihuana...",
      ["COLLECT_METH"] = "Recolectando metanfetamina...",
      ["COLLECT_COCAINE"] = "Recolectando cocaína...",
	},
  ['pt'] = {
      ["ENTER_LABS"] = "~b~E~s~ - Entre no laboratório",
      ["EXIT_LABS"] = "~b~E~s~ - Saia do laboratório",
      ["SELL_DRUGS"] = "~b~E~s~ - Vender drogas",
      ["DRUG_DEALER"] = "~b~E~s~ - Traficante de drogas",
      ["SEE_COCAINE"] = "~b~E~s~ - Recolher cocaína",
      ["SEE_MARIHUANA"] = "~b~E~s~ - Colete maconha",
      ["SEE_METH"] = "~b~E~s~ - Colete produtos químicos",
      ["NO_POLICE"] = "Não há policiais suficientes",
      ["SELECT_OPTION"] = "Que tipo de venda você deseja fazer?",
      ["YOU_CHOOSE"] = "Temos duas opções de venda, você escolhe o campeão...",
      ["INTERESTED_BUYER"] = "~b~E~s~ - Atacadista | ~b~G~s~ - Varejista",
      ["BUY_CAR"] = "Se você quiser vender tanto, deve comprar um carro por ~g~$",
      ["BUY_CUSTOMER"] = "Posso fornecer informações de um comprador para ~g~$",
      ["ACCEPT_REJECT"] = "~b~E~s~ - Aceitar | ~b~G~s~ - Rejeitar",
      ["CANCEL_MISSION"] = "~b~E~s~ - Cancelar entrega",
      ["SAVE_VEHICLE"] = "~b~E~s~ - Salvar veículo",
      ["OPEN_TRUNK"] = "~b~E~s~ - tronco aberto",
      ["CLOSE_GIVE"] = "~b~E~s~ - Fechar tronco | ~b~G~s~ - Tirar as drogas",
      ["CUSTOMER_STEAL"] = "~b~E~s~ - Dê drogas | ~b~G~s~ - Tente escapar",
      ["SAVE_DRUGS"] = "~b~E~s~ - Você guarda as drogas no porta-malas",
      ["PARK_VEHICLE"] = "~b~E~s~ - Estacionar",
      ["UNPARK_VEHICLE"] = "~b~E~s~ - Saia do estacionamento",
      ["DRUG_TRUNK_TEXT"] = "Tire as drogas do porta-malas",
      ["CUSTOMER_GIVE"] = "~b~E~s~ - Entregar drogas",

      ["POLICE_NOTIFY"] = "Houve venda de drogas em",
      ["INSUFFICIENT_ITEM"] = "Você não tem o suficiente",
      ["CUSTOMER_ON_DRUGS"] = "O cliente estava muito caro e pagou o dobro",
      ["NO_DRUGS"] = "Você não tem drogas suficientes",
      ["INSUFFICIENT_DRUG"] = "Você não tem medicamento suficiente, você precisa do mínimo",
      ["YOU_CANCEL"] = "Você cancelou uma tarefa com drogas!",
      ["POLICE_ALERT"] = "O vendedor chamou a polícia!",
      ["SAVE_CAR"] = "Primeiro deixe o veículo na garagem!",
      ["SELL_DONE"] = "Você não tem mais drogas, o pedido está feito",
      ["WAITING_ORDER"] = "Você está esperando o pedido do distribuidor...",
      ["FAKE_CUSTOMER"] = "O comprador é um ladrão!",
      ["NO_CAR"] = "Este veículo não é seu",
      ["ORDER_CANCELED"] = "Pedido cancelado",
      ["STEAL_DRUGS"] = "Todas as suas drogas foram roubadas",
      ["NO_MONEY"] = "Você não tem dinheiro suficiente",
      ["LEAVE_CAR"] = "Saia do veículo!",
      ["NO_DRUGS_TRUNK"] = "Não há drogas aqui",
      ["FIND_CUSTOMER"] = "Encontrei um cliente, vá conhecê-lo",
      ["CUSTOMER_PURCHASE"] = "Procure o comprador para vender os medicamentos",
      ["RETURN_VEHICLE"] = "Você terminou a tarefa, volte para a base para devolver o veículo",
      ["YOU_NO_DRUGS"] = "Você não tem drogas, volte para a base e devolva o veículo.",
      ["VEHICLE_SPAWN"] = "O veículo está esperando perto do armazém perto da escada, dirija até o local designado...",
      ["YOU_NEED"] = "Você precisa ter no mínimo:",
      ["SELL_WEED"] = "Você vendeu maconha por $",
      ["SELL_METH"] = "Você vendeu metanfetamina por $",
      ["SELL_COCAINE"] = "Você vendeu cocaína por $",

      ["OPEN_TRUNK_BAR"] = "Abrindo o porta-malas...",
      ["CLOSE_TRUNK_BAR"] = "Fechando o porta-malas...",
      ["TAKE_DRUGS_BAR"] = "Tirando as drogas da maconha...",
      ["SAVE_DRUGS_BAR"] = "Salvando as drogas da mercearia...",
      ["TALKING_BAR"] = "Conversando com o comprador...",
      ["COLLECT_MARIHUANA"] = "Coletando maconha...",
      ["COLLECT_METH"] = "Coletando metanfetamina...",
      ["COLLECT_COCAINE"] = "Coletando cocaína...",
  },

  ['fr'] = {
      ["ENTER_LABS"] = "~b~E~s~ - Entrez dans le labo",
      ["EXIT_LABS"] = "~b~E~s~ - Quittez le labo",
      ["SELL_DRUGS"] = "~b~E~s~ - Vendre de la drogue",
      ["DRUG_DEALER"] = "~b~E~s~ - Trafiquant de drogue",
      ["SEE_COCAINE"] = "~b~E~s~ - Collecter de la cocaïne",
      ["SEE_MARIHUANA"] = "~b~E~s~ - Collecter de la marijuana",
      ["SEE_METH"] = "~b~E~s~ - Collecter des produits chimiques",
      ["NO_POLICE"] = "Il n'y a pas assez de policiers",
      ["SELECT_OPTION"] = "Quel type de vente voulez-vous faire ?",
      ["YOU_CHOOSE"] = "Nous avons deux options de vente, vous choisissez le champion...",
      ["INTERESTED_BUYER"] = "~b~E~s~ - Grossiste | ~b~G~s~ - Détaillant",
      ["BUY_CAR"] = "Si vous voulez vendre autant, vous devez acheter une voiture pour ~g~$",
      ["BUY_CUSTOMER"] = "Je peux vous donner les informations d'un acheteur pour ~g~$",
      ["ACCEPT_REJECT"] = "~b~E~s~ - Accepter | ~b~G~s~ - Rejeter",
      ["CANCEL_MISSION"] = "~b~E~s~ - Annuler la livraison",
      ["SAVE_VEHICLE"] = "~b~E~s~ - Enregistrer le véhicule",
      ["OPEN_TRUNK"] = "~b~E~s~ - Ouvrir le coffre",
      ["CLOSE_GIVE"] = "~b~E~s~ - Fermez le coffre | ~b~G~s~ - Sortez les médicaments",
      ["CUSTOMER_STEAL"] = "~b~E~s~ - Donner de la drogue | ~b~G~s~ - Essayer de s'échapper",
      ["SAVE_DRUGS"] = "~b~E~s~ - Vous gardez de la drogue dans le coffre",
      ["PARK_VEHICLE"] = "~b~E~s~ - Stationnement",
      ["UNPARK_VEHICLE"] = "~b~E~s~ - Sortez du parking",
      ["DRUG_TRUNK_TEXT"] = "Sortez les médicaments du coffre",
      ["CUSTOMER_GIVE"] = "~b~E~s~ - Livrer des médicaments",

      ["POLICE_NOTIFY"] = "Il y a eu des ventes de médicaments en",
      ["INSUFFICIENT_ITEM"] = "Vous n'en avez pas assez",
      ["CUSTOMER_ON_DRUGS"] = "Le client était très élevé et a payé le double",
      ["NO_DRUGS"] = "Vous n'avez pas assez de médicaments",
      ["INSUFFICIENT_DRUG"] = "Vous n'avez pas assez de médicament, il vous en faut un minimum",
      ["YOU_CANCEL"] = "Vous avez annulé une course de drogue !",
      ["POLICE_ALERT"] = "Le vendeur a appelé la police !",
      ["SAVE_CAR"] = "Laissez d'abord le véhicule au garage !",
      ["SELL_DONE"] = "Vous n'avez plus de médicaments, la commande est passée",
      ["WAITING_ORDER"] = "Vous attendez la commande du distributeur...",
      ["FAKE_CUSTOMER"] = "L'acheteur s'est avéré être un voleur !",
      ["NO_CAR"] = "Ce véhicule n'est pas le vôtre",
      ["ORDER_CANCELED"] = "Commande annulée",
      ["STEAL_DRUGS"] = "Tous vos médicaments ont été volés",
      ["NO_MONEY"] = "Vous n'avez pas assez d'argent",
      ["LEAVE_CAR"] = "Descendez du véhicule !",
      ["NO_DRUGS_TRUNK"] = "Il n'y a pas de drogue ici",
      ["FIND_CUSTOMER"] = "J'ai trouvé un client, va le rencontrer",
      ["CUSTOMER_PURCHASE"] = "Recherchez l'acheteur pour vendre les médicaments",
      ["RETURN_VEHICLE"] = "Vous avez terminé la course, retournez à la base pour rendre le véhicule",
      ["YOU_NO_DRUGS"] = "Vous n'avez pas de drogue, retournez à la base et restituez le véhicule.",
      ["VEHICLE_SPAWN"] = "Le véhicule attend près de l'entrepôt près des escaliers, conduisez jusqu'à l'endroit désigné...",
      ["YOU_NEED"] = "Vous devez avoir au minimum :",
      ["SELL_WEED"] = "Vous avez vendu de la marijuana pour $",
      ["SELL_METH"] = "Vous avez vendu de la méthamphétamine pour $",
      ["SELL_COCAINE"] = "Vous avez vendu de la cocaïne pour $",

      ["OPEN_TRUNK_BAR"] = "Ouverture du coffre...",
      ["CLOSE_TRUNK_BAR"] = "Fermeture du coffre...",
      ["TAKE_DRUGS_BAR"] = "Sortir les médicaments du pot...",
      ["SAVE_DRUGS_BAR"] = "Sauvegarder les médicaments de l'épicier...",
      ["TALKING_BAR"] = "Parler à l'acheteur...",
      ["COLLECT_MARIHUANA"] = "Collecter de la marijuana...",
      ["COLLECT_METH"] = "Collecte de méthamphétamine...",
      ["COLLECT_COCAINE"] = "Collecte de cocaïne...",
  },

  ['it'] = {
      ["ENTER_LABS"] = "~b~E~s~ - Entra nel laboratorio",
      ["EXIT_LABS"] = "~b~E~s~ - Esci dal laboratorio",
      ["SELL_DRUGS"] = "~b~E~s~ - Vendi droghe",
      ["DRUG_DEALER"] = "~b~E~s~ - Spacciatore",
      ["SEE_COCAINE"] = "~b~E~s~ - Raccogli cocaina",
      ["SEE_MARIHUANA"] = "~b~E~s~ - Raccogli marijuana",
      ["SEE_METH"] = "~b~E~s~ - Raccogli sostanze chimiche",
      ["NO_POLICE"] = "Non ci sono abbastanza poliziotti",
      ["SELECT_OPTION"] = "Che tipo di vendita vuoi fare?",
      ["YOU_CHOOSE"] = "Abbiamo due opzioni di vendita, scegli il campione...",
      ["INTERESTED_BUYER"] = "~b~E~s~ - Grossista | ~b~G~s~ - Rivenditore",
      ["BUY_CAR"] = "Se vuoi vendere così tanto, devi comprare un'auto per ~g~$",
      ["BUY_CUSTOMER"] = "Posso fornirti le informazioni di un acquirente per ~g~$",
      ["ACCEPT_REJECT"] = "~b~E~s~ - Accetta | ~b~G~s~ - Rifiuta",
      ["CANCEL_MISSION"] = "~b~E~s~ - Annulla la consegna",
      ["SAVE_VEHICLE"] = "~b~E~s~ - Salva veicolo",
      ["OPEN_TRUNK"] = "~b~E~s~ - Aprire il bagagliaio",
      ["CLOSE_GIVE"] = "~b~E~s~ - Chiudi tronco | ~b~G~s~ - Togli le droghe",
      ["CUSTOMER_STEAL"] = "~b~E~s~ - Dare droghe | ~b~G~s~ - Prova a scappare",
      ["SAVE_DRUGS"] = "~b~E~s~ - Tieni la droga nel bagagliaio",
      ["PARK_VEHICLE"] = "~b~E~s~ - Parco",
      ["UNPARK_VEHICLE"] = "~b~E~s~ - Esci dal parcheggio",
      ["DRUG_TRUNK_TEXT"] = "Togli la droga dal bagagliaio",
      ["CUSTOMER_GIVE"] = "~b~E~s~ - Consegna farmaci",

      ["POLICE_NOTIFY"] = "Ci sono state vendite di farmaci in",
      ["INSUFFICIENT_ITEM"] = "Non ne hai abbastanza",
      ["CUSTOMER_ON_DRUGS"] = "Il cliente era molto alto e ha pagato il doppio",
      ["NO_DRUGS"] = "Non hai abbastanza droghe",
      ["INSUFFICIENT_DRUG"] = "Non hai abbastanza droga, ti serve il minimo",
      ["YOU_CANCEL"] = "Hai annullato una commissione sulla droga!",
      ["POLICE_ALERT"] = "Il venditore ha chiamato la polizia!",
      ["SAVE_CAR"] = "Prima lascia il veicolo in garage!",
      ["SELL_DONE"] = "Non hai più droghe, l'ordine è fatto",
      ["WAITING_ORDER"] = "Stai aspettando l'ordine dal distributore...",
      ["FAKE_CUSTOMER"] = "L'acquirente si è rivelato essere un ladro!",
      ["NO_CAR"] = "Questo veicolo non è tuo",
      ["ORDER_CANCELED"] = "Ordine annullato",
      ["STEAL_DRUGS"] = "Tutte le tue droghe sono state rubate",
      ["NO_MONEY"] = "Non hai abbastanza soldi",
      ["LEAVE_CAR"] = "Scendi dal veicolo!",
      ["NO_DRUGS_TRUNK"] = "Non ci sono droghe qui",
      ["FIND_CUSTOMER"] = "Ho trovato un cliente, vai a conoscerlo",
      ["CUSTOMER_PURCHASE"] = "Cerca l'acquirente per vendere i farmaci",
      ["RETURN_VEHICLE"] = "Hai terminato la commissione, torna alla base per restituire il veicolo",
      ["YOU_NO_DRUGS"] = "Non hai droghe, torna alla base e restituisci il veicolo.",
      ["VEHICLE_SPAWN"] = "Il veicolo è in attesa vicino al magazzino vicino alle scale, guida fino al luogo designato...",
      ["YOU_NEED"] = "Devi avere almeno:",
      ["SELL_WEED"] = "Hai venduto marijuana per $",
      ["SELL_METH"] = "Hai venduto metanfetamine per $",
      ["SELL_COCAINE"] = "Hai venduto cocaina per $",

      ["OPEN_TRUNK_BAR"] = "Apre il bagagliaio...",
      ["CLOSE_TRUNK_BAR"] = "Chiusura bagagliaio...",
      ["TAKE_DRUGS_BAR"] = "Togliere le droghe dal vaso...",
      ["SAVE_DRUGS_BAR"] = "Salvare la droga dal droghiere...",
      ["TALKING_BAR"] = "Parlando con l'acquirente...",
      ["COLLECT_MARIHUANA"] = "Raccolta marijuana...",
      ["COLLECT_METH"] = "Raccolta metanfetamine...",
      ["COLLECT_COCAINE"] = "Raccolta cocaina...",
  },

  ['tr'] = {
      ["ENTER_LABS"] = "~b~E~s~ - Laboratuvara girin",
      ["EXIT_LABS"] = "~b~E~s~ - Laboratuvardan çıkın",
      ["SELL_DRUGS"] = "~b~E~s~ - Uyuşturucu sat",
      ["DRUG_DEALER"] = "~b~E~s~ - Uyuşturucu satıcısı",
      ["SEE_COCAINE"] = "~b~E~s~ - Kokain toplayın",
      ["SEE_MARIHUANA"] = "~b~E~s~ - Esrar toplayın",
      ["SEE_METH"] = "~b~E~s~ - Kimyasalları toplayın",
      ["NO_POLICE"] = "Yeterli polis memuru yok",
      ["SELECT_OPTION"] = "Ne tür bir satış yapmak istiyorsunuz?",
      ["YOU_CHOOSE"] = "İki satış seçeneğimiz var, şampiyonu siz seçin...",
      ["INTERESTED_BUYER"] = "~b~E~s~ - Toptancı | ~b~G~s~ - Perakendeci",
      ["BUY_CAR"] = "Bu kadar satmak istiyorsanız ~g~$'a araba almalısınız",
      ["BUY_CUSTOMER"] = "Size ~g~$ için bir alıcının bilgilerini verebilirim",
      ["ACCEPT_REJECT"] = "~b~E~s~ - Kabul Et | ~b~G~s~ - Reddet",
      ["CANCEL_MISSION"] = "~b~E~s~ - Teslimatı iptal et",
      ["SAVE_VEHICLE"] = "~b~E~s~ - Aracı kaydet",
      ["OPEN_TRUNK"] = "~b~E~s~ - Bagajı aç",
      ["CLOSE_GIVE"] = "~b~E~s~ - Bagajı kapat | ~b~G~s~ - Uyuşturucuları çıkar",
      ["CUSTOMER_STEAL"] = "~b~E~s~ - Uyuşturucu verin | ~b~G~s~ - Kaçmaya çalışın",
      ["SAVE_DRUGS"] = "~b~E~s~ - Uyuşturucuları bagajda tutuyorsunuz",
      ["PARK_VEHICLE"] = "~b~E~s~ - Park",
      ["UNPARK_VEHICLE"] = "~b~E~s~ - Otoparktan çıkın",
      ["DRUG_TRUNK_TEXT"] = "Uyuşturucuları bagajdan çıkarın",
      ["CUSTOMER_GIVE"] = "~b~E~s~ - İlaçları teslim edin",

      ["POLICE_NOTIFY"] = "İçinde uyuşturucu satışı oldu",
      ["INSUFFICIENT_ITEM"] = "Yeterliniz yok",
      ["CUSTOMER_ON_DRUGS"] = "Müşteri çok yüksekti ve iki katı ödeme yaptı",
      ["NO_DRUGS"] = "Yeterli uyuşturucunuz yok",
      ["INSUFFICIENT_DRUG"] = "Yeterli ilacınız yok, minimuma ihtiyacınız var",
      ["YOU_CANCEL"] = "Bir uyuşturucu işini iptal ettiniz!",
      ["POLICE_ALERT"] = "Satıcı polisi aradı!",
      ["SAVE_CAR"] = "Önce aracı garajda bırakın!",
      ["SELL_DONE"] = "Başka ilacınız yok, sipariş tamamlandı",
      ["WAITING_ORDER"] = "Distribütörden sipariş bekliyorsunuz...",
      ["FAKE_CUSTOMER"] = "Alıcının hırsız olduğu ortaya çıktı!",
      ["NO_CAR"] = "Bu araç sizin değil",
      ["ORDER_CANCELED"] = "Sipariş iptal edildi",
      ["STEAL_DRUGS"] = "Bütün uyuşturucularınız çalındı",
      ["NO_MONEY"] = "Yeterli paranız yok",
      ["LEAVE_CAR"] = "Araçtan inin!",
      ["NO_DRUGS_TRUNK"] = "Burada uyuşturucu yok",
      ["FIND_CUSTOMER"] = "Bir müşteri buldum, onunla tanışın",
      ["CUSTOMER_PURCHASE"] = "Uyuşturucu satacak alıcıyı arayın",
      ["RETURN_VEHICLE"] = "Görevi bitirdiniz, aracı iade etmek için üsse dönün",
      ["YOU_NO_DRUGS"] = "Uyuşturucunuz yok, üsse geri dönün ve aracı iade edin.",
      ["VEHICLE_SPAWN"] = "Araç deponun yanında merdivenlerin yanında bekliyor, belirtilen yere sürün...",
      ["YOU_NEED"] = "Minimum değere sahip olmanız gerekir:",
      ["SELL_WEED"] = "Esrar sattınız $",
      ["SELL_METH"] = "$'a metamfetamin sattınız",
      ["SELL_COCAINE"] = "$'a kokain sattınız",

      ["OPEN_TRUNK_BAR"] = "Bagaj açılıyor...",
      ["CLOSE_TRUNK_BAR"] = "Bagaj kapatılıyor...",
      ["TAKE_DRUGS_BAR"] = "İlaçları pottan çıkarmak...",
      ["SAVE_DRUGS_BAR"] = "Bakkaldaki ilaçları saklamak...",
      ["TALKING_BAR"] = "Alıcıyla konuşuyorum...",
      ["COLLECT_MARIHUANA"] = "Esrar toplanıyor...",
      ["COLLECT_METH"] = "Metamfetamin toplanıyor...",
      ["COLLECT_COCAINE"] = "Kokain toplanıyor...",
  },

  ['de'] = {
      ["ENTER_LABS"] = "~b~E~s~ - Betritt das Labor",
      ["EXIT_LABS"] = "~b~E~s~ - Verlasse das Labor",
      ["SELL_DRUGS"] = "~b~E~s~ - Drogen verkaufen",
      ["DRUG_DEALER"] = "~b~E~s~ - Drogendealer",
      ["SEE_COCAINE"] = "~b~E~s~ - Kokain sammeln",
      ["SEE_MARIHUANA"] = "~b~E~s~ - Marihuana sammeln",
      ["SEE_METH"] = "~b~E~s~ - Chemikalien sammeln",
      ["NO_POLICE"] = "Es gibt nicht genug Polizisten",
      ["SELECT_OPTION"] = "Welche Art von Verkauf möchten Sie tätigen?",
      ["YOU_CHOOSE"] = "Wir haben zwei Verkaufsoptionen, Sie wählen den Champion...",
      ["INTERESTED_BUYER"] = "~b~E~s~ - Großhändler | ~b~G~s~ - Einzelhändler",
      ["BUY_CAR"] = "Wenn Sie so viel verkaufen möchten, müssen Sie ein Auto für ~g~$ kaufen",
      ["BUY_CUSTOMER"] = "Ich kann Ihnen Käuferinformationen für ~g~$ geben",
      ["ACCEPT_REJECT"] = "~b~E~s~ - Akzeptieren | ~b~G~s~ - Ablehnen",
      ["CANCEL_MISSION"] = "~b~E~s~ - Lieferung stornieren",
      ["SAVE_VEHICLE"] = "~b~E~s~ - Fahrzeug retten",
      ["OPEN_TRUNK"] = "~b~E~s~ - Kofferraum öffnen",
      ["CLOSE_GIVE"] = "~b~E~s~ - Kofferraum schließen | ~b~G~s~ - Nimm die Drogen raus",
      ["CUSTOMER_STEAL"] = "~b~E~s~ - Gib Drogen | ~b~G~s~ - Versuche zu entkommen",
      ["SAVE_DRUGS"] = "~b~E~s~ - Du behältst Drogen im Kofferraum",
      ["PARK_VEHICLE"] = "~b~E~s~ - Parken",
      ["UNPARK_VEHICLE"] = "~b~E~s~ - Verlassen Sie den Parkplatz",
      ["DRUG_TRUNK_TEXT"] = "Nimm die Medikamente aus dem Kofferraum",
      ["CUSTOMER_GIVE"] = "~b~E~s~ - Liefere Drogen",

      ["POLICE_NOTIFY"] = "Es gab Drogenverkäufe in",
      ["INSUFFICIENT_ITEM"] = "Du hast nicht genug",
      ["CUSTOMER_ON_DRUGS"] = "Der Kunde war sehr hoch und hat das Doppelte bezahlt",
      ["NO_DRUGS"] = "Du hast nicht genug Drogen",
      ["INSUFFICIENT_DRUG"] = "Du hast nicht genug Medikamente, du brauchst ein Minimum",
      ["YOU_CANCEL"] = "Sie haben eine Drogenbesorgung storniert!",
      ["POLICE_ALERT"] = "Der Verkäufer hat die Polizei gerufen!",
      ["SAVE_CAR"] = "Lass das Fahrzeug zuerst in der Garage!",
      ["SELL_DONE"] = "Sie haben keine Medikamente mehr, die Bestellung ist erledigt",
      ["WAITING_ORDER"] = "Sie warten auf die Bestellung vom Distributor...",
      ["FAKE_CUSTOMER"] = "Der Käufer stellte sich als Dieb heraus!",
      ["NO_CAR"] = "Dieses Fahrzeug gehört nicht Ihnen",
      ["ORDER_CANCELED"] = "Bestellung storniert",
      ["STEAL_DRUGS"] = "Alle deine Drogen wurden gestohlen",
      ["NO_MONEY"] = "Du hast nicht genug Geld",
      ["LEAVE_CAR"] = "Runter aus dem Fahrzeug!",
      ["NO_DRUGS_TRUNK"] = "Hier gibt es keine Drogen",
      ["FIND_CUSTOMER"] = "Ich habe einen Kunden gefunden, geh ihn treffen",
      ["CUSTOMER_PURCHASE"] = "Suchen Sie nach dem Käufer, der die Medikamente verkauft",
      ["RETURN_VEHICLE"] = "Ihr habt die Besorgung erledigt, kehrt zur Basis zurück, um das Fahrzeug zurückzugeben",
      ["YOU_NO_DRUGS"] = "Du hast keine Drogen, geh zurück zur Basis und bring das Fahrzeug zurück.",
      ["VEHICLE_SPAWN"] = "Das Fahrzeug wartet in der Nähe des Lagerhauses in der Nähe der Treppe, fahre zum vorgesehenen Ort...",
      ["YOU_NEED"] = "Sie benötigen mindestens:",
      ["SELL_WEED"] = "Du hast Marihuana für $ verkauft",
      ["SELL_METH"] = "Sie haben Methamphetamin für $ verkauft",
      ["SELL_COCAINE"] = "Du hast Kokain für $ verkauft",

      ["OPEN_TRUNK_BAR"] = "Kofferraum öffnen...",
      ["CLOSE_TRUNK_BAR"] = "Kofferraum schließen...",
      ["TAKE_DRUGS_BAR"] = "Die Drogen aus dem Topf nehmen...",
      ["SAVE_DRUGS_BAR"] = "Die Drogen vom Lebensmittelhändler retten...",
      ["TALKING_BAR"] = "Mit dem Käufer sprechen...",
      ["COLLECT_MARIHUANA"] = "Marihuana sammeln...",
      ["COLLECT_METH"] = "Methamphetamin sammeln...",
      ["COLLECT_COCAINE"] = "Kokain sammeln...",
  },

  ['ru'] = {
      ["ENTER_LABS"] = "~b~E~s~ - Войдите в лабораторию",
      ["EXIT_LABS"] = "~b~E~s~ - Выйти из лаборатории",
      ["SELL_DRUGS"] = "~b~E~s~ - Продавать наркотики",
      ["DRUG_DEALER"] = "~b~E~s~ - Торговец наркотиками",
      ["SEE_COCAINE"] = "~b~E~s~ - Соберите кокаин",
      ["SEE_MARIHUANA"] = "~b~E~s~ - Собирать марихуану",
      ["SEE_METH"] = "~b~E~s~ - Собирать химикаты",
      ["NO_POLICE"] = "Полицейских не хватает",
      ["SELECT_OPTION"] = "Какую продажу вы хотите совершить?",
      ["YOU_CHOOSE"] = "У нас есть два варианта продажи, вы выбираете чемпиона...",
      ["INTERESTED_BUYER"] = "~b~E~s~ - Оптовый продавец | ~b~G~s~ - Розничный продавец",
      ["BUY_CAR"] = "Если вы хотите продать столько, вы должны купить машину за ~g~$",
      ["BUY_CUSTOMER"] = "Я могу предоставить вам информацию о покупателе за ~g~$",
      ["ACCEPT_REJECT"] = "~b~E~s~ - Принять | ~b~G~s~ - Отклонить",
      ["CANCEL_MISSION"] = "~b~E~s~ - Отменить доставку",
      ["SAVE_VEHICLE"] = "~b~E~s~ - Сохранить машину",
      ["OPEN_TRUNK"] = "~b~E~s~ - Открыть багажник",
      ["CLOSE_GIVE"] = "~b~E~s~ - Закройте багажник | ~b~G~s~ - Выньте наркотики",
      ["CUSTOMER_STEAL"] = "~b~E~s~ - Дать наркотики | ~b~G~s~ - Попытаться сбежать",
      ["SAVE_DRUGS"] = "~b~E~s~ - Вы храните наркотики в багажнике",
      ["PARK_VEHICLE"] = "~b~E~s~ - Парк",
      ["UNPARK_VEHICLE"] = "~b~E~s~ - Выйти с парковки",
      ["DRUG_TRUNK_TEXT"] = "Вынуть лекарства из багажника",
      ["CUSTOMER_GIVE"] = "~b~E~s~ - Доставить наркотики",

      ["POLICE_NOTIFY"] = "В",
      ["INSUFFICIENT_ITEM"] = "Вам мало",
      ["CUSTOMER_ON_DRUGS"] = "Клиент получил очень много денег и заплатил вдвое",
      ["NO_DRUGS"] = "У вас недостаточно наркотиков",
      ["INSUFFICIENT_DRUG"] = "У вас недостаточно лекарства, вам нужен минимум",
      ["YOU_CANCEL"] = "Вы отменили заказ с наркотиками!",
      ["POLICE_ALERT"] = "Продавец вызвал полицию!",
      ["SAVE_CAR"] = "Сначала оставьте машину в гараже!",
      ["SELL_DONE"] = "У вас больше нет лекарств, заказ выполнен",
      ["WAITING_ORDER"] = "Вы ждете заказа от дистрибьютора...",
      ["FAKE_CUSTOMER"] = "Покупатель оказался вором!",
      ["NO_CAR"] = "Этот автомобиль не ваш",
      ["ORDER_CANCELED"] = "Заказ отменен",
      ["STEAL_DRUGS"] = "Все ваши наркотики украдены",
      ["NO_MONEY"] = "У вас недостаточно денег",
      ["LEAVE_CAR"] = "Выйти из машины!",
      ["NO_DRUGS_TRUNK"] = "Здесь нет наркотиков",
      ["FIND_CUSTOMER"] = "Я нашел клиента, иди познакомься с ним",
      ["CUSTOMER_PURCHASE"] = "Ищите покупателя для продажи лекарств",
      ["RETURN_VEHICLE"] = "Вы выполнили поручение, вернитесь на базу, чтобы вернуть машину",
      ["YOU_NO_DRUGS"] = "У вас нет наркотиков, вернитесь на базу и верните машину.",
      ["VEHICLE_SPAWN"] = "Автомобиль ждет возле склада возле лестницы, езжайте в назначенное место...",
      ["YOU_NEED"] = "У вас должно быть минимум:",
      ["SELL_WEED"] = "Вы продали марихуану за $",
      ["SELL_METH"] = "Вы продали метамфетамин за $",
      ["SELL_COCAINE"] = "Вы продали кокаин за $",

      ["OPEN_TRUNK_BAR"] = "Открытие ствола...",
      ["CLOSE_TRUNK_BAR"] = "Закрытие ствола...",
      ["TAKE_DRUGS_BAR"] = "Достать наркотики из кастрюли...",
      ["SAVE_DRUGS_BAR"] = "Спасение лекарств от бакалейщика...",
      ["TALKING_BAR"] = "Разговор с покупателем...",
      ["COLLECT_MARIHUANA"] = "Сбор марихуаны...",
      ["COLLECT_METH"] = "Сбор метамфетамина...",
      ["COLLECT_COCAINE"] = "Сбор кокаина...",
  },
}

-- Animation dicts for scenes.
SceneDicts = {
  Cocaine = {
    [1] = 'anim@amb@business@coc@coc_unpack_cut_left@',
    [2] = 'anim@amb@business@coc@coc_packing_hi@',
  },
  Meth = {
    [1] = 'anim@amb@business@meth@meth_monitoring_cooking@cooking@',
    [2] = 'anim@amb@business@meth@meth_smash_weight_check@',
  },
  Weed = {
    [1] = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
    [2] = 'anim@amb@business@weed@weed_sorting_seated@',
  }, 
}

-- Animation for player within scenes.
PlayerAnims = {
  Cocaine = {
    [1] = 'coke_cut_v5_coccutter',
    [2] = 'full_cycle_v3_pressoperator'
  },
  Meth = {
    [1] = 'chemical_pour_short_cooker',
    [2] = 'break_weigh_v3_char01',
  },
  Weed = {
    [1] = 'weed_spraybottle_crouch_spraying_02_inspector',
    [2] = "sorter_right_sort_v3_sorter02",
  }, 
}

-- Animation for entities within scenes.
SceneAnims = {
  Cocaine = {
    [1] = {
      bakingsoda  = 'coke_cut_v5_bakingsoda',
      creditcard1 = 'coke_cut_v5_creditcard',
      creditcard2 = 'coke_cut_v5_creditcard^1',     
    },
    [2] = {
      scoop     = 'full_cycle_v3_scoop',
      box1      = 'full_cycle_v3_FoldedBox',
      dollmold  = 'full_cycle_v3_dollmould',
      dollcast1 = 'full_cycle_v3_dollcast',
      dollcast2 = 'full_cycle_v3_dollCast^1',
      dollcast3 = 'full_cycle_v3_dollCast^2',
      dollcast4 = 'full_cycle_v3_dollCast^3',
      press     = 'full_cycle_v3_cokePress',
      doll      = 'full_cycle_v3_cocdoll',
      bowl      = 'full_cycle_v3_cocbowl',
      boxed     = 'full_cycle_v3_boxedDoll',
    },
  },
  Meth = {
    [1] = {
      ammonia   = 'chemical_pour_short_ammonia',
      clipboard = 'chemical_pour_short_clipboard',
      pencil    = 'chemical_pour_short_pencil',
      sacid     = 'chemical_pour_short_sacid',
    },
    [2] = {
      box1      = 'break_weigh_v3_box01',
      box2      = 'break_weigh_v3_box01^1',
      clipboard = 'break_weigh_v3_clipboard',
      methbag1  = 'break_weigh_v3_methbag01',
      methbag2  = 'break_weigh_v3_methbag01^1',
      methbag3  = 'break_weigh_v3_methbag01^2',
      methbag4  = 'break_weigh_v3_methbag01^3',
      methbag5  = 'break_weigh_v3_methbag01^4',
      methbag6  = 'break_weigh_v3_methbag01^5',
      methbag7  = 'break_weigh_v3_methbag01^6',
      pen       = 'break_weigh_v3_pen',
      scale     = 'break_weigh_v3_scale',
      scoop     = 'break_weigh_v3_scoop',     
    },
  },
  Weed = {
    [1] = {},
    [2] = {
      weeddry1  = 'sorter_right_sort_v3_weeddry01a',
      weeddry2  = 'sorter_right_sort_v3_weeddry01a^1',
      weedleaf1 = 'sorter_right_sort_v3_weedleaf01a',
      weedleaf2 = 'sorter_right_sort_v3_weedleaf01a^1',
      weedbag   = 'sorter_right_sort_v3_weedbag01a',
      weedbud1a = 'sorter_right_sort_v3_weedbud02b',
      weedbud2a = 'sorter_right_sort_v3_weedbud02b^1',
      weedbud3a = 'sorter_right_sort_v3_weedbud02b^2',
      weedbud4a = 'sorter_right_sort_v3_weedbud02b^3',
      weedbud5a = 'sorter_right_sort_v3_weedbud02b^4',
      weedbud6a = 'sorter_right_sort_v3_weedbud02b^5',
      weedbud1b = 'sorter_right_sort_v3_weedbud02a',
      weedbud2b = 'sorter_right_sort_v3_weedbud02a^1',
      weedbud3b = 'sorter_right_sort_v3_weedbud02a^2',
      bagpile   = 'sorter_right_sort_v3_weedbagpile01a',
      weedbuck  = 'sorter_right_sort_v3_bucket01a',
      weedbuck  = 'sorter_right_sort_v3_bucket01a^1',
    },
  },
}

-- Objects for entities within scenes.
SceneItems = {
  Cocaine = {
    [1] = {
      bakingsoda  = 'bkr_prop_coke_bakingsoda_o',
      creditcard1 = 'prop_cs_credit_card',
      creditcard2 = 'prop_cs_credit_card',
    },
    [2] = {
      scoop     = 'bkr_prop_coke_fullscoop_01a',
      doll      = 'bkr_prop_coke_doll',
      boxed     = 'bkr_prop_coke_boxedDoll',
      dollcast1 = 'bkr_prop_coke_dollCast',
      dollcast2 = 'bkr_prop_coke_dollCast',
      dollcast3 = 'bkr_prop_coke_dollCast',
      dollcast4 = 'bkr_prop_coke_dollCast',
      dollmold  = 'bkr_prop_coke_dollmould',
      bowl      = 'bkr_prop_coke_fullmetalbowl_02',
      press     = 'bkr_prop_coke_press_01b',      
      box1      = 'bkr_prop_coke_dollboxfolded',
    },
  },
  Meth = {
    [1] = {
      ammonia   = 'bkr_prop_meth_ammonia',
      clipboard = 'bkr_prop_fakeid_clipboard_01a',
      pencil    = 'bkr_prop_fakeid_penclipboard',
      sacid     = 'bkr_prop_meth_sacid',
    },
    [2] = {
      box1      = 'bkr_prop_meth_bigbag_04a',
      box2      = 'bkr_prop_meth_bigbag_03a',
      clipboard = 'bkr_prop_fakeid_clipboard_01a',
      methbag1  = 'bkr_prop_meth_openbag_02',
      methbag2  = 'bkr_prop_meth_openbag_02',
      methbag3  = 'bkr_prop_meth_openbag_02',
      methbag4  = 'bkr_prop_meth_openbag_02',
      methbag5  = 'bkr_prop_meth_openbag_02',
      methbag6  = 'bkr_prop_meth_openbag_02',
      methbag7  = 'bkr_prop_meth_openbag_02',
      pen       = 'bkr_prop_fakeid_penclipboard',
      scale     = 'bkr_prop_coke_scale_01',
      scoop     = 'bkr_prop_meth_scoop_01a',     
    },
  },
  Weed = {
    [1] = {},
    [2] = {
      weeddry1  = 'bkr_prop_weed_dry_01a',
      weeddry2  = 'bkr_prop_weed_dry_01a',
      weedleaf1 = 'bkr_prop_weed_leaf_01a',
      weedleaf2 = 'bkr_prop_weed_leaf_01a',
      weedbag   = 'bkr_prop_weed_bag_01a',
      weedbud1a = 'bkr_prop_weed_bud_02b',
      weedbud2a = 'bkr_prop_weed_bud_02b',
      weedbud3a = 'bkr_prop_weed_bud_02b',
      weedbud4a = 'bkr_prop_weed_bud_02b',
      weedbud5a = 'bkr_prop_weed_bud_02b',
      weedbud6a = 'bkr_prop_weed_bud_02b',
      weedbud1b = 'bkr_prop_weed_bud_02a',
      weedbud2b = 'bkr_prop_weed_bud_02a',
      weedbud3b = 'bkr_prop_weed_bud_02a',
      bagpile   = 'bkr_prop_weed_bag_pile_01a',
      weedbuck  = 'bkr_prop_weed_bucket_open_01a',
      weedbuck  = 'bkr_prop_weed_bucket_open_01a',
    },
  },
}

allIpls = {
	-- 			METH LAB

	{
		names = {"bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo"},
		interiorsProps = {
			
			--"meth_lab_basic",
			--"meth_lab_empty",
			--"meth_lab_production",
			"meth_lab_security_high",
			"meth_lab_setup",
			"meth_lab_upgrade",
			
		},
		coords={{1009.5, -3196.6, -38.99682}}
	},

	-- 			WEED LAB

	{
		interiorsProps = {
			"weed_drying",
			"weed_production",
			--"weed_set_up",
			--"weed_standard_equip",
			"weed_upgrade_equip",
			--"weed_growtha_stage1",
			--"weed_growtha_stage2",
			"weed_growtha_stage3",
			--"weed_growthb_stage1",
			--"weed_growthb_stage2",
			--"weed_growthb_stage3",
			"weed_growthc_stage1",
			--"weed_growthc_stage2",
			--"weed_growthc_stage3",
			"weed_growthd_stage1",
			--"weed_growthd_stage2",
			--"weed_growthd_stage3",
			--"weed_growthe_stage1",
			"weed_growthe_stage2",
			--"weed_growthe_stage3",
			--"weed_growthf_stage1",
			"weed_growthf_stage2",
			--"weed_growthf_stage3",
			"weed_growthg_stage1",
			--"weed_growthg_stage2",
			--"weed_growthg_stage3",
			--"weed_growthh_stage1",
			--"weed_growthh_stage2",
			"weed_growthh_stage3",
			--"weed_growthi_stage1",
			"weed_growthi_stage2",
			--"weed_growthi_stage3",
			"weed_hosea",
			"weed_hoseb",
			"weed_hosec",
			"weed_hosed",
			"weed_hosee",
			"weed_hosef",
			"weed_hoseg",
			"weed_hoseh",
			"weed_hosei",
			--"light_growtha_stage23_standard",
			--"light_growthb_stage23_standard",
			--"light_growthc_stage23_standard",
			--"light_growthd_stage23_standard",
			--"light_growthe_stage23_standard",
			--"light_growthf_stage23_standard",
			--"light_growthg_stage23_standard",
			--"light_growthh_stage23_standard",
			--"light_growthi_stage23_standard",
			"light_growtha_stage23_upgrade",
			"light_growthb_stage23_upgrade",
			"light_growthc_stage23_upgrade",
			"light_growthc_stage23_upgrade",
			"light_growthd_stage23_upgrade",
			"light_growthe_stage23_upgrade",
			"light_growthf_stage23_upgrade",
			"light_growthg_stage23_upgrade",
			"light_growthh_stage23_upgrade",
			"light_growthi_stage23_upgrade",
			--"weed_low_security",
			"weed_security_upgrade",
			"weed_chairs"
		},
		coords={{1051.491, -3196.536, -39.14842}}
	},

	-- 			Cocaine LAB

	{
		interiorsProps = {
			
			"security_low",
			"security_high",
			"equipment_basic",
			"equipment_upgrade",
			"set_up",
			"production_basic",
			"production_upgrade",
			"table_equipment",
			"table_equipment_upgrade",
			--"coke_press_basic",
			"coke_press_upgrade",
			"coke_cut_01",
			"coke_cut_02",
			"coke_cut_03",
			"coke_cut_04",
			"coke_cut_05"
		},
		coords={{1093.6, -3196.6, -38.99841}}
	},
}