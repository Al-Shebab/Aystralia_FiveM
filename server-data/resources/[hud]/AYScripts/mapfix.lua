Citizen.CreateThread(function()
--load unloaded ipl's
  LoadMpDlcMaps()
  EnableMpDlcMaps(true)
  RequestIpl("CS3_05_water_grp1") -- Water Patch
  RequestIpl("CS3_05_water_grp2") -- Water Patch
  RequestIpl("canyonriver01") -- Water Patch
  RequestIpl("railing_start") -- Honestly no clue
  RequestIpl("shr_int") -- Simeons
end)

-- http://pastebin.com/FyV5mMma for list if you want to add more