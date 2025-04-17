return function(A, Debug, Location, Alarm, Mode)

	local Booleans = { -- Don't edit these. They are values for the script to use
		Distance = 80,
		Alarmed = false,
		Detect_ENABLED = true,
		Config = require(A.Parent.Parent.Parent.FlowConfiguration),
	}

	if Debug == true then
		warn([[ 2024 ZITONDEV - Beam Detector 
        Location: ]].. Location
		)
	end
	A.Parent.Parent.Parent.FlowNetwork.Event:Connect(function(DATA)
		if DATA =="Reset" then
			warn('2024 Verko Development - Beam Detector Reset')
			Booleans.Alarmed = false
			Booleans.Detect_ENABLED = true

		end
	end)
	if A.Parent.Parent.Parent.FlowNetwork.Disabled.Value == false and Mode == 'Smoke' then
		workspace.DescendantAdded:Connect(function(Decendent)
			if Decendent:IsA("Smoke") then
				local parent = Decendent:FindFirstAncestorWhichIsA("BasePart")
				if parent then
					if (A.Parent.Beam.Position - parent.Position).Magnitude < Booleans.Distance and Booleans.Detect_ENABLED then
						Booleans.Detect_ENABLED = false
						for i = 1,math.ceil(((A.Parent.Beam.Position - parent.Position).Magnitude)/5),1 do
							wait(5)
						end
						if Decendent then
							warn('2024 Verko Development - Beam Detector Activated')
							A.Parent.Parent.Parent.FlowNetwork:Fire({FireInfo = {DeviceName = Location , AlarmType = Alarm}})
							Booleans.Alarmed = true
						end
					end
				end
			end
		end)
	end
end