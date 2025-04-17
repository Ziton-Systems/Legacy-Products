while true do 
	wait(1)
	script.Parent.Parent.VAD.Transparency = 0.58
	script.Parent.Parent.VAD.PointLight.Enabled = false
	script.Parent.Parent.VAD.BrickColor = BrickColor.new("Medium stone grey")
	wait(1)
	script.Parent.Parent.VAD.Transparency = 0
	script.Parent.Parent.VAD.PointLight.Enabled = true 
	script.Parent.Parent.VAD.BrickColor = BrickColor.new("Really red")
end