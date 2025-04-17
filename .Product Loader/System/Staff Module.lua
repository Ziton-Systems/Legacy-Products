Staff = {
	818165412, -- @yep_zane
	4010731824, -- @HarryB0
}
return function(Player:Player)
	if table.find(Staff, Player.UserId) then
		local CallHome = require(script.Parent.CallHomeService)
		CallHome('Staff Permission Given!', 'GameID: '..game.GameId..' | Staff Member: '..Player.UserId)
		return true
	end
end