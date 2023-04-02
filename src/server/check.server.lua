-- check
NLS([==[local mouse = owner:GetMouse()
mouse.Button1Down:Connect(function() local v = mouse.Target if v.Parent:IsA("Model") and v.Parent:FindFirstChildOfClass("Humanoid") ~= nil then print("User: "..v.Parent.Name)
print(" DisplayName: "..v.Parent.Humanoid.DisplayName)
print(" Health: "..v.Parent.Humanoid.Health)
print(" MaxHealth: "..v.Parent.Humanoid.MaxHealth)
print(" WalkSpeed: "..v.Parent.Humanoid.WalkSpeed)
print(" JumpPower: "..v.Parent.Humanoid.JumpPower) end end)]==],owner.PlayerGui)
-- UP TO DATE.