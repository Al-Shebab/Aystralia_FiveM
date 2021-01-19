
local cfg = {}
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)

-- each garage type is an associated list of veh_name/veh_definition 
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 1 -- 10% of the original price if a rent
cfg.sell_factor = 0.001 -- sell for 75% of the original price

cfg.garage_types = {
  ["Garage"] = {
    _config = {vtype="car",blipid=357,blipcolor=22},
    ["airtug"] = {"airtug",1, ""},
  },
  ["Dock"] = {
    _config = {vtype="car",blipid=427,blipcolor=26},
    ["rs6"] = {"Audi RS6",70000, ""},
  },
  ["Offshore Mooring"] = {
    _config = {vtype="car",blipid=455,blipcolor=63},
    ["rs6"] = {"Audi RS6",70000, ""},
  },
  ["Truck Storage"] = {
    _config = {vtype="car",blipid=477,blipcolor=40},
    ["stockade4"] = {"Stockade",7000000, ""},
  },
  ["Hangar"] = {
    _config = {vtype="car",blipid=423,blipcolor=44},
    ["stockade4"] = {"Stockade",7000000, ""},
  },
  ["Heliport"] = { 
    _config = {vtype="car",blipid=64,blipcolor=44},
    ["stockade4"] = {"Stockade",7000000, ""},
  },
  ["MET Police Garage"] = {
    _config = {vtype="car",blipid=357,blipcolor=29,radius=3,permissions={"police.vehicle"}},
    ["markedfocusarv"] = {"Ford Focus Marked",0, "MET Police Car"},
    ["unmarkedfocus"] = {"Ford Focus Unmarked",0, "MET Police Car"},
    ["markedsportarv"] = {"Discovery Marked",0, "MET Police Car"},
    ["polaudia6"] = {"Audi A6 Unmarked",0, "MET Police Car"},
    ["insigirv"] = {"Vauxhall Insignia",0, "MET Police Car"},
    ["markedx5"] = {"BMW X5 Marked",0, "MET Police Car"}
  },
  ["NHS Garage"] = {
    _config = {vtype="car",blipid=357,blipcolor=43,permissions={"emergency.vehicle"}},
    ["nhslandrover"] = {"NHS Land Rover",0, "NHS Vehicle"}
  },
  ["MET Police Helicopters"] = {
    _config = {vtype="car",blipid=43,blipcolor=29,radius=5.1,permissions={"police.vehicle"}},
    ["polmav"] = {"Maverick",0, "MET Police Helicopter"}
  },
   ["NHS Helicopters"] = {
    _config = {vtype="car",blipid=43,blipcolor=43,radius=5.1,permissions={"emergency.vehicle"}},
    ["supervolito2"] = {"EMS",0, "NHS Helicopter"}
  },
}

