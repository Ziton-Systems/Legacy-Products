Branding = [[
                                                      
 ___ ___ ___ ___    _____ _ _           ____          
|_  |   |_  | | |  |__   |_| |_ ___ ___|    \ ___ _ _ 
|  _| | |  _|_  |  |   __| |  _| . |   |  |  | -_| | |
|___|___|___| |_|  |_____|_|_| |___|_|_|____/|___|\_/ 

Script: Tannoy Script Loader
Date: 13/06/24
Info: Allows you to play roblox music IDs.

-- TOS -- 
 
 You can do what ever you want with this model and script,
 as long as you do not re-sell/sell this or any parts of this 
 and if you distribuit this you add a copy of this ToS and keep 
 all branding on any scripts
]]

Whitelist = {
	Enabled = true, 
	StaffMode = true, -- Allow Ziton Dev staff to help debug your system
	Players = { -- Usernames and UserIDs
		818165412,
		
	},
	GroupID = 000000,
	ID = 0 -- Set to a 256 to disable the Group Whitelist
}

API = {
	Volume = 0.5,
	CustomSound = false, -- Do you want to use a custom speaker system?
	
	Played = function(SoundID)
		
	end,
	Stopped = function()
	
	end,
}



Load = require()
Load(script, 'Tannoy', false,  1, game.CreatorId, Whitelist, API)