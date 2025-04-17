return function(A, Debug, Type, GroupID, GID)
	script.Parent.GUIs.PLRCOUNT:Clone().Parent = A.Parent.Screen
local Count = 0
game.Players.PlayerAdded:Connect(function(Player)
		if Type == 'All' then
			Count = Count + 1
			A.Parent.Screen.PLRCOUNT.Frame.Count.Text = Count
		elseif Type == 'Group' then
			if Player:GetRankInGroup(GroupID) >= GID then
				Count = Count + 1
				A.Parent.Screen.PLRCOUNT.Frame.Count.Text = Count
			end
		end
	end)
game.Players.PlayerRemoving:Connect(function(Player)
		if Type == 'All' then
			Count = Count - 1
			A.Parent.Screen.PLRCOUNT.Frame.Count.Text = Count
		elseif Type == 'Group' then
			if Player:GetRankInGroup(GroupID) >= GID then
				Count = Count - 1
				A.Parent.Screen.PLRCOUNT.Frame.Count.Text = Count
			end
		end
	end)
end