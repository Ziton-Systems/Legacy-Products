--[[ ZITON SYSTEMS 2025 - LEGACY PRODUCT - THIS PRODUCT MAY NOT WORK AS INTENDED ]]--

--|| SETTINGS ||--
Location = 'Stock Room' -- Location reported
Alarm = 'Evac' -- Evac or Alert
Mode = 'Smoke' -- Smoke or Disabled

Debug = true -- If your Beam Detector is not working

--|| PLEASE ONLY EDIT BELOW IF YOU KNOW HOW TO CODE ||--
--||   We will not provide help for modded scripts  ||--

Booleans = { -- Don't edit these. They are values for the script to use
Distance = 80,
Alarmed = false,
Detect_ENABLED = true,
Config = require(script.Parent.Parent.Parent.FlowConfiguration),
}

if Debug == true then
	warn([[ 2024 ZITONDEV - Beam Detector 
        Location: ]].. Location
	)
end
script.Parent.Parent.Parent.FlowNetwork.Event:Connect(function(DATA)
	if DATA =="Reset" then
		warn([[ 2024 ZITONDEV - Beam Detector 
                Detector Reset               ]]
		)
		Booleans.Alarmed = false
	    Booleans.Detect_ENABLED = true
	
	end
end)
if script.Parent.Parent.Parent.FlowNetwork.Disabled.Value == false and Mode == 'Smoke' then
	workspace.DescendantAdded:Connect(function(Decendent)
		if Decendent:IsA("Smoke") then
			local parent = Decendent:FindFirstAncestorWhichIsA("BasePart")
			if parent then
				if (script.Parent.Beam.Position - parent.Position).Magnitude < Booleans.Distance and Booleans.Detect_ENABLED then
					Booleans.Detect_ENABLED = false
					for i = 1,math.ceil(((script.Parent.Beam.Position - parent.Position).Magnitude)/5),1 do
						wait(5)
					end
					if Decendent then
						warn([[ 2024 ZITONDEV - Beam Detector 
                                Smoke Detected               ]]
						)
						script.Parent.Parent.Parent.FlowNetwork:Fire({FireInfo = {DeviceName = Location , AlarmType = Alarm}})
						Booleans.Alarmed = true
					end
				end
			end
		end
	end)
end

