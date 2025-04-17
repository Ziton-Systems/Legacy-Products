return function(A, Config, Banlist)
	local DataStore = game:GetService('DataStoreService')
	game.Players.PlayerAdded:Connect(function(Player)
		local PlrData = DataStore:GetDataStore(Config.DataStore):GetAsync(Player.UserId)
		if table:find(Banlist, Player.UserId) then
			Player:Kick(Config.BanMsg)
		elseif PlrData == 1 then
			Player:Kick(Config.BanMsg)
		else
			DataStore:GetDataStore(Config.DataStore):SetAsync(Player.UserId, 0)
		end
	end)
end