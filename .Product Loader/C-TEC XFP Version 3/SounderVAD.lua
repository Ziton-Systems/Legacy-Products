


return function(A) 	
	local C1 = script.ALERT:Clone()
	C1.Parent = A
	local C2 = script.VAD:Clone()
	C2.Parent = A
	local disabled = false
	A.Parent.Parent.Parent.API.Event:Connect(function(ZONE, DEVICE, TYPE)
		if TYPE == "EVACUATE" then
			if disabled == false then
				A.Parent.Sound:Play()
				A.VAD.Enabled = true 
			end
		elseif TYPE == "ALERT" then
			if disabled == false then
				A.ALERT.Enabled = true
				A.VAD.Enabled = true
			end
		elseif ZONE == "RESET" then
			A.Parent.Sound:Stop()
			A.VAD.Enabled = false
			A.Parent.VAD.Transparency = 0.58
			A.Parent.VAD.BrickColor = BrickColor.new("Medium stone grey")
			A.ALERT.Enabled = false
		elseif ZONE == "SILENCE" then
			A.Parent.Sound:Stop()
			A.ALERT.Enabled = false
		elseif ZONE == "RESOUND" then
			A.Parent.Sound:Play()
			A.VAD.Enabled = true



		end
	end)

	A.Parent.Parent.Parent.Parent.API.Disabled.Changed:Connect(function()
		if A.Parent.Parent.Parent.Parent.API.Disabled.Value == true then
			A.Parent.Sound.Volume = 0
			disabled = true
		else
			disabled = false
			A.Parent.Sound.Volume = 5
		end
	end)
end