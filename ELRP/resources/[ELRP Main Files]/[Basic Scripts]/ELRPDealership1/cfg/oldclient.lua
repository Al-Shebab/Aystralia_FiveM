
vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")
heading = 0

function deleteVehiclePedIsIn()
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  SetVehicleHasBeenOwnedByPlayer(v,false)
  Citizen.InvokeNative(0xAD738C3085FE7E11, v, false, true) -- set not as mission entity
  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
end

RegisterNetEvent( 'wk:deleteVehicle2' )
AddEventHandler( 'wk:deleteVehicle2', function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then 
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else 
                	ShowNotification( "Vehicle deleted." )
                end 
            else 
                ShowNotification( "You must be in the driver's seat!" )
            end 
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then 
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else 
                	ShowNotification( "Vehicle deleted." )
                end 
            else 
                ShowNotification( "You must be in or near a vehicle to delete it." )
            end 
        end 
    end 
end )

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

-- Gets a vehicle in a certain direction
-- Credit to Konijima
function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

-- Shows a notification on the player's screen 
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

local vehshop = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.1,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "Showroom",
			name = "main",
			buttons = {
				{name = "Aston Martin", description = ""},
				{name = "Audi", description = ""},
				{name = "Bentley", description = ""},
				{name = "BMW", description = ""},
				{name = "Bugatti", description = ""},
				{name = "Declasse", description = ""},
				{name = "Dodge", description = ""},
				{name = "Ford", description = ""},
				{name = "Ferrari", description = ""},
				{name = "General Motors", description = ""},
				{name = "Honda", description = ""},
				{name = "Hummer", description = ""},
				{name = "Hyundai", description = ""},
				{name = "Jeep", description = ""},
				{name = "Jaguar", description = ""},
				{name = "Kia", description = ""},
				{name = "Lamborghini", description = ""},
				{name = "Lexus", description = ""},
				{name = "McLaren", description = ""},
				{name = "Mercedes", description = ""},
				{name = "Nissan", description = ""},
				{name = "Peugeot", description = ""},
				{name = "Plymouth", description = ""},
				{name = "Porsche", description = ""},
				{name = "Range Rover", description = ""},
				{name = "Rolls Royce", description = ""},
				{name = "Saleen", description = ""},
				{name = "Volkswagen", description = ""},
				{name = "Ural", description = ""},
				{name = "Other", description = ""},
				{name = "Metropolitan Police", description = ""},
				{name = "National Health Service", description = ""},
			}
		},
		["Aston Martin"] = {
			title = "Aston Martin",
			name = "Aston Martin",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Audi"] = {
			title = "Audi",
			name = "Audi",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Bentley"] = {
			title = "Bentley",
			name = "Bentley",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["BMW"] = {
			title = "BMW",
			name = "BMW",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Bugatti"] = {
			title = "Bugatti",
			name = "Bugatti",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Declasse"] = {
			title = "Declasse",
			name = "Declasse",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Dodge"] = {
			title = "Dodge",
			name = "Dodge",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Ford"] = {
			title = "Ford",
			name = "Ford",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Ferrari"] = {
			title = "Ferrari",
			name = "Ferrari",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["General Motors"] = {
			title = "General Motors",
			name = "General Motors",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Honda"] = {
			title = "Honda",
			name = "Honda",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Hummer"] = {
			title = "Hummer",
			name = "Hummer",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Hyundai"] = {
			title = "Hyundai",
			name = "Hyundai",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Jeep"] = {
			title = "Jeep",
			name = "Jeep",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Jaguar"] = {
			title = "Jaguar",
			name = "Jaguar",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Kia"] = {
			title = "Kia",
			name = "Kia",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Lamborghini"] = {
			title = "Lamborghini",
			name = "Lamborghini",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Lexus"] = {
			title = "Lexus",
			name = "Lexus",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["McLaren"] = {
			title = "McLaren",
			name = "McLaren",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Mercedes"] = {
			title = "Mercedes",
			name = "Mercedes",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Nissan"] = {
			title = "Nissan",
			name = "Nissan",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Peugeot"] = {
			title = "Peugeot",
			name = "Peugeot",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Plymouth"] = {
			title = "Plymouth",
			name = "Plymouth",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Porsche"] = {
			title = "Porsche",
			name = "Porsche",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Range Rover"] = {
			title = "Range Rover",
			name = "Range Rover",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Rolls Royce"] = {
			title = "Rolls Royce",
			name = "Rolls Royce",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Saleen"] = {
			title = "Saleen",
			name = "Saleen",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Volkswagen"] = {
			title = "Volkswagen",
			name = "Volkswagen",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Ural"] = {
			title = "Ural",
			name = "Ural",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Other"] = {
			title = "Other",
			name = "Other",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["Metropolitan Police"] = {
			title = "Metropolitan Police",
			name = "Metropolitan Police",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
		["National Health Service"] = {
			title = "National Health Service",
			name = "National Health Service",
			buttons = {
				{name = "Test", costs = 1, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "airtug"},
			}
		},
	}
}

local fakecar = {model = '', car = nil}
local vehshop_locations = {
{entering = {-30.026309967042,-1105.0656738282,26.422369003296}, inside = {-39.464527130127,-1100.2739257813,26.422336578369}, outside = {-32.78832244873,-1102.0627441406,26.422361373901}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false


function vehPrs_drawTxt(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	--326 car blip 227 225
	vehSR_ShowVehshopBlips(true)
	firstspawn = 1
end
end)

function vehSR_ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,326)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Simeons")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 2.5 then
						--DrawMarker(36,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3]-0.2,0,0,0,0,0,0,0.5,0.3,0.5,0,155,255,150,0,true,0,true)
						vehPrs_drawTxt("Press ~INPUT_CELLPHONE_SELECT~ to enter showroom")
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

vehSR_ShowVehshopBlips(true)

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	SetEntityVisible(ped,false)
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end

local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
			vRP.teleport({-39.77363204956,-1110.4862060546,26.438457489014})
			SetEntityHeading(ped, 180.0)
			scaleform = nil
		else
			deleteVehiclePedIsIn()
			vRP.teleport({-39.77363204956,-1110.4862060546,26.438457489014})
			SetEntityHeading(ped, 180.0)
			--vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

simeonX, simeonY, simeonZ = -30.41927909851, -1106.771118164, 26.25236328125

function DrawText3D(x,y,z, text, scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(1)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
	simeon = 1283141381
	RequestModel( simeon )
	while ( not HasModelLoaded( simeon ) ) do
		Citizen.Wait( 1 )
	end
	theSimeon = CreatePed(4, simeon, simeonX, simeonY, simeonZ, 90, false, false)
	SetModelAsNoLongerNeeded(simeon)
	SetEntityHeading(theSimeon, -15.0)
	FreezeEntityPosition(theSimeon, true)
	SetEntityInvincible(theSimeon, true)
	SetBlockingOfNonTemporaryEvents(theSimeon, true)
	TaskStartScenarioAtPosition(theSimeon, "PROP_HUMAN_SEAT_BENCH", simeonX, simeonY, simeonZ-0.35, GetEntityHeading(theSimeon), 0, 0, false)
end)

function vehSR_tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function vehSR_Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.06, y - menu.height/2 + 0.0028)
end
scaleform = nil
function Initialize(scaleform, price, vehName, speed, acce, brake, trac)
	scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end
	PushScaleformMovieFunction(scaleform, "SET_VEHICLE_INFOR_AND_STATS")
	PushScaleformMovieFunctionParameterString(vehName)
	PushScaleformMovieFunctionParameterString(price)
	PushScaleformMovieFunctionParameterString("MPCarHUD")
	PushScaleformMovieFunctionParameterString("Benefactor")
	PushScaleformMovieFunctionParameterString("Speed")
	PushScaleformMovieFunctionParameterString("Acceleration")
	PushScaleformMovieFunctionParameterString("Brakes")
	PushScaleformMovieFunctionParameterString("Traction")
	PushScaleformMovieFunctionParameterInt(speed or 100)
	PushScaleformMovieFunctionParameterInt(acce or 100)
	PushScaleformMovieFunctionParameterInt(brake or 100)
	PushScaleformMovieFunctionParameterInt(trac or 100)
	PopScaleformMovieFunctionVoid()
	return scaleform
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(fakecar.model ~= nil) and (scaleform ~= nil)then
			local x = 0.67
			local y = 0.52
			local width = 0.65
			local height = width / 0.68
			DrawScaleformMovie(scaleform, x, y, width, height)
		end
	end
end)

function showroom_drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

testDriveCar = nil
testDriveSeconds = 60
isInTestDrive = false
isInCar = false

function destroyTestDriveCar()
	if(testDriveCar ~= nil)then
		if(DoesEntityExist(testDriveCar))then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(testDriveCar))
		end
		testDriveCar = nil
		isInTestDrive = false
	end
	testDriveSeconds = 60
	vRP.teleport({-39.77363204956,-1110.4862060546,26.438457489014})
	SetEntityHeading(GetPlayerPed(-1), 180.0)
	vRP.notify({"~r~The test drive is over!"})
