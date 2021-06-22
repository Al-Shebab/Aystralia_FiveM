Config                            = {}
Config.DrawDistance               = 50.0
Config.MarkerColor                = { r = 3, g = 173, b = 280 }
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects

Config.Finance			  = false -- using Cryptos esx_finance?
Config.LicensePlate 		  = false  -- using jsfour-licenseplate?

Config.Locale                     = 'en'

Config.PlateLetters  = 2
Config.PlateNumbers  = 2
Config.PlateUseSpace = false

Config.Zones = {

	ShopEntering = {
		Pos   = { x = -33.96, y = -1101.64, z = 26.42 },
		Size  = { x = 1.5, y = 2.5, z = 1.5 },
		Type  = 30,
	},

	ShopInside = {
		Pos     = { x = -44.42, y = -1097.93, z = 26.49 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 243.2,
		Type    = -1,
	},

	ShopOutside = {
		Pos     = { x = -1205.25, y = -1745.56, z = 4.45 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 330.0,
		Type    = -1,
	},

	BossActions = {
		Pos   = { x = -35.78, y = -1113.67, z = 26.42 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 22,
	},

	GiveBackVehicle = {
		Pos   = { x = -1207.27, y = -1744.61, z = 3.45 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1),
	},

	BlankPlate = {
		Pos   = { x = 1828.59, y = 2544.57, z = 44.88 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1,
	},

	MakePlate = {
		Pos   = { x = -1134.8, y = -1696.98, z = 3.45 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1,
	}

}

