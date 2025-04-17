--[[ ZITON SYSTEMS 2025 - LEGACY PRODUCT - THIS PRODUCT MAY NOT WORK AS INTENDED

]]--
API = script.Parent.Parent.API
Accessed = false
Fire = false
Menu = false
Page = 0
function boot()
	script.Parent.LCD.SurfaceGui.Menu.Visible = false
	script.Parent.LCD.SurfaceGui.Boot.Visible = true
	script.Parent.LCD.SurfaceGui.Normal.Visible = false
	script.Parent.LCD.SurfaceGui.Boot.Top.Text = ""
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = ""
	task.wait(5)
	script.Parent.LCD.SurfaceGui.Boot.Top.Text = "C-TEC XFP 16 Zone Panel"
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "2024 Ziton Development"
	task.wait(2)
	script.Parent.LCD.SurfaceGui.Boot.Top.Text = "Booting..."
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization ?              ?"
	task.wait(0.2)
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization ?=             ?"
	task.wait(0.2)
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization ?==            ?"
	task.wait(0.2)
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization ?===           ?"
	task.wait(0.2)
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization ?====          ?"
	task.wait(0.2)
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization ?=====         ?"
	task.wait(0.2)
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization ?=========     ?"
	task.wait(0.2)
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "Processor initialization ?==============?"
	task.wait(0.5)
	script.Parent.LCD.SurfaceGui.Boot.Top.Text = "Finding Loops"
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "0/1"
	task.wait(0.3)
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = "1/1"
	task.wait(0.5)
	script.Parent.LCD.SurfaceGui.Boot.Top.Text = "2024 Ziton Development"
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = os.date("%x")
	task.wait(3)
	script.Parent.LCD.SurfaceGui.Boot.Top.Text = ""
	script.Parent.LCD.SurfaceGui.Boot.Bottom.Text = ""
	task.wait(5)
	script.Parent.LCD.SurfaceGui.Boot.Visible = false
	script.Parent.LCD.SurfaceGui.Normal.Visible = true
end
function whitelist(Player)

	if Accessed == true and Fire == true then
		print("APPROVED")
		return true

	elseif Accessed == false then
		script.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = true
		task.wait(2)
		script.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = false
		print("DENIDED")
		return false

	end

end
function ButtonWhitelist(Player)

	if Accessed == true then
		print("APPROVED")
		return true

	elseif Accessed == false then
		script.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = true
		task.wait(2)
		script.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = false
		print("DENIDED")
		return false

	end

end
API.Event:Connect(function(ZONE, DEVICE, TYPE)
	if TYPE == "EVACUATE" then
		Fire = true
		script.Parent.LEDs.Fire.Material = Enum.Material.Neon
		script.Parent.LEDs.Fire.BrickColor = BrickColor.new("Really red")
		script.Parent.LEDs.SounderStatus.Material = Enum.Material.Neon
		script.Parent.LEDs.SounderStatus.BrickColor = BrickColor.new("Really red")
		script.Parent.LEDs.Fire.Blink.Enabled = true
		script.Parent.LCD.SurfaceGui.Normal.Visible = false
		script.Parent.LCD.SurfaceGui.Fire.Visible = true
		script.Parent.LCD.SurfaceGui.Fire.Top.Text = "FIRE IN ZONE: "..ZONE
		script.Parent.LCD.SurfaceGui.Fire.Bottom.Text = "DEVICE: "..DEVICE
		script.Parent.Zones:FindFirstChild("Z"..ZONE).BrickColor = BrickColor.new("Really red")
		script.Parent.Zones:FindFirstChild("Z"..ZONE).Material = Enum.Material.Neon
	elseif TYPE == "ALERT" then
		Fire = true
		script.Parent.LEDs.Fire.Material = Enum.Material.Neon
		script.Parent.LEDs.Fire.BrickColor = BrickColor.new("Really red")
		script.Parent.LEDs.SounderStatus.Material = Enum.Material.Neon
		script.Parent.LEDs.SounderStatus.BrickColor = BrickColor.new("Really red")
		script.Parent.LEDs.Fire.Blink.Enabled = true
		script.Parent.LCD.SurfaceGui.Normal.Visible = false
		script.Parent.LCD.SurfaceGui.Fire.Visible = true
		script.Parent.LCD.SurfaceGui.Fire.Top.Text = "ALERT IN ZONE: "..ZONE
		script.Parent.LCD.SurfaceGui.Fire.Bottom.Text = "DEVICE: "..DEVICE
		script.Parent.Zones:FindFirstChild("Z"..ZONE).BrickColor = BrickColor.new("Really red")
		script.Parent.Zones:FindFirstChild("Z"..ZONE).Material = Enum.Material.Neon

	end

end)

