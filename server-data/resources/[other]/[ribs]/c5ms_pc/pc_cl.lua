globalTimer = false
globalTime = 0
local timer = 15
RegisterCommand('startpc', function(source, args)
	TriggerServerEvent('pc:StartTimer')
end)
RegisterCommand('stoppc', function(source, args)
	TriggerServerEvent('pc:StopTimer')
end)
RegisterNetEvent('pc:stopTimer')
AddEventHandler('pc:stopTimer', function()
	globalTimer = false
	closeTimerNUI()
end)
RegisterNetEvent('pc:startTimer')
AddEventHandler('pc:startTimer', function()
	globalTimer = true
	globalTime = timer
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
			if globalTimer then
				globalTimerNUI()
			elseif not globalTimer then
				break
			end
		end
	end)
	repeat
		Citizen.Wait(60000)
		globalTime = globalTime - 1
	until globalTime == 0
	globalTimer = false
	closeTimerNUI()
end)

globalTimerNUI = function()
	local timeRRRR = globalTime
	SendNUIMessage({
		action = 'toggleAlert',
		data = timeRRRR
	})
end

closeTimerNUI = function()
	SendNUIMessage({
		action = 'closeAlert',
	})
end