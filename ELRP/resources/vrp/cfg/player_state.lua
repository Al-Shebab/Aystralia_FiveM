
local cfg = {}

-- define the first spawn position/radius of the player (very first spawn on the server, or after death)
cfg.spawn_enabled = true -- set to false to disable the feature
cfg.spawn_position = {-542.38690185547,-208.55410766602,37.649799346924}
cfg.spawn_death = {304.39807128906,-585.58966064453,43.283981323242} -- x,y,z for death location
cfg.spawn_radius = 2

-- customization set when spawning for the first time
-- see https://wiki.fivem.net/wiki/Peds
-- mp_m_freemode_01 (male)
-- mp_f_freemode_01 (female)
cfg.default_customization = {
  model = "mp_m_freemode_01" 
}

-- init default ped parts
for i=0,19 do
  cfg.default_customization[i] = {0,0}
end

cfg.clear_phone_directory_on_death = false
cfg.lose_aptitudes_on_death = false

return cfg