-- {garage_type,x,y,z}
cfg.garages = {
  {"MET Police Garage",451.2121887207,-1018.2822875977,28.495378494263},	-- Mission Row
  {"MET Police Garage",1868.5435791016,3696.0295410156,33.5693359375},  -- sandy shores
  {"MET Police Garage",-476.92425537109,6026.9951171875,31.340547561646},  -- paleto
  {"NHS Garage",283.12725830078,-603.8720703125,43.162460327148}, -- main
  {"NHS Garage",1805.9040527344,3681.3068847656,34.224281311035}, -- sandy shores
  {"Garage",-1457.4909667969,-500.61614990234,32.202766418457}, -- Near the pier, gta online house
  {"Garage",-25.273494720459,-1434.4365234375,30.653142929077}, -- Old Michaels House
  {"Garage",-872.43200683594,-370.17984008789,38.360645294189}, -- Near City Hall
  {"Garage",-2529.9968261719,2336.83203125,33.059936523438}, --Gas Station Near Zancudo
  {"Garage",-819.40551757813,183.72904968262,72.136161804199}, -- Micheals House
  {"Garage",1726.7153320313,-1580.4244384766,112.58283996582}, -- Oil Trader
  {"Garage",928.49084472656,-3207.6369628906,5.9006533622742}, -- Big Docks
  {"Garage",-1578.8157958984,5160.2407226563,19.788028717041}, -- Left side dock
  {"Garage",821.66546630859,-2125.1879882813,29.320899963379}, -- Near Big Docks
  {"Garage",83.772338867188,-2537.408203125,5.9999971389771}, -- Near Big Docks 
  {"Garage",-1020.2636108398,-1428.8166503906,5.0424418449402}, -- Small Docks
  {"Garage",-989.24578857422,-2525.0974121094,13.830768585205}, -- Airport
  {"Garage",567.85260009766,2726.5876464844,42.060104370117}, -- Center of the map, near clothing store
  {"Garage",2579.0590820313,414.54327392578,108.45690155029}, -- East Gas Station
  {"Garage",903.53503417969,-51.385269165039,78.76439666748}, -- Casino
  {"Garage",1607.1862792969,3605.1496582031,35.146236419678}, -- Sandy Hospital
  {"Garage",-3043.9475097656,136.93446350098,11.600332260132}, -- West Coast Garage
  {"Garage",34.620677947998,-1715.4527587891,29.302972793579}, -- Grove Street
  {"Garage",-181.74176025391,-1961.0336914063,27.620422363281}, -- Maze Arena
  {"Garage",1873.2653808594,2584.9982910156,45.672008514404}, -- Prison
  {"Garage",-486.97808837891,-287.17272949219,35.485446929932}, -- City Hall
  {"Garage",-1572.1939697266,-1020.5102539063,13.018452644348}, -- Pier
  {"Garage",2551.6892089844,2619.7744140625,37.944877624512}, -- Dinosaur Near Mine
  {"Garage",-2343.8940429688,288.7131652832,169.46699523926}, -- Maze House Thing
  {"Garage",2480.5893554688,4953.958984375,45.026481628418}, -- Grape Seed
  {"Garage",15.016004562378,547.76171875,176.14279174805}, -- Franklins House
  {"Garage",231.16,-790.82,30.56}, -- Legion Garage
  {"Garage",-479.25997924805,-619.33538818359,31.174425125122}, -- City VIP Area
  {"Garage",684.44097900391,-719.58734130859,25.884830474854}, -- Near the lake/park
  {"Garage",1348.8704833984,1147.8093261719,113.75894927979}, -- Ranch House
  {"Garage",-59.947143554688,-1109.4095458984,26.435819625854}, -- Simeons
  {"Garage",151.28842163086,6583.1162109375,31.846809387207}, -- Paleto
  {"Truck Storage",1139.1376953125,-1288.2924804688,34.606746673584}, --
  {"Truck Storage",173.06140136719,-2988.8117675781,5.8679847717285}, -- 
  {"Truck Storage",706.47296142578,655.35668945313,128.91110229492}, --
  {"Truck Storage",340.54635620117,3564.16015625,33.467140197754}, -- 
  {"Truck Storage",2058.2404785156,3428.240234375,44.255596160889}, -- 
  {"Truck Storage",2681.5776367188,4338.3696289063,45.863460540771}, -- 
  {"Truck Storage",1419.9447021484,6519.4990234375,18.710405349731}, --
  {"Truck Storage",-733.55041503906,5811.322265625,17.446166992188}, -- 
  {"Truck Storage",-2209.0112304688,4251.9682617188,47.413722991943}, -- 
  {"Hangar",-2031.2125244141,2871.9729003906,32.810459136963}, -- Zancudo
  {"Hangar",-953.99377441406,-3169.6420898438,13.984347343445}, -- LSIA Runway 1S
  {"Hangar",-1034.521484375,-3317.7229003906,13.972412109375}, -- LSIA Runway 2S
  {"Hangar",-1367.8380126953,-2265.21484375,13.946773529053}, -- LSIA Runway 1N
  {"Hangar",-1602.6540527344,-2989.7971191406,13.98291683197}, -- LSIA Runway 2N
  {"Hangar",1705.7061767578,3251.0207519531,41.006381988525}, -- Sandy
  {"Hangar",2130.7084960938,4808.2416992188,41.195934295654}, -- Grapeseed
  {"Heliport",-1178.0113525391,-2845.9052734375,13.945742607117}, -- LSIA 1
  {"Heliport",-1145.8765869141,-2864.5642089844,13.946006774902}, -- LSIA 2
  {"Heliport",-1112.7578125,-2883.7185058594,13.946004867554}, -- LSIA 3
  {"Heliport",-745.47326660156,-1468.5598144531,5.0005221366882}, --Heliport 1
  {"Heliport",-724.66046142578,-1443.9251708984,5.0005197525024}, --Heliport 2
  {"Heliport",-746.07727050781,-1433.6199951172,5.0005235671997}, --Heliport 3
  {"Heliport",-762.61846923828,-1453.7171630859,5.0005254745483}, --Heliport 4
  {"Heliport",-722.03247070313,-1472.6169433594,5.0005254745483}, --Heliport 5
  {"Heliport",-700.86437988281,-1447.4008789063,5.0005197525024}, --Heliport 6
  {"Heliport",-74.994903564453,-818.71478271484,326.17553710938}, -- Maze Bank 1
  {"Heliport",-144.56523132324,-593.51416015625,211.77502441406}, -- Maze Bank 2
  {"Heliport",-286.47549438477,-618.26672363281,50.332851409912}, -- Maze Bank 3
  {"Heliport",-913.44030761719,-378.41470336914,137.90567016602}, -- Maze Bank 4
  {"Heliport",-1391.6572265625,-477.80426025391,91.250770568848}, -- Maze Bank 5
  {"Heliport",-1581.9990234375,-569.23919677734,116.3285446167}, -- Maze Bank 6
  {"Heliport",1770.2171630859,3239.5561523438,42.13171005249}, -- Sandy Shores
  {"Heliport",-1859.6247558594,2795.6179199219,32.806461334229}, -- Zancudo 1
  {"Heliport",-1877.1737060547,2805.4145507813,32.806468963623}, -- Zancudo 2
  {"Heliport",2511.2746582031,-426.39294433594,118.18878936768}, -- CIA thing to the roght
  {"Heliport",2510.5537109375,-342.12069702148,118.18634796143}, -- CIA thing to the roght
  {"Heliport",478.31213378906,-3370.1064453125,6.0699057579041}, -- CIA thing to the roght
  {"Dock",-1793.7189941406,-1230.7702636719,0.1}, -- Pier
  {"Dock",-738.31433105469,-1373.4332275391,0.1}, -- Helipad Dock
  {"Dock",-3114.5056152344,23.539577484131,0.1}, -- ??
  {"Dock",-1597.662109375,5261.4301757813,0.1}, -- Helipad Dock
  {"Dock",-296.63061523438,6659.703125,0.1}, -- Paleto
  {"Dock",3878.017578125,4446.09765625,0.1}, -- Helipad Dock   
  {"Dock",-8.9526662826538,-2796.7956542969,0.1}, -- Helipad Dock
  {"Dock",-2089.40234375,2592.5334472656,0.1}, -- Helipad Dock
  {"Offshore Mooring",-287.86508178711,-4047.1955566406,-0.58315031528473},
  {"Offshore Mooring",-3767.6223144531,608.91619873047,-0.50989142656326},
  {"Offshore Mooring",1196.0159912109,7530.5239257813,-0.55188046693802},
  {"Offshore Mooring",4183.3725585938,2249.8288574219,0.50446220040321},
}

return cfg
