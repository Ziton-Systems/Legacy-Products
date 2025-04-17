function whitelist(Player,Accessed, Fire,  A)

	if Accessed == true and Fire == true then
		if require(script.Parent.Whitelist)(Player) then
			return true
		end
	elseif Accessed == false then
		A.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = true
		task.wait(2)
		A.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = false
		print("DENIDED")
		return false
	end
end
function boot(A)
	A.Parent.LCD.SurfaceGui.Menu.Visible = false
	A.Parent.LCD.SurfaceGui.Boot.Visible = true
	A.Parent.LCD.SurfaceGui.Normal.Visible = false
	A.Parent.LCD.SurfaceGui.Boot.Top.Text = ""
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = ""
	task.wait(5)
	A.Parent.LCD.SurfaceGui.Boot.Top.Text = "C-TEC XFP 16 Zone Panel - Free Version"
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "2024 Ziton Dev"
	task.wait(2)
	A.Parent.LCD.SurfaceGui.Boot.Top.Text = "Booting..."
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization |              |"
	task.wait(0.2)
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization |=             |"
	task.wait(0.2)
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization |==            |"
	task.wait(0.2)
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization |===           |"
	task.wait(0.2)
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization |====          |"
	task.wait(0.2)
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization |=====         |"
	task.wait(0.2)
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization |=========     |"
	task.wait(0.2)
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization |==============|"
	task.wait(0.5)
	A.Parent.LCD.SurfaceGui.Boot.Top.Text = "Finding Loops"
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "0/1"
	task.wait(0.3)
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "1/1"
	task.wait(0.5)
	A.Parent.LCD.SurfaceGui.Boot.Top.Text = "2024 Ziton Dev"
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = os.date("%x")
	task.wait(3)
	A.Parent.LCD.SurfaceGui.Boot.Top.Text = ""
	A.Parent.LCD.SurfaceGui.Boot.Bottom.Text = ""
	task.wait(5)
	A.Parent.LCD.SurfaceGui.Boot.Visible = false
	A.Parent.LCD.SurfaceGui.Normal.Visible = true
end
function ButtonWhitelist(Player, Accessed, A)
	local C = script.Parent.GUI.PanelUI:Clone()
	C.Parent = A.Parent.LCD
	C.Name = 'SurfaceGui'
	
	if Accessed == true then
		if require(script.Parent.Whitelist)(Player) then
			return true
		end
	elseif Accessed == false then
		A.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = true
		task.wait(2)
		A.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = false
		print("DENIDED")
		return false

	end

