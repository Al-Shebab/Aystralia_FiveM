local Config = {}

Config.Locale = 'en'

Config.serverLogo = 'https://i.imgur.com/RCYdZo8.png'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}

Config.date = {
	format	 	= 'default',
	AmPm		= true
}

Config.voice = {

	levels = {
		default = 7.0,
		shout = 15.0,
		whisper = 2.0,
		current = 0
	},
	
	keys = {
		distance 	= 'PAGEUP',
	}
}


Config.vehicle = {
	speedUnit = 'MPH',
	maxSpeed = 1000,

	keys = {
		seatbelt 	= 'K',
		cruiser		= 'CAPS',
		signalLeft	= 'LEFT',
		signalRight	= 'RIGHT',
		signalBoth	= 'DOWN',
	}
}

Config.ui = {
	showServerLogo		= true,

	showJob		 		= false,

	showWalletMoney 	= true,
	showBankMoney 		= true,
	showBlackMoney 		= false,

	showDate 			= false,
	showLocation 		= false,
	showVoice	 		= true,

	showHealth			= false,
	showArmor	 		= false,
	showStamina	 		= false,
	showHunger 			= false,
	showThirst	 		= false,

	showMinimap			= true,

	showWeapons			= false,
	
}



Config.vRP = {
	items = {
		blackMoney = 'dirty_money'
	}
}

return Config