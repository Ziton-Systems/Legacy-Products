while true do 
	task.wait(1)
	script.Parent.Parent.LEDs.Fire.Material = Enum.Material.Neon
	script.Parent.Parent.LEDs.Fire.BrickColor = BrickColor.new("Really red")
	task.wait(1)
	script.Parent.Parent.LEDs.Fire.Material = Enum.Material.SmoothPlastic
	script.Parent.Parent.LEDs.Fire.BrickColor = BrickColor.new("Medium stone grey")
end