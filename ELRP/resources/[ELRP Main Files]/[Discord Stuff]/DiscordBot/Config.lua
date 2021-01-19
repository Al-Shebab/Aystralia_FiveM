local convarValue = GetConvar("serverNum", 2)
if convarValue == "1" then 
	DiscordWebhookSystemInfos =  'https://discordapp.com/api/webhooks/773507188726693899/mar5hoWU3YV2iddDrkUU22GbJry-0_4mbqeFwojB29dP-9FW8eZm3pX1QcgRQZG7386N'
	DiscordWebhookKillinglogs =  'hhttps://discordapp.com/api/webhooks/773508328798027786/RkrI5PfM1kO4rtOK3Qvq2OvyA34-MlZF-jRW8B_PdNfiJtCcptQ4QWcSm0CYBY8p0nH8' --KILLS
	DiscordWebhookChat =        'https://discordapp.com/api/webhooks/773504337908465685/mDqts22akitGDlnFu_o0V_og2t4K6P7zqK-lBfMKx9pdW-vVlk45rY5xEK_jWhpkl64F'  --CHAT
elseif convarValue == "2" then 
	DiscordWebhookSystemInfos =  'https://discordapp.com/api/webhooks/773507188726693899/mar5hoWU3YV2iddDrkUU22GbJry-0_4mbqeFwojB29dP-9FW8eZm3pX1QcgRQZG7386N'
	DiscordWebhookKillinglogs =  'https://discordapp.com/api/webhooks/773508328798027786/RkrI5PfM1kO4rtOK3Qvq2OvyA34-MlZF-jRW8B_PdNfiJtCcptQ4QWcSm0CYBY8p0nH8'--KILLS
	DiscordWebhookChat =         'https://discordapp.com/api/webhooks/773504337908465685/mDqts22akitGDlnFu_o0V_og2t4K6P7zqK-lBfMKx9pdW-vVlk45rY5xEK_jWhpkl64F'--CHAT
end	

SystemName = 'SYSTEM'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				   {'/anon', '**[anon]:**'},
				   {'/me', '**[me]:**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/mine',
					   '/process',
					   '/clean',
					   '/gather',
					   '/repair',
					   '/fix',
					   '/dv',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