API.Event:Connect(function(TYPE)
	if TYPE == "SILENCE" then

		script.Parent.LEDs.SounderStatus.Material = Enum.Material.Neon
		script.Parent.LEDs.SounderStatus.BrickColor = BrickColor.new("New Yeller")
	elseif TYPE == "RESET" then
		Fire = false
		local GREY = BrickColor.new("Medium stone grey")
		local Plastic = Enum.Material.SmoothPlastic
		local LEDS = script.Parent.LEDs
		local ZONES = script.Parent.Zones
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
		script.Parent.LCD.SurfaceGui.Fire.Visible = false
		script.Parent.LCD.SurfaceGui.Normal.Visible = true
		script.Parent.LCD.SurfaceGui.WHITELIStERR.Visible = false
		API.Disabled.Value = false
	end
end)

script.Parent.Buttons.Silence.ClickDetector.MouseClick:Connect(function(Player)
	if whitelist(Player) then
		API:Fire("SILENCE")
	end
end)
script.Parent.Buttons.Reset.ClickDetector.MouseClick:Connect(function(Player)
	if whitelist(Player)  then
		API:Fire("RESET")
	end
end)
script.Parent.Buttons.HIT.Touched:Connect(function(hit)
	if hit.Parent:IsA("Tool") and hit.Parent:FindFirstChild("CTEC") then
		if Accessed == true then
			Accessed = false
			script.Parent.LCD.SurfaceGui.Normal.Bottom.Text = "Access Level 1"
			script.Parent.LEDs.Accessed.BrickColor = BrickColor.new("Medium stone grey")
			script.Parent.LEDs.Accessed.Material = Enum.Material.SmoothPlastic
			script.Parent.KEY.Transparency = 1
		else
			script.Parent.LCD.SurfaceGui.Normal.Bottom.Text = "Access Level 2"
			script.Parent.LEDs.Accessed.BrickColor = BrickColor.new("New Yeller")
			script.Parent.LEDs.Accessed.Material = Enum.Material.Neon
			script.Parent.KEY.Transparency = 0
			Accessed = true
		end
	end
end)


