Citizen.CreateThread(function()
--load unloaded ipl's
  LoadMpDlcMaps()
  EnableMpDlcMaps(true)
  RequestIpl("CS3_05_water_grp1")
  RequestIpl("CS3_05_water_grp2")
  RequestIpl("canyonriver01")
  RequestIpl("railing_start")
  
end)

-- http://pastebin.com/FyV5mMma for list if you want to add more