Config = {}

Config.AllLogs = true											-- Enable/Disable All Logs Channel
Config.postal = true  											-- set to false if you want to disable nerest postal (https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-2/147458)
Config.username = "SYSTEM" 							-- Bot Username
Config.communtiyName = "ELRP"					-- Icon top of the Embed


Config.weaponLog = true  			-- set to false to disable the shooting weapon logs
Config.weaponLogDelay = 1000		-- delay to wait after someone fired a weapon to check again in ms (put to 0 to disable) Best to keep this at atleast 1000

Config.playerID = true				-- set to false to disable Player ID in the logs
Config.steamID = true				-- set to false to disable Steam ID in the logs
Config.steamURL = true				-- set to false to disable Steam URL in the logs
Config.discordID = true				-- set to false to disable Discord ID in the logs


-- Change color of the default embeds here
-- It used Decimal color codes witch you can get and convert here: https://jokedevil.com/colorPicker
Config.joinColor = "3863105" 		-- Player Connecting
Config.leaveColor = "15874618"		-- Player Disconnected
Config.chatColor = "10592673"		-- Chat Message
Config.shootingColor = "10373"		-- Shooting a weapon
Config.deathColor = "000000"		-- Player Died
Config.resourceColor = "15461951"	-- Resource Stopped/Started



Config.webhooks = {
	all = "https://discordapp.com/api/webhooks/773506494758125568/zl6zfxOFEqC0jJTfUceb6a1Pf3m9T2LqKgUeAeyNrY73CvKlqPfiAPL5Aqes4mrKoWXf", --ALL[FOUNDER'S]
	chat = "https://discordapp.com/api/webhooks/773504337908465685/mDqts22akitGDlnFu_o0V_og2t4K6P7zqK-lBfMKx9pdW-vVlk45rY5xEK_jWhpkl64F", --CHAT
	joins = "https://discordapp.com/api/webhooks/773507188726693899/mar5hoWU3YV2iddDrkUU22GbJry-0_4mbqeFwojB29dP-9FW8eZm3pX1QcgRQZG7386N", -- JOINS
	leaving = "https://discordapp.com/api/webhooks/773507188726693899/mar5hoWU3YV2iddDrkUU22GbJry-0_4mbqeFwojB29dP-9FW8eZm3pX1QcgRQZG7386N", -- LEAVINGS
	deaths = "https://discordapp.com/api/webhooks/773508328798027786/RkrI5PfM1kO4rtOK3Qvq2OvyA34-MlZF-jRW8B_PdNfiJtCcptQ4QWcSm0CYBY8p0nH8", -- DEATHS
	shooting = "https://discordapp.com/api/webhooks/773509192648491029/PeNhAvlT9Baq_mr1NXd2hW0w1a10ENnYOyxzrgbSCaPRRmAPbADFsjKQzOBR8uWOgeqF", -- KILLS
	resources = "https://discordapp.com/api/webhooks/773507800088969236/srBowJMGLyDLcIIL84jvgwiphANV00gFse-mOP-rJunW8PrXWZ4KNr-CElL0TktOdEkx", -- RESOURCES

  -- How you add more logs is explained on https://docs.jokedevil.com/JD_logs
  }


 --Debug shizzels :D
Config.debug = false
Config.versionCheck = "1.1.0"