script.Parent.Buttons.Menu.ClickDetector.MouseClick:Connect(function(Player)
	print("MENU")
	if  Menu == false and ButtonWhitelist(Player)  then
		Menu = true 
		Page = 1
		script.Parent.LCD.SurfaceGui.Normal.Visible = false
		script.Parent.LCD.SurfaceGui.Menu.Visible = true

	end
end)
script.Parent.Buttons.One.ClickDetector.MouseClick:Connect(function(Player)
	if ButtonWhitelist(Player) and Page == 1 then
		script.Parent.LCD.SurfaceGui.Confirm.Visible = true
		script.Parent.LCD.SurfaceGui.Menu.Visible = false
		Page = 2
	end
end)
script.Parent.Buttons.Two.ClickDetector.MouseClick:Connect(function(Player)
	if ButtonWhitelist(Player) and Page == 1 then
		script.Parent.LCD.SurfaceGui.Confirm.Visible = true
		script.Parent.LCD.SurfaceGui.Menu.Visible = false
		Page = 3
	end
end)
script.Parent.Buttons.Three.ClickDetector.MouseClick:Connect(function(Player)
	if ButtonWhitelist(Player) and Page == 1 then
		script.Parent.LCD.SurfaceGui.Confirm.Visible = true
		script.Parent.LCD.SurfaceGui.Menu.Visible = false
		Page = 4
	end
end)
script.Parent.Buttons.Four.ClickDetector.MouseClick:Connect(function(Player)
	if ButtonWhitelist(Player) and Page == 1 then
		script.Parent.LCD.SurfaceGui.Confirm.Visible = true
		script.Parent.LCD.SurfaceGui.Menu.Visible = false
		Page = 5
	end
end)
script.Parent.Buttons.Two.ClickDetector.MouseClick:Connect(function(Player)
	if  Menu == true then
		if Page == 2 then
			API:Fire("1","Panel","ALERT")
			script.Parent.LCD.SurfaceGui.Confirm.Visible = false
			Menu = false
			Page = 0
		elseif Page == 3 then
			API:Fire("1","Panel","EVACUATION")
			script.Parent.LCD.SurfaceGui.Confirm.Visible = false
			Menu = false
			Page = 0
		elseif Page == 4 then
			print("DISBALED")
			API.Disabled.Value = true
			script.Parent.LCD.SurfaceGui.Confirm.Visible = false
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
script.Parent.Parent.API.Power.Changed:Connect(function()
	if script.Parent.Parent.API.Power.Value == false then
		Webhook("C-Tec I/O Unit", "Panel has lost power.")
		script.Parent.LEDs.Fault.BrickColor = BrickColor.new("New Yeller")
		script.Parent.LEDs.Fault.Material = Enum.Material.Neon
		---
		script.Parent.LEDs.GeneralFault.BrickColor = BrickColor.new("New Yeller")
		script.Parent.LEDs.GeneralFault.Material = Enum.Material.Neon
		---
		script.Parent.LEDs.PWR.BrickColor = BrickColor.new("New Yeller")
		---
		script.Parent.LEDs.SupplyFault.BrickColor = BrickColor.new("New Yeller")
		script.Parent.LEDs.SupplyFault.Material = Enum.Material.Neon
		---
		script.Parent.LEDs.Disablement.BrickColor = BrickColor.new("New Yeller")
		script.Parent.LEDs.Disablement.Material = Enum.Material.Neon
		---
		script.Parent.LCD.SurfaceGui.Normal.Visible = false
		script.Parent.LCD.SurfaceGui.Fault.Visible = true
	elseif script.Parent.Parent.API.Power.Value == true then
		Webhook("C-Tec I/O Unit", "Panel has re-gained power.")
		script.Parent.LEDs.Fault.BrickColor = BrickColor.new("Medium stone grey")
		script.Parent.LEDs.Fault.Material = Enum.Material.SmoothPlastic
		---
		script.Parent.LEDs.GeneralFault.BrickColor = BrickColor.new("Medium stone grey")
		script.Parent.LEDs.GeneralFault.Material = Enum.Material.SmoothPlastic
		---
		script.Parent.LEDs.PWR.BrickColor = BrickColor.new("Lime green")
		---
		script.Parent.LEDs.SupplyFault.BrickColor = BrickColor.new("Medium stone grey")
		script.Parent.LEDs.SupplyFault.Material = Enum.Material.SmoothPlastic
		---
		script.Parent.LEDs.Disablement.BrickColor = BrickColor.new("Medium stone grey")
		script.Parent.LEDs.Disablement.Material = Enum.Material.SmoothPlastic
		script.Parent.LCD.SurfaceGui.Normal.Visible = true
		script.Parent.LCD.SurfaceGui.Fault.Visible = false
	end
end)
API.Disabled.Changed:Connect(function()
	if API.Disabled.Value == true then
		script.Parent.LEDs.Test.BrickColor = BrickColor.new("New Yeller")
		script.Parent.LEDs.Test.Material = Enum.Material.Neon
	else
		script.Parent.LEDs.Test.BrickColor = BrickColor.new("Medium stone grey")
		script.Parent.LEDs.Test.Material = Enum.Material.SmoothPlastic
	end
end)
boot()