end

AddEventHandler("playerDropped", function()
	if(testDriveCar ~= nil)then
		destroyTestDriveCar()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1100)
		if(testDriveCar ~= nil) and (isInTestDrive == false) then
			isInTestDrive = true
		else
			isInTestDrive = false
		end
		if(testDriveCar ~= nil)then
			local IsInVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if(IsInVehicle ~= nil)then
				if(testDriveCar == IsInVehicle)then
					if(testDriveSeconds > 0)then
						testDriveSeconds = testDriveSeconds - 1
					else
						destroyTestDriveCar()
					end
					isInCar = true
				else
					isInCar = false
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(testDriveSeconds < 60)then
			showroom_drawTxt(1.30, 1.40, 1.0,1.0,0.35, "~g~TestDrive: ~r~"..testDriveSeconds.." ~y~Seconds", 255, 255, 255, 255)
		end
		if(isInTestDrive) then
			if(isInCar == false)then
				destroyTestDriveCar()
			end
		end
	end
end)

carPrice = "£0"
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			showroom_drawTxt(0.5, 1.073, 1.0,1.0,0.4, "~r~[ENTER]  ~b~Purchase vehicle", 255, 255, 255, 255)
			showroom_drawTxt(0.5, 1.1, 1.0,1.0,0.4, "~r~[E]  ~g~Preview Vehicle", 255, 255, 255, 255)
			showroom_drawTxt(0.5, 1.13, 1.0,1.0,0.4, "~r~[F]  ~y~Test Drive vehicle", 255, 255, 255, 255)
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "Aston Martin" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Bentley" or vehshop.currentmenu == "BWM" or vehshop.currentmenu == "Bugatti" or vehshop.currentmenu == "Declasse" or vehshop.currentmenu == "Dodge" or vehshop.currentmenu == "Ford" or vehshop.currentmenu == "Ferrari" or vehshop.currentmenu == "General Motors" or vehshop.currentmenu == "Honda" or vehshop.currentmenu == "Hummer" or vehshop.currentmenu == "Hyundai" or vehshop.currentmenu == "Jeep" or vehshop.currentmenu == "Jaguar" or vehshop.currentmenu == "Kia" or vehshop.currentmenu == "Lamborghini" or vehshop.currentmenu == "Lexus" or vehshop.currentmenu == "McLaren" or vehshop.currentmenu == "Mercedes" or vehshop.currentmenu == "Nissan" or vehshop.currentmenu == "Peugeot" or vehshop.currentmenu == "Plymouth" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Range Rover" or vehshop.currentmenu == "Rolls Royce" or vehshop.currentmenu == "Saleen" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Ural" or vehshop.currentmenu == "Other" or vehshop.currentmenu == "Metropolitan Police" or vehshop.currentmenu == "National Health Service" then
							vehSR_drawMenuRight("£"..button.costs,vehshop.menu.x,y,selected)
							carPrice = "£"..button.costs
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "Aston Martin" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Bentley" or vehshop.currentmenu == "BWM" or vehshop.currentmenu == "Bugatti" or vehshop.currentmenu == "Declasse" or vehshop.currentmenu == "Dodge" or vehshop.currentmenu == "Ford" or vehshop.currentmenu == "Ferrari" or vehshop.currentmenu == "General Motors" or vehshop.currentmenu == "Honda" or vehshop.currentmenu == "Hummer" or vehshop.currentmenu == "Hyundai" or vehshop.currentmenu == "Jeep" or vehshop.currentmenu == "Jaguar" or vehshop.currentmenu == "Kia" or vehshop.currentmenu == "Lamborghini" or vehshop.currentmenu == "Lexus" or vehshop.currentmenu == "McLaren" or vehshop.currentmenu == "Mercedes" or vehshop.currentmenu == "Nissan" or vehshop.currentmenu == "Peugeot" or vehshop.currentmenu == "Plymouth" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Range Rover" or vehshop.currentmenu == "Rolls Royce" or vehshop.currentmenu == "Saleen" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Ural" or vehshop.currentmenu == "Other" or vehshop.currentmenu == "Metropolitan Police" or vehshop.currentmenu == "National Health Service" then
						if selected then
							hash = GetHashKey(button.model)
							if IsControlJustPressed(1,23) then
								if(testDriveCar == nil)then
									if DoesEntityExist(fakecar.car) then
										Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
										scaleform = nil
									end
									fakecar = {model = '', car = nil}
									while not HasModelLoaded(hash) do
										RequestModel(hash)
										Citizen.Wait(10)
										showroom_drawTxt(0.935, 0.575, 1.0,1.0,0.4, "~r~LOADING VEHICLE TEXTURE", 255, 255, 255, 255)
									end
									if HasModelLoaded(hash) then
										testDriveCar = CreateVehicle(hash,-914.83026123046,-3287.1538085938,13.521618843078,60.962993621826,false,false)
										SetModelAsNoLongerNeeded(hash)
										TaskWarpPedIntoVehicle(GetPlayerPed(-1),testDriveCar,-1)
										vRP.notify({"~g~You have ~r~1 Minute~g~ to test drive this vehicle!"})
										for i = 0,24 do
											SetVehicleModKit(testDriveCar,0)
											RemoveVehicleMod(testDriveCar,i)
										end
										if(testDriveCar)then
											vehshop.opened = false
											vehshop.menu.from = 1
											vehshop.menu.to = 10
											SetEntityVisible(GetPlayerPed(-1),true)
											FreezeEntityPosition(GetPlayerPed(-1),false)
											scaleform = nil
										end
									end
								end
							end
							if fakecar.model ~= button.model then
								if IsControlJustPressed(1,38) then
									if DoesEntityExist(fakecar.car) then
										Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
										scaleform = nil
									end
									local pos = currentlocation.pos.inside									
									local i = 0
									while not HasModelLoaded(hash) and i < 500 do
										RequestModel(hash)
										Citizen.Wait(10)
										i = i+1
										showroom_drawTxt(0.935, 0.575, 1.0,1.0,0.4, "~r~LOADING VEHICLE TEXTURE", 255, 255, 255, 255)
									end

									-- spawn car
									if HasModelLoaded(hash) then
									--if timer < 255 then
										veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
										FreezeEntityPosition(veh,true)
										SetEntityInvincible(veh,true)
										SetVehicleDoorsLocked(veh,4)
										SetModelAsNoLongerNeeded(hash)
										--SetEntityCollision(veh,false,false)
										TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
										for i = 0,24 do
											SetVehicleModKit(veh,0)
											RemoveVehicleMod(veh,i)
										end
										fakecar = { model = button.model, car = veh}
										Citizen.CreateThread(function()
											while DoesEntityExist(veh) do
												Citizen.Wait(25)
												SetEntityHeading(veh, GetEntityHeading(veh)+1 %360)
											end
										end)

										scaleform = Initialize("mp_car_stats_01", carPrice, button.name, button.speed, button.acce, button.brake, button.trac)
									else
										if last_dir then
											if vehshop.selectedbutton < buttoncount then
												vehshop.selectedbutton = vehshop.selectedbutton +1
												if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
													vehshop.menu.to = vehshop.menu.to + 1
													vehshop.menu.from = vehshop.menu.from + 1
												end
											else
												last_dir = false
												vehshop.selectedbutton = vehshop.selectedbutton -1
												if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
													vehshop.menu.from = vehshop.menu.from -1
													vehshop.menu.to = vehshop.menu.to - 1
												end
											end
										else
											if vehshop.selectedbutton > 1 then
												vehshop.selectedbutton = vehshop.selectedbutton -1
												if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
													vehshop.menu.from = vehshop.menu.from -1
													vehshop.menu.to = vehshop.menu.to - 1
												end
											else
												last_dir = true
												vehshop.selectedbutton = vehshop.selectedbutton +1
												if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
													vehshop.menu.to = vehshop.menu.to + 1
													vehshop.menu.from = vehshop.menu.from + 1
												end
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function vehSR_round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Aston Martin" then
			vehSR_OpenMenu('Aston Martin')
		elseif btn == "Audi" then
			vehSR_OpenMenu('Audi')
		elseif btn == "Bentley" then
			vehSR_OpenMenu('Bentley')
		elseif btn == "BMW" then
			vehSR_OpenMenu('BMW')
		elseif btn == "Bugatti" then
			vehSR_OpenMenu('Bugatti')
		elseif btn == "Declasse" then
			vehSR_OpenMenu('Declasse')
		elseif btn == "Dodge" then
			vehSR_OpenMenu('Dodge')
		elseif btn == "Ford" then
			vehSR_OpenMenu('Ford')
		elseif btn == "Ferrari" then
			vehSR_OpenMenu('Ferrari')
		elseif btn == "General Motors" then
			vehSR_OpenMenu('General Motors')
		elseif btn == "Honda" then
			vehSR_OpenMenu('Honda')
		elseif btn == "Hummer" then
			vehSR_OpenMenu('Hummer')
		elseif btn == "Hyundai" then
			vehSR_OpenMenu('Hyundai')
		elseif btn == "Jeep" then
			vehSR_OpenMenu('Jeep')
		elseif btn == "Jaguar" then
			vehSR_OpenMenu('Jaguar')
		elseif btn == "Kia" then
			vehSR_OpenMenu('Kia')
		elseif btn == "Lamborghini" then
			vehSR_OpenMenu('Lamborghini')
		elseif btn == "Lexus" then
			vehSR_OpenMenu('Lexus')
		elseif btn == "McLaren" then
			vehSR_OpenMenu('McLaren')
		elseif btn == "Nissan" then
			vehSR_OpenMenu('Nissan')
		elseif btn == "Peugeot" then
			vehSR_OpenMenu('Peugeot')
		elseif btn == "Plymouth" then
			vehSR_OpenMenu('Plymouth')
		elseif btn == "Porsche" then
			vehSR_OpenMenu('Porsche')
		elseif btn == "Range Rover" then
			vehSR_OpenMenu('Range Rover')
		elseif btn == "Rolls Royce" then
			vehSR_OpenMenu('Rolls Royce')
		elseif btn == "Saleen" then
			vehSR_OpenMenu('Saleen')
		elseif btn == "Volkswagen" then
			vehSR_OpenMenu('Volkswagen')
		elseif btn == "Ural" then
			vehSR_OpenMenu('Ural')
		elseif btn == "Other" then
			vehSR_OpenMenu('Other')
		elseif btn == "Metropolitan Police" then
			vehSR_OpenMenu('Metropolitan Police')
		elseif btn == "National Health Service" then
			vehSR_OpenMenu('National Health Service')
		end
	elseif this == "Aston Martin" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Bentley" or vehshop.currentmenu == "BWM" or vehshop.currentmenu == "Bugatti" or vehshop.currentmenu == "Declasse" or vehshop.currentmenu == "Dodge" or vehshop.currentmenu == "Ford" or vehshop.currentmenu == "Ferrari" or vehshop.currentmenu == "General Motors" or vehshop.currentmenu == "Honda" or vehshop.currentmenu == "Hummer" or vehshop.currentmenu == "Hyundai" or vehshop.currentmenu == "Jeep" or vehshop.currentmenu == "Jaguar" or vehshop.currentmenu == "Kia" or vehshop.currentmenu == "Lamborghini" or vehshop.currentmenu == "Lexus" or vehshop.currentmenu == "McLaren" or vehshop.currentmenu == "Mercedes" or vehshop.currentmenu == "Nissan" or vehshop.currentmenu == "Peugeot" or vehshop.currentmenu == "Plymouth" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Range Rover" or vehshop.currentmenu == "Rolls Royce" or vehshop.currentmenu == "Saleen" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Ural" or vehshop.currentmenu == "Other" or vehshop.currentmenu == "Metropolitan Police" or vehshop.currentmenu == "National Health Service" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',this,button.model,button.costs,"car",false,false)
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
	scaleform = nil
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Aston Martin" then
		vehshop.lastmenu = "main"
	elseif menu == "Audi" then
		vehshop.lastmenu = "main"
	elseif menu == "Bentley" then
		vehshop.lastmenu = "main"
	elseif menu == "BMW" then
		vehshop.lastmenu = "main"
	elseif menu == "Bugatti" then
		vehshop.lastmenu = "main"
	elseif menu == "Declasse" then
		vehshop.lastmenu = "main"
	elseif menu == "Dodge" then
		vehshop.lastmenu = "main"
	elseif menu == "Ford" then
		vehshop.lastmenu = "main"
	elseif menu == "Ferrari" then
		vehshop.lastmenu = "main"
	elseif menu == "General Motors" then
		vehshop.lastmenu = "main"
	elseif menu == "Honda" then
		vehshop.lastmenu = "main"
	elseif menu == "Hummer" then
		vehshop.lastmenu = "main"
	elseif menu == "Hyundai" then
		vehshop.lastmenu = "main"
	elseif menu == "Jeep" then
		vehshop.lastmenu = "main"
	elseif menu == "Jaguar" then
		vehshop.lastmenu = "main"
	elseif menu == "Kia" then
		vehshop.lastmenu = "main"
	elseif menu == "Lamborghini" then
		vehshop.lastmenu = "main"
	elseif menu == "Lexus" then
		vehshop.lastmenu = "main"
	elseif menu == "McLaren" then
		vehshop.lastmenu = "main"
	elseif menu == "Nissan" then
		vehshop.lastmenu = "main"
	elseif menu == "Peugeot" then
		vehshop.lastmenu = "main"
	elseif menu == "Plymouth" then
		vehshop.lastmenu = "main"
	elseif menu == "Porsche" then
		vehshop.lastmenu = "main"
	elseif menu == "Range Rover" then
		vehshop.lastmenu = "main"
	elseif menu == "Rolls Royce" then
		vehshop.lastmenu = "main"
	elseif menu == "Saleen" then
		vehshop.lastmenu = "main"
	elseif menu == "Volkswagen" then
		vehshop.lastmenu = "main"
	elseif menu == "Ural" then
		vehshop.lastmenu = "main"
	elseif menu == "Other" then
		vehshop.lastmenu = "main"
	elseif menu == "Metropolitan Police" then
		vehshop.lastmenu = "main"
	elseif menu == "National Health Service" then
		vehshop.lastmenu = "main"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end


