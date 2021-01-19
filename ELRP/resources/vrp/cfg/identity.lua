
local cfg = {}

-- city hall position
cfg.city_hall =	{-536.14611816406,-219.04403686523,37.649948120117}

-- cityhall blip {blipid,blipcolor}
cfg.blip = {417,2}

-- cost of a new identity
cfg.new_identity_cost = 0

-- phone format (max: 20 chars, use D for a random digit)
cfg.phone_format = "DDDD-DDDD"
-- cfg.phone_format = "06DDDDDDDD" -- another example for cellphone in France


-- config the random name generation (first join identity)
-- (I know, it's a lot of names for a little feature)
-- (cf: http://names.mongabay.com/most_common_surnames.htm)
cfg.random_first_names = {
  "Bob",
  "Bob"
}

cfg.random_last_names = {
  "Smith",
  "Smith"
}

return cfg
