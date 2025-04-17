return function(A, DWPROX)
local Debounce = false	
	local LHinge = script.Parent.Assets.iTab.LHinge:Clone()
	LHinge.Parent = A.StandL
	local RHinge = script.Parent.Assets.iTab.RHinge:Clone()
	RHinge.Parent = A.StandR
	--
	LHinge.Attachment0 = A.StandL.Attachment
	LHinge.Attachment1 = A.Left.Union.Attachment
	RHinge.Attachment0 = A.StandR.Attachment
	RHinge.Attachment1 = A.Right.Union.Attachment
	
	--[[if DWPROX == true then
		if A.Parent:WaitForChild('DWProx') then
			local API = A:FindFirstChild('DoorUnlockingAPIThings')
			API.Event:Connect(function(DATA)
				if DATA == 'Open' then
					LHinge.TargetAngle = 90
					RHinge.TargetAngle = -90
				elseif DATA == 'Close' then
					LHinge.TargetAngle = 0
					RHinge.TargetAngle = 0
				
				end
			end)
		end
	end]]
	
A.HIT.Touched:Connect(function(Hit)
		if Hit:IsA('CharacterMesh') and DWPROX == false and Debounce == false then
			Debounce = true
			LHinge.TargetAngle = 90
			RHinge.TargetAngle = -90
			task.wait(5)
			LHinge.TargetAngle = 0
			RHinge.TargetAngle = 0
			task.wait(1.5)
			Debounce = false
		end
	end)
end