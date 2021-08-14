Config = {}

-- Script locale (only .Lua)
Config.Locale = 'en'

Config.FixePhone = {
  -- Mission Row
  ['911'] = { 
    name =  _U('mission_row'), 
    coords = { x = 441.2, y = -979.7, z = 30.58 } 
  },
  
  ['696-6969'] = {
    name = _U('phone_booth'),
    coords = { x = 151.12, y = -987.61, z = 30.74 }
  },
}

Config.KeyOpenClose = 288 -- F1
Config.KeyTakeCall  = 38  -- E

Config.UseMumbleVoIP = false -- Use Frazzle's Mumble-VoIP Resource (Recomended!) https://github.com/FrazzIe/mumble-voip
Config.UseTokoVoIP   = false

Config.ShowNumberNotification = false -- Show Number or Contact Name when you receive new SMS