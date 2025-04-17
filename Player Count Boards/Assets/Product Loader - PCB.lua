Branding = [[
                                                      
 ___ ___ ___ ___    _____ _ _           ____          
|_  |   |_  | | |  |__   |_| |_ ___ ___|    \ ___ _ _ 
|  _| | |  _|_  |  |   __| |  _| . |   |  |  | -_| | |
|___|___|___| |_|  |_____|_|_| |___|_|_|____/|___|\_/ 

Script: Player Count Board
Date: 13/06/24
Info: Counts people who join from a selection of arguments.

-- TOS -- 
 
 You can do what ever you want with this model and script,
 as long as you do not re-sell/sell this or any parts of this 
 and if you distribuit this you add a copy of this ToS and keep 
 all branding on any scripts
]]

Count_Type = 'All' -- All or Group
GroupID = 000000 -- GroupID to used for a Group Count Type
G_CountMin = 0 -- Lowest rank counted for Group Count Types

Debug = false -- Should warm statements log actions?




--|| DO NOT EDIT BELOW ||--
Load = require()
Load(script, 'PlrCountBoard', Debug,  1, game.CreatorId, Count_Type, GroupID, G_CountMin)