function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "Aston Martin" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Bentley" or vehshop.currentmenu == "BWM" or vehshop.currentmenu == "Bugatti" or vehshop.currentmenu == "Declasse" or vehshop.currentmenu == "Dodge" or vehshop.currentmenu == "Ford" or vehshop.currentmenu == "Ferrari" or vehshop.currentmenu == "General Motors" or vehshop.currentmenu == "Honda" or vehshop.currentmenu == "Hummer" or vehshop.currentmenu == "Hyundai" or vehshop.currentmenu == "Jeep" or vehshop.currentmenu == "Jaguar" or vehshop.currentmenu == "Kia" or vehshop.currentmenu == "Lamborghini" or vehshop.currentmenu == "Lexus" or vehshop.currentmenu == "McLaren" or vehshop.currentmenu == "Mercedes" or vehshop.currentmenu == "Nissan" or vehshop.currentmenu == "Peugeot" or vehshop.currentmenu == "Plymouth" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Range Rover" or vehshop.currentmenu == "Rolls Royce" or vehshop.currentmenu == "Saleen" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Ural" or vehshop.currentmenu == "Other" or vehshop.currentmenu == "Metropolitan Police" or vehshop.currentmenu == "National Health Service" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
			scaleform = nil
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end

function vehSR_stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end