Citizen.CreateThread(function()

    RequestModel(GetHashKey("s_f_y_clubbar_01"))
	
    while not HasModelLoaded(GetHashKey("s_f_y_clubbar_01")) do
        Wait(1)
    end
	
	if Config.EnableCasinoPeds then
		for _, item in pairs(Config.Location1) do
			local npc = CreatePed(4, GetHashKey("s_f_y_clubbar_01"), item.x, item.y, item.z, item.heading, false, true)
					
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			TaskStartScenarioAtPosition(npc, "WORLD_HUMAN_DRINKING", item.x, item.y, item.z, item.heading, 0, 0, 1)
			FreezeEntityPosition(npc,true)
			
		end
	end
end)

Citizen.CreateThread(function()

    RequestModel(GetHashKey("u_m_m_bankman"))
	
    while not HasModelLoaded(GetHashKey("u_m_m_bankman")) do
        Wait(1)
    end
	
	if Config.EnableCasinoPeds then
		for _, item in pairs(Config.Location2) do
			local npc = CreatePed(4, GetHashKey("u_m_m_bankman"), item.x, item.y, item.z, item.heading, false, true)
					
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			TaskStartScenarioAtPosition(npc, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", item.x, item.y, item.z, item.heading, 0, 0, 1)
			FreezeEntityPosition(npc,true)
			
		end
	end
end)

Citizen.CreateThread(function()

    RequestModel(GetHashKey("a_m_y_beachvesp_01"))
	
    while not HasModelLoaded(GetHashKey("a_m_y_beachvesp_01")) do
        Wait(1)
    end
	
	if Config.EnableCasinoPeds then
		for _, item in pairs(Config.Location3) do
			local npc = CreatePed(4, GetHashKey("a_m_y_beachvesp_01"), item.x, item.y, item.z, item.heading, false, true)
					
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			TaskStartScenarioAtPosition(npc, "WORLD_HUMAN_CHEERING", item.x, item.y, item.z, item.heading, 0, 0, 1)
			FreezeEntityPosition(npc,true)
			
		end
	end
end)

Citizen.CreateThread(function()

    RequestModel(GetHashKey("a_f_m_bevhills_01"))
	
    while not HasModelLoaded(GetHashKey("a_f_m_bevhills_01")) do
        Wait(1)
    end
	
	if Config.EnableCasinoPeds then
		for _, item in pairs(Config.Location4) do
			local npc = CreatePed(4, GetHashKey("a_f_m_bevhills_01"), item.x, item.y, item.z, item.heading, false, true)
					
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			TaskStartScenarioAtPosition(npc, "WORLD_HUMAN_STAND_MOBILE", item.x, item.y, item.z, item.heading, 0, 0, 1)
			FreezeEntityPosition(npc,true)
			
		end
	end
end)

Citizen.CreateThread(function()

    RequestModel(GetHashKey("a_f_y_bevhills_02"))
	
    while not HasModelLoaded(GetHashKey("a_f_y_bevhills_02")) do
        Wait(1)
    end
	
	if Config.EnableCasinoPeds then
		for _, item in pairs(Config.Location5) do
			local npc = CreatePed(4, GetHashKey("a_f_y_bevhills_02"), item.x, item.y, item.z, item.heading, false, true)
					
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			TaskStartScenarioAtPosition(npc, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", item.x, item.y, item.z, item.heading, 0, 0, 1)
			FreezeEntityPosition(npc,true)
			
		end
	end
end)