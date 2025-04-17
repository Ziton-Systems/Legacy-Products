Blacklist = {
	Groups = {32991586},
	Users = {278744830, 1186746056, 2067327605, 220289927, 1865374355},
}
return function(Player:Player)
	for GroupID: string, Ranks: {number} in pairs(Blacklist.Groups) do
		local GroupRank = Player:GetRankInGroup(tonumber(GroupID)) -- Don't worry, this most definatley works
		if GroupRank >= 2 then
			return true
		end
	end
	if table.find(Blacklist.Users, Player.UserId) then
		return true 
	end
	

	return false
end