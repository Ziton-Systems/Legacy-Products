--[[ ZITON SYSTEMS 2025 - LEGACY PRODUCT - THIS PRODUCT MAY NOT WORK AS INTENDED]]--

-- Please not this product was never actually released. It only has the very basic coding done!

Debounce = false
script.Parent.HIT.Touched:Connect(function(hit)
	if Debounce == false then
		Debounce = true
		script.Parent.StandL.HingeConstraint.TargetAngle = 90
		script.Parent.StandR.HingeConstraint.TargetAngle = -90
		wait(5)
		script.Parent.StandL.HingeConstraint.TargetAngle = 0
		script.Parent.StandR.HingeConstraint.TargetAngle = 0
		Debounce = false
	end
end)
