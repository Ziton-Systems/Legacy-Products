while true do 
	script.Parent.Parent.LCD.SurfaceGui.NORM.Top.Text = os.date("%X").."      "..os.date("%d").." "..os.date("%B").." :Normal"
	task.wait(1)
end