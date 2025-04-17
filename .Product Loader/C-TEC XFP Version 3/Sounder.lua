


return function(A) 	
	local AL = script.ALERT:Clone()
	AL.Parent = A
	A.Parent.Parent.Parent.API.Event:Connect(function(ZONE, DEVICE, TYPE)
		if TYPE == "EVACUATE" then
			A.Parent.Sound:Play()
		elseif TYPE == "ALERT" then
			AL.Enabled = true
		elseif ZONE == "RESET" then
			A.ALERT.Enabled = false
			A.Parent.Sound:Stop()
		elseif ZONE == "SILENCE" then
			A.Parent.Sound:Stop()
			AL.Enabled = false
		elseif ZONE == "RESOUND" then
			A.Parent.Sound:Play()



		end
	end)
	A.Parent.Parent.Parent.Parent.API.Disabled.Changed:Connect(function()
		if A.Parent.Parent.Parent.Parent.API.Disabled.Value == true then
			A.Parent.Sound.Volume = 0
		else
			A.Parent.Sound.Volume = 5
		end
end)
end