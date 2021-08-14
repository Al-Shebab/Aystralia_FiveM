Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 200
Config.Locale       = 'en'

Config.Trucks = {
	"bus",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = 455.97, y = -569.26, z = 28.4},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = 465.46, y = -583.75, z = 28.03},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = 471.44, y = -582.61, z = 28.17},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = {
			Pos   = {x = 402.74, y = -744.47, z = 28.98},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- a coté des flic
	Delivery2LS = {
			Pos   = {x = 396.29, y = -979.4, z = 29.02},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = 140.64, y = -1000.21, z = 29.34},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = 205.22, y = -760.7, z = 32.55},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = 275.86, y = -584.07, z = 42.91},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = 262.7, y = 186.41, z = 104.49},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = 57.58, y = 262.26, z = 109.33},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = -53.4, y = 18.49, z = 71.86},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = -224.91, y = -533.02, z = 34.63},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = -266.89, y = -787.49, z = 31.81},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = -221.77, y = -952.89, z = 28.74},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = -236.93, y = -1148.48, z = 23.28},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x = -113.07, y = -1282.24, z = 28.96},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = -152.32, y = -1377.43, z = 30.43},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = -212.26, y = -1467.57, z = 31.06},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = -159.56, y = -1567.45, z = 34.82},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = -50.97, y = -1813.18, z = 26.57},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = 156.27, y = -1795.55, z = 28.47},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 450
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = 263.4, y = -1692.43, z = 29.16},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 450
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = 278.77, y = -1551.27, z = 28.69},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 450
		},
	
	RetourCamion = {
			Pos   = {x = 473.91, y = -590.05, z = 28.52},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = 473.35, y = -598.73, z = 28.13},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