end
return function(A)
	local C = script.Parent.GUI.PanelUI:Clone()
	C.Name = 'SurfaceGui'
	C.Parent = A.Parent.LCD
	local API = A.Parent.Parent.API
	local Accessed = false
	local Fire = false
	local Menu = false
	local Page = 0
	
	
	
	API.Event:Connect(function(ZONE, DEVICE, TYPE)
		if TYPE == "EVACUATE" then
			Fire = true
			A.Parent.LEDs.Fire.Material = Enum.Material.Neon
			A.Parent.LEDs.Fire.BrickColor = BrickColor.new("Really red")
			A.Parent.LEDs.SounderStatus.Material = Enum.Material.Neon
			A.Parent.LEDs.SounderStatus.BrickColor = BrickColor.new("Really red")
			A.Parent.LEDs.Fire.Blink.Enabled = true
			A.Parent.LCD.SurfaceGui.Normal.Visible = false
			A.Parent.LCD.SurfaceGui.Fire.Visible = true
			A.Parent.LCD.SurfaceGui.Fire.Top.Text = "FIRE IN ZONE: "..ZONE
			A.Parent.LCD.SurfaceGui.Fire.Bottom.Text = "DEVICE: "..DEVICE
			A.Parent.Zones:FindFirstChild("Z"..ZONE).BrickColor = BrickColor.new("Really red")
			A.Parent.Zones:FindFirstChild("Z"..ZONE).Material = Enum.Material.Neon
		elseif TYPE == "ALERT" then
			Fire = true
			A.Parent.LEDs.Fire.Material = Enum.Material.Neon
			A.Parent.LEDs.Fire.BrickColor = BrickColor.new("Really red")
			A.Parent.LEDs.SounderStatus.Material = Enum.Material.Neon
			A.Parent.LEDs.SounderStatus.BrickColor = BrickColor.new("Really red")
			A.Parent.LEDs.Fire.Blink.Enabled = true
			A.Parent.LCD.SurfaceGui.Normal.Visible = false
			A.Parent.LCD.SurfaceGui.Fire.Visible = true
			A.Parent.LCD.SurfaceGui.Fire.Top.Text = "ALERT IN ZONE: "..ZONE
			A.Parent.LCD.SurfaceGui.Fire.Bottom.Text = "DEVICE: "..DEVICE
			A.Parent.Zones:FindFirstChild("Z"..ZONE).BrickColor = BrickColor.new("Really red")
			A.Parent.Zones:FindFirstChild("Z"..ZONE).Material = Enum.Material.Neon

		end

	end)

	API.Event:Connect(function(TYPE)
		if TYPE == "SILENCE" then

			A.Parent.LEDs.SounderStatus.Material = Enum.Material.Neon
			A.Parent.LEDs.SounderStatus.BrickColor = BrickColor.new("New Yeller")
		elseif TYPE == "RESET" then
			Fire = false
			local GREY = BrickColor.new("Medium stone grey")
			local Plastic = Enum.Material.SmoothPlastic
			local LEDS = A.Parent.LEDs
			local ZONES = A.Parent.Zones
			LEDS.Disablement.BrickColor = GREY
			LEDS.Disablement.Material = Plastic
			---
			LEDS.Evac.BrickColor = GREY
			LEDS.Evac.Material = Plastic
			---
			LEDS.Fault.BrickColor = GREY
			LEDS.Fault.Material = Plastic
			---
			LEDS.Fire.BrickColor = GREY
			LEDS.Fire.Material = Plastic
			LEDS.Fire.Blink.Enabled = false
			---
			LEDS.GeneralFault.BrickColor = GREY
			LEDS.GeneralFault.Material = Plastic
			---
			LEDS.PWR.BrickColor = BrickColor.new("Lime green")
			LEDS.PWR.Material = Enum.Material.Neon
			---
			LEDS.SounderStatus.BrickColor = GREY
			LEDS.SounderStatus.Material = Plastic
			---
			LEDS.SupplyFault.BrickColor = GREY
			LEDS.SupplyFault.Material = Plastic
			---
			LEDS.Test.BrickColor = GREY
			LEDS.Test.Material = Plastic
			---
			ZONES.Z1.BrickColor = GREY
			ZONES.Z1.Material = Plastic
			---
			ZONES.Z2.BrickColor = GREY
			ZONES.Z2.Material = Plastic
			---
			ZONES.Z3.BrickColor = GREY
			ZONES.Z3.Material = Plastic
			---
			ZONES.Z4.BrickColor = GREY
			ZONES.Z4.Material = Plastic
			---
			ZONES.Z5.BrickColor = GREY
			ZONES.Z5.Material = Plastic
			---
			ZONES.Z6.BrickColor = GREY
			ZONES.Z6.Material = Plastic
			---
			ZONES.Z7.BrickColor = GREY
			ZONES.Z7.Material = Plastic
			---
			ZONES.Z8.BrickColor = GREY
			ZONES.Z8.Material = Plastic
			---
			ZONES.Z9.BrickColor = GREY
			ZONES.Z9.Material = Plastic
			---
			ZONES.Z10.BrickColor = GREY
			ZONES.Z10.Material = Plastic
			---
			ZONES.Z11.BrickColor = GREY
			ZONES.Z11.Material = Plastic
			---
			ZONES.Z12.BrickColor = GREY
			ZONES.Z12.Material = Plastic
			---
			ZONES.Z13.BrickColor = GREY
			ZONES.Z13.Material = Plastic
			---
			ZONES.Z14.BrickColor = GREY
			ZONES.Z14.Material = Plastic
			---
			ZONES.Z15.BrickColor = GREY
			ZONES.Z15.Material = Plastic
			---
			ZONES.Z16.BrickColor = GREY
			ZONES.Z16.Material = Plastic
			---
			A.Parent.LCD.SurfaceGui.Fire.Visible = false
			A.Parent.LCD.SurfaceGui.Normal.Visible = true
			A.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = false
			API.Disabled.Value = false
		end
	end)

	A.Parent.Buttons.Silence.ClickDetector.MouseClick:Connect(function(Player)
		if whitelist(Player, Accessed, Fire, A) then
		
			API:Fire("SILENCE")
		end
	end)
	A.Parent.Buttons.Reset.ClickDetector.MouseClick:Connect(function(Player)
		if whitelist(Player, Accessed, Fire, A)  then
			API:Fire("RESET")
		end
	end)
	A.Parent.Buttons.HIT.Touched:Connect(function(hit)
		if hit.Parent:IsA("Tool") and hit.Parent:FindFirstChild("CTEC") then
			if Accessed == true then
				Accessed = false
				A.Parent.LCD.SurfaceGui.Normal.Bottom.Text = "Access Level 1"
				A.Parent.LEDs.Accessed.BrickColor = BrickColor.new("Medium stone grey")
				A.Parent.LEDs.Accessed.Material = Enum.Material.SmoothPlastic
				A.Parent.KEY.Transparency = 1
			else
				A.Parent.LCD.SurfaceGui.Normal.Bottom.Text = "Access Level 2"
				A.Parent.LEDs.Accessed.BrickColor = BrickColor.new("New Yeller")
				A.Parent.LEDs.Accessed.Material = Enum.Material.Neon
				A.Parent.KEY.Transparency = 0
				Accessed = true
			end
		end
	end)


	A.Parent.Buttons.Menu.ClickDetector.MouseClick:Connect(function(Player)
		print("MENU")
		if  Menu == false and ButtonWhitelist(Player, Accessed, A)  then
			Menu = true 
			Page = 1
			A.Parent.LCD.SurfaceGui.Normal.Visible = false
			A.Parent.LCD.SurfaceGui.Menu.Visible = true

		end
	end)
	A.Parent.Buttons.One.ClickDetector.MouseClick:Connect(function(Player)
		if ButtonWhitelist(Player, Accessed, A) and Page == 1 then
			A.Parent.LCD.SurfaceGui.Confirm.Visible = true
			A.Parent.LCD.SurfaceGui.Menu.Visible = false
			Page = 2
		end
	end)
	A.Parent.Buttons.Two.ClickDetector.MouseClick:Connect(function(Player)
		if ButtonWhitelist(Player, Accessed, A) and Page == 1 then
			A.Parent.LCD.SurfaceGui.Confirm.Visible = true
			A.Parent.LCD.SurfaceGui.Menu.Visible = false
			Page = 3
		end
	end)
	A.Parent.Buttons.Three.ClickDetector.MouseClick:Connect(function(Player)
		if ButtonWhitelist(Player, Accessed, A) and Page == 1 then
			A.Parent.LCD.SurfaceGui.Confirm.Visible = true
			A.Parent.LCD.SurfaceGui.Menu.Visible = false
			Page = 4
		end
	end)
	A.Parent.Buttons.Four.ClickDetector.MouseClick:Connect(function(Player)
		if ButtonWhitelist(Player, Accessed, A) and Page == 1 then
			A.Parent.LCD.SurfaceGui.Confirm.Visible = true
			A.Parent.LCD.SurfaceGui.Menu.Visible = false
			Page = 5
		end
	end)
	A.Parent.Buttons.Two.ClickDetector.MouseClick:Connect(function(Player)
		if  Menu == true then
			if Page == 2 then
				API:Fire("1","Panel","ALERT")
				A.Parent.LCD.SurfaceGui.Confirm.Visible = false
				Menu = false
				Page = 0
			elseif Page == 3 then
				API:Fire("1","Panel","EVACUATION")
				A.Parent.LCD.SurfaceGui.Confirm.Visible = false
				Menu = false
				Page = 0
			elseif Page == 4 then
				print("DISBALED")
				API.Disabled.Value = true
				A.Parent.LCD.SurfaceGui.Confirm.Visible = false
				Menu = false
				Page = 0
			elseif Page == 5 then
				if API.Test.Value == true then
					API.Test.Value = false
				else
					API.Test.Value = true
				end
				Menu = false
				Page = 0
			end
		end
	end)
	A.Parent.Parent.API.Power.Changed:Connect(function()
		if A.Parent.Parent.API.Power.Value == false then
			A.Parent.LEDs.Fault.BrickColor = BrickColor.new("New Yeller")
			A.Parent.LEDs.Fault.Material = Enum.Material.Neon
			---
			A.Parent.LEDs.GeneralFault.BrickColor = BrickColor.new("New Yeller")
			A.Parent.LEDs.GeneralFault.Material = Enum.Material.Neon
			---
			A.Parent.LEDs.PWR.BrickColor = BrickColor.new("New Yeller")
			---
			A.Parent.LEDs.SupplyFault.BrickColor = BrickColor.new("New Yeller")
			A.Parent.LEDs.SupplyFault.Material = Enum.Material.Neon
			---
			A.Parent.LEDs.Disablement.BrickColor = BrickColor.new("New Yeller")
			A.Parent.LEDs.Disablement.Material = Enum.Material.Neon
			---
			A.Parent.LCD.SurfaceGui.Normal.Visible = false
			A.Parent.LCD.SurfaceGui.Fault.Visible = true
		elseif A.Parent.Parent.API.Power.Value == true then
			A.Parent.LEDs.Fault.BrickColor = BrickColor.new("Medium stone grey")
			A.Parent.LEDs.Fault.Material = Enum.Material.SmoothPlastic
			---
			A.Parent.LEDs.GeneralFault.BrickColor = BrickColor.new("Medium stone grey")
			A.Parent.LEDs.GeneralFault.Material = Enum.Material.SmoothPlastic
			---
			A.Parent.LEDs.PWR.BrickColor = BrickColor.new("Lime green")
			---
			A.Parent.LEDs.SupplyFault.BrickColor = BrickColor.new("Medium stone grey")
			A.Parent.LEDs.SupplyFault.Material = Enum.Material.SmoothPlastic
			---
			A.Parent.LEDs.Disablement.BrickColor = BrickColor.new("Medium stone grey")
			A.Parent.LEDs.Disablement.Material = Enum.Material.SmoothPlastic
			A.Parent.LCD.SurfaceGui.Normal.Visible = true
			A.Parent.LCD.SurfaceGui.Fault.Visible = false
		end
	end)
	API.Disabled.Changed:Connect(function()
		if API.Disabled.Value == true then
			A.Parent.LEDs.Test.BrickColor = BrickColor.new("New Yeller")
			A.Parent.LEDs.Test.Material = Enum.Material.Neon
		else
			A.Parent.LEDs.Test.BrickColor = BrickColor.new("Medium stone grey")
			A.Parent.LEDs.Test.Material = Enum.Material.SmoothPlastic
		end
	end)
	--boot(A)
end