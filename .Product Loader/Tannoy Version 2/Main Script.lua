function WLS(Player:Player, Whitelist, A)
	if Whitelist.StaffMode == true then
		if require(script.Parent.Parent["Staff Module"]) then
			A.Parent.Screen.TannoyGUI.Application.Top.S.Visible = true
			return true
		end
	elseif table.find(Whitelist.Players, Player.UserId) then
		return true 
	elseif table.find(Whitelist.Players, Player.Name) then
		return true 
	elseif Player:GetRankInGroup(Whitelist.GroupID) >= Whitelist.ID then
		return true
	else
		return false
	end
end
return function(A, Debug, Whitelist, API  )
	
	local C = script.Parent.GUIs.TannoyGUI:Clone()
	C.Parent = A.Parent.Screen
	local Sound = Instance.new('Sound')
	Sound.Parent = workspace
	Sound.Volume = API.Volume
	Sound.Name = 'ZD - Tannoy'

	for i, v in pairs(A.Parent.Sounds:GetChildren()) do
		if v:IsA('Configuration') then
			local C = script.Parent.GUIs.Tannoy:Clone()
			C.Name = v.Name
			C.Text = v.Name
			C.SoundID.Value = v.SoundID.Value
			C.Parent = A.Parent.Screen.TannoyGUI.Application.TannoyKeys
		end
	end

	for i, v in pairs(A.Parent.Screen.TannoyGUI.Application.TannoyKeys:GetChildren()) do
		if v:IsA('TextButton') then
			v.MouseButton1Click:Connect(function(Player)
				if Whitelist.Enabled == true then
					if WLS(Player, Whitelist, A) then
						if API.CustomSound == true then
							API.Played(v.SoundID.Value)
						else
							Sound.SoundId = v.SoundID.Value
							Sound:Play()
						end
					end
				elseif Whitelist.Enabled == false then
					if API.CustomSound == true then
						API.Played(v.SoundID.Value)
					else
						Sound.SoundId = v.SoundID.Value
					end
				end
			end)
		end
	end

	A.Parent.Screen.TannoyGUI.Application.Stop.MouseButton1Click:Connect(function(Player)
		if Whitelist.Enabled == true then
			if WLS(Player, Whitelist, A) then
				if API.CustomSound == true then
					API.Stopped()
				else
					Sound:Stop()
				end
			end
		elseif Whitelist.Enabled == false then
			if API.CustomSound == true then
				API.Stopped()
			else
				Sound:Stop()
			end
		end
	end)

	local L = false
	A.Parent.Model.Frame.ClickDetector.MouseClick:Connect(function(Player)
		A.Parent.Screen.TannoyGUI.Application.Top.S.Visible = false
		if Whitelist.Enabled == true then
			if WLS(Player, Whitelist, A) then
				if L == false then
					L = true
					A.Parent.Screen.TannoyGUI.Locked.Visible = false
					A.Parent.Screen.TannoyGUI.Application.Visible = true
				else
					L = false
					A.Parent.Screen.TannoyGUI.Locked.Visible = true
					A.Parent.Screen.TannoyGUI.Application.Visible = false
				end	
			end
		elseif Whitelist.Enabled == false then
			if L == false then
				L = true
				A.Parent.Screen.TannoyGUI.Locked.Visible = false
				A.Parent.Screen.TannoyGUI.Application.Visible = true
			else
				L = false
				A.Parent.Screen.TannoyGUI.Locked.Visible = true
				A.Parent.Screen.TannoyGUI.Application.Visible = false
			end	
		end
	end)
end