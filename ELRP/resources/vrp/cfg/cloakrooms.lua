
-- this file configure the cloakrooms on the map

local cfg = {}

-- prepare surgeries customizations
local surgery_male = { model = "mp_m_freemode_01" }
local surgery_female = { model = "mp_f_freemode_01" }
local emergency_male = { model = "s_m_m_nhs_01" }
local emergency_female = { model = "s_f_y_paramedic_01" }
local fbi_male = { model = "s_m_y_swat_01" }
local sheriff_male = { model = "malePCSO"}
local sheriff_female = { model = "femalePCSO"}
local hway_male = { model = "NPAS1"}
local cop_male = { model = "s_m_y_cop_01"}
local ups_male = { model = "S_M_Y_AIRWORKER"}
local cop_female = { model = "s_f_y_cop_01"}
local detective_male = { model = "s_m_m_CIASec_01"}
local officer_male = { model = "s_m_y_cop_01"}
local bounty_male = { model = "s_m_y_BlackOps_01"}
local captain_male = { model = "s_m_y_fibcop_01"}
local lieutenant_male = { model = "s_m_m_Armoured_02"}
local sergeant_male = { model = "s_m_y_Ranger_01"}
local deputy_male = { model = "s_m_y_ranger_01"}
local chief_male = {model = "s_m_m_ciasec_01"}
local santa = {model = "Santaclaus"}


--s_m_m_paramedic_01
--s_f_y_scrubs_01
--mp_m_freemode_01
--mp_f_freemode_01


for i=0,19 do
  surgery_female[i] = {0,0}
  surgery_male[i] = {0,0}
end

-- cloakroom types (_config, map of name => customization)
--- _config:
---- permissions (optional)
---- not_uniform (optional): if true, the cloakroom will take effect directly on the player, not as a uniform you can remove
cfg.cloakroom_types = {
  ["police"] = {
    _config = { permissions = {"police.cloakroom"} },
    ["Male uniform"] = {
      [3] = {30,0},
      [4] = {25,2},
      [6] = {24,0},
      [8] = {58,0},
      [11] = {55,0},
      ["p2"] = {2,0}
    },
    ["Female uniform"] = {
      [3] = {35,0},
      [4] = {30,0},
      [6] = {24,0},
      [8] = {6,0},
      [11] = {48,0},
      ["p2"] = {2,0}
    }
  },
  ["Lawyer"] = {
    _config = { permissions = {"Lawyer.cloakroom"} },
    ["Male uniform"] = {
	  [3] = {1,0},
	  [4] = {10,0},
	  [6] = {10,0},
	  [8] = {4,0},
	  [11] = {10,0},
	  ["p2"] = {-1,0}       
    },
    ["Female uniform"] = {
	  [3] = {0,0},
	  [4] = {37,0},
	  [6] = {13,0},
	  [8] = {21,1},
	  [11] = {24,3},
	  ["p2"] = {-1,0}
    }
},
["surgery"] = {
    _config = { not_uniform = true },
    ["Male"] = surgery_male,
    ["Female"] = surgery_female
  },
  ["emergency"] = {
   _config = { permissions = {"emergency.cloakroom"} },
   ["NHS1"] = emergency_male,
   ["Female"] = emergency_female
  }
}

cfg.cloakrooms = {
  {"police", 459.01037597656,-992.32800292969,30.689575195313},
  {"police", 1849.5583496094,3696.1013183594,34.25626373291}, -- sandy shores
  {"police", -448.53857421875,6009.2690429688,31.716375350952}, -- paleto
  {"emergency",304.71157836914,-599.97668457031,43.283973693848}
  -- {"Santa",-1373.0778808594,-2677.6694335938,13.944942474365} -- Santa's Cloakroom (Disabled)
}

return cfg
