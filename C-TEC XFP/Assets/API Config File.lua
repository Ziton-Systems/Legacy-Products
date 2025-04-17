local module = {
	SYS_INFO = [[
  ____  _ __              ___               __                         __ 
 /_  / (_) /____  ___    / _ \___ _  _____ / /__  ___  __ _  ___ ___  / /_
  / /_/ / __/ _ \/ _ \  / // / -_) |/ / -_) / _ \/ _ \/  ' \/ -_) _ \/ __/
 /___/_/\__/\___/_//_/ /____/\__/|___/\__/_/\___/ .__/_/_/_/\__/_//_/\__/ 
                                               /_/           
2024 Ziton Development - CTEC XFP System V2 

============================================================================================================================================================
                                             
This system has been updated scripting wise. We have also a couple good quality free models that support our system. 
If you happen to own one of these models please do let us know if you do not wish for us to use your models. 
                                              
============================================================================================================================================================

SETUP GUIDE - Use this guide BEFORE creating a Ticket. 

I/O MODULE 
----------

Within the module there is several functions. The name of the functions indicates when it activiates.
Treat this as a normal function and add any intergration you want.
We do not offer support for how to add specfic functions, we will help with functions if it is not working. 

Manual Call Points - (KACs)
---------------------------

1) Place your MCPs where you want them installed
2) Select the MCP and scroll down on the properties tab
3) Change "Device_ID" to the label you wish for your MCP to have
4) Change "Type" to either "EVACUATE" or "ALERT"
5) Change "Zone" to a number between 1-16 (The amount of zones on the panel)

DETECTORS
---------

1) Place your Detector where you want it installed
2) Seletect the Detector and scroll down on the properties tab
3) Change "Device_ID" to the label you wish for your Detector to have
4) Change "Type" to either "EVACUATE" or "ALERT"
5) Change "Zone" to a number between 1-16 (The amount of zones on the panel)

============================================================================================================================================================

Thank you for using Ziton Development. 
]],
	
	
	--[[ WHITELIST ]]--
	Whitelist = {
		Enabled = true,
		UserIDs = {},
		GroupID = 000000, RankID = 0,
		CreatorPower = true -- Give Ziton Development Staff access
	},
}

return module
