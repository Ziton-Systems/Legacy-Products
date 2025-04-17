return function(A)
local WLS = require(script.Parent.Whitelist)
	A.Parent.Onkey.ClickDetector.MouseClick:Connect(function(Player)
		if WLS(Player)  then
			if A.Parent.Parent.API.Power.Value == true then
				A.Parent.Parent.API.Power.Value = false
				A.Parent.LED.BrickColor = BrickColor.new("Really red")
				A.Parent.Onkey.Orientation = Vector3.new(A.Parent.Onkey.Orientation.X , A.Parent.Onkey.Orientation.Y , 0)
			else
				A.Parent.Parent.API.Power.Value = true
				A.Parent.LED.BrickColor = BrickColor.new("Lime green")
				A.Parent.Onkey.Orientation = Vector3.new(A.Parent.Onkey.Orientation.X , A.Parent.Onkey.Orientation.Y , 90)
			end
		end
	end)
	A.Parent.Parent.API.Power.Changed:Connect(function()
		if A.Parent.Parent.API.Power.Value == true then
			A.Parent.Onkey.Orientation = Vector3.new(A.Parent.Onkey.Orientation.X , A.Parent.Onkey.Orientation.Y , 0)
			A.Parent.LED.BrickColor = BrickColor.new("Lime green")
		else
			A.Parent.LED.BrickColor = BrickColor.new("Really red")
			A.Parent.Onkey.Orientation = Vector3.new(A.Parent.Onkey.Orientation.X , A.Parent.Onkey.Orientation.Y , 90)
		end
	end)
end