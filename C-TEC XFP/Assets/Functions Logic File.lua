local module = {
	Whitelist = function(Player: Player)
		if require(script.Parent.Parent["I/O Module"].Configration).Whitelist.Enabled == true then
			if Player:GetRankInGroup(require(script.Parent.Parent["I/O Module"].Configration).Whitelist.GroupID) >= require(script.Parent.Parent["I/O Module"].Configration).Whitelist.RankID then
				return true
			else
				return false
			end
		elseif  table.find(require(script.Parent.Parent["I/O Module"].Configration).Whitelist.UserIDs, Player.UserId) then
		return true
		else
			return true
		end
	end,
}

return module
