--[[ ERROR  
- Icon for login is not working
]]

return function(A, Debug, Settings) 
	local GUI = script.Parent.GUIs.CafePOS:Clone()
	GUI.Parent = A.Parent.Screen.Screen
	--|| SETUP ||--
	if not game.ReplicatedStorage:FindFirstChild('ZD:CAFEPOS:TOOL_STORE') then
		local F = Instance.new('Folder')
		F.Name = 'ZD:CAFEPOS:TOOL_STORE'
		F.Parent = game.ReplicatedStorage
	end
	task.wait(0.2)
	local TS = script.TOOL_STORE
	--|| BOOT ||-- 
	A.Parent.Scanner.Model.Part.BrickColor = BrickColor.new('Dark stone grey')
	A.Parent.Scanner.LED.Material = Enum.Material.SmoothPlastic
	A.Parent.Screen.Screen.CafePOS.LOGIN.Visible = false
	A.Parent.Screen.Screen.CafePOS.Session.Visible = false
	A.Parent.Screen.Screen.CafePOS.BOOT.Visible = true
	task.wait(math.random(1,1.26))
	A.Parent.Screen.Screen.CafePOS.BOOT["Loading Screeen"].Bar2.Visible = true
	task.wait(math.random(2,2.64))
	A.Parent.Screen.Screen.CafePOS.BOOT["Loading Screeen"].Bar3.Visible = true
	task.wait(2)
	A.Parent.Screen.Screen.CafePOS.BOOT.Visible = false
	A.Parent.Screen.Screen.CafePOS.BOOT["Loading Screeen"].Bar2.Visible = false
	A.Parent.Screen.Screen.CafePOS.BOOT["Loading Screeen"].Bar3.Visible = false
	A.Parent.Screen.Screen.CafePOS.LOGIN.Visible = true
	A.Parent.Scanner.Model.Part.BrickColor = BrickColor.new('Really red')
	A.Parent.Scanner.LED.Material = Enum.Material.Neon
	--A.Parent.Screen.Screen.CafePOS.LOGIN.ICO.ImageLabel = Settings.LOGO
	--|| LOGIN ||--
    A.Parent.Scanner.Hit.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild('ZD:POS:STAFF') and A.Parent.Screen.Screen.CafePOS.LOGIN.Visible == true then
			    A.Parent.Screen.Screen.CafePOS.LOGIN.Visible = false
				A.Parent.Screen.Screen.CafePOS.Session.Visible = true
				A.Parent.Screen.Screen.CafePOS.Session.CTRLBAR.ACC.Text = hit.Parent.Parent.Name
		end
	end)
	--|| SCANNING ||--
	local Items = 0
	local Price = 0
	local ITM = script.ITM
	A.Parent.Scanner.Hit.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild('ZD:POS:ITEM') and A.Parent.Screen.Screen.CafePOS.Session.Visible == true then
			Price = hit.Parent:FindFirstChild('ZD:POS:ITEM').Price.Value + Price
			Items = Items + 1
			local C = ITM:Clone()
			C.Name = hit.Parent.Name
			C.NAME.Text = hit.Parent.Name
			C.Price.Text = Settings.CURRENCY..hit.Parent:FindFirstChild('ZD:POS:ITEM').Price.Value
			C.Parent = A.Parent.Screen.Screen.CafePOS.Session.ITEMS
			A.Parent.Screen.Screen.CafePOS.Session.Totals.ITEM.Text = 'Items: '..Items
			A.Parent.Screen.Screen.CafePOS.Session.Totals.Price.Text = 'Price: '..Settings.CURRENCY..Price
			task.wait(0.0001)
			hit.Parent.Parent = TS
			hit.Parent:FindFirstChild('ZD:POS:ITEM'):Destroy()
		end
	end)
	--|| VOID ||--
	A.Parent.Screen.Screen.CafePOS.Session.Buttons.Void.MouseButton1Click:Connect(function()
		if Items >= 1 then
			for i, v in pairs(TS:GetChildren()) do
				v:Destroy()
			end
			Items = 0
			Price = 0
			A.Parent.Screen.Screen.CafePOS.Session.Totals.Price.Text = 'Price: '..Settings.CURRENCY..'0'
			A.Parent.Screen.Screen.CafePOS.Session.Totals.ITEM.Text = 'Items:  0'
			for i, v in pairs(A.Parent.Screen.Screen.CafePOS.Session.ITEMS:GetChildren()) do
				if v.Name == 'TextLabel' then
				else
					v:Destroy()
				end
			end
		end
	end)
	--|| RESTART ||--
	A.Parent.Screen.Screen.CafePOS.Session.Buttons.Restart.MouseButton1Click:Connect(function()
		Price = 0
		Items = 0
		for i, v in pairs(TS:GetChildren()) do
			v:Destroy()
		end
		Items = 0
		Price = 0
		A.Parent.Screen.Screen.CafePOS.Session.Totals.Price.Text = 'Price: '..Settings.CURRENCY..'0'
		A.Parent.Screen.Screen.CafePOS.Session.Totals.ITEM.Text = 'Items:  0'
		for i, v in pairs(A.Parent.Screen.Screen.CafePOS.Session.ITEMS:GetChildren()) do
			if v.Name == 'TextLabel' then
			else
				v:Destroy()
			end
		end
		A.Parent.Screen.Screen.CafePOS.Session.Visible = false
		A.Parent.Scanner.Model.Part.BrickColor = BrickColor.new('Dark stone grey')
		A.Parent.Scanner.LED.Material = Enum.Material.SmoothPlastic
	    task.wait(math.random(2.53,2.9))
		A.Parent.Screen.Screen.CafePOS.LOGIN.Visible = false
		A.Parent.Screen.Screen.CafePOS.Session.Visible = false
		A.Parent.Screen.Screen.CafePOS.BOOT.Visible = true
		task.wait(math.random(1,1.26))
		A.Parent.Screen.Screen.CafePOS.BOOT["Loading Screeen"].Bar2.Visible = true
		task.wait(math.random(2,2.64))
		A.Parent.Screen.Screen.CafePOS.BOOT["Loading Screeen"].Bar3.Visible = true
		task.wait(2)
		A.Parent.Screen.Screen.CafePOS.BOOT.Visible = false
		A.Parent.Screen.Screen.CafePOS.BOOT["Loading Screeen"].Bar2.Visible = false
		A.Parent.Screen.Screen.CafePOS.BOOT["Loading Screeen"].Bar3.Visible = false
		A.Parent.Screen.Screen.CafePOS.LOGIN.Visible = true
		A.Parent.Scanner.Model.Part.BrickColor = BrickColor.new('Really red')
		A.Parent.Scanner.LED.Material = Enum.Material.Neon
		--A.Parent.Screen.Screen.CafePOS.LOGIN.ICO.ImageLabel = Settings.LOGO
	end)
	--|| SIGN OFF ||--
	A.Parent.Screen.Screen.CafePOS.Session.Buttons.SignOFF.MouseButton1Click:Connect(function()
		Price = 0
		Items = 0
		for i, v in pairs(TS:GetChildren()) do
			v:Destroy()
		end
		Items = 0
		Price = 0
		A.Parent.Screen.Screen.CafePOS.Session.Totals.Price.Text = 'Price: '..Settings.CURRENCY..'0'
		A.Parent.Screen.Screen.CafePOS.Session.Totals.ITEM.Text = 'Items:  0'
		for i, v in pairs(A.Parent.Screen.Screen.CafePOS.Session.ITEMS:GetChildren()) do
			if v.Name == 'TextLabel' then
			else
				v:Destroy()
			end
		end
		A.Parent.Screen.Screen.CafePOS.Session.Visible = false
		A.Parent.Screen.Screen.CafePOS.LOGIN.Visible = true
	end)
	--|| PAYMENT ||-- 
	A.Parent.Screen.Screen.CafePOS.Session.Buttons.Pay.MouseButton1Click:Connect(function()
		A.Parent.Screen.Screen.CafePOS.Session.Buttons.Pay.Text = 'Cancel Payment'
		--A.Parent.Screen.Screen.CafePOS.Session.Buttons.Pay.BackgroundColor3 = Color3('0, 235, 0')
		A.Parent.Screen.Screen.CafePOS.Session.Buttons.Pay.MouseButton1Click:Connect(function()
			A.Parent.Screen.Screen.CafePOS.Session.Buttons.Pay.Text = 'Order'
			A.Parent.EFT.Screen.SurfaceGui.Idle.Visible = true
			A.Parent.EFT.Screen.SurfaceGui.Payment.Visible = false
		end)
		A.Parent.EFT.HIT.Touched:Connect(function(hit)
			A.Parent.EFT.Screen.SurfaceGui.Idle.Visible = true
			A.Parent.EFT.Screen.SurfaceGui.Payment.Visible = false
			if hit.Parent:FindFirstChild('ZD:POS:DEBIT') then
				A.Parent.EFT.Sound:Play()
				task.wait(0.2)
				for i, v in pairs(TS:GetChildren()) do
					v.Parent = game.Players:FindFirstChild(hit.Parent.Parent.Name):FindFirstChild('Backpack')
				end
				A.Parent.Screen.Screen.CafePOS.Session.Buttons.Pay.Text = 'Order'
				Items = 0
				Price = 0
				A.Parent.Screen.Screen.CafePOS.Session.Totals.Price.Text = 'Price: '..Settings.CURRENCY..'0'
				A.Parent.Screen.Screen.CafePOS.Session.Totals.ITEM.Text = 'Items:  0'
				for i, v in pairs(A.Parent.Screen.Screen.CafePOS.Session.ITEMS:GetChildren()) do
					if v.Name == 'TextLabel' then
					else
						v:Destroy()
					end
				
				end
			end
		end)
	end)
end