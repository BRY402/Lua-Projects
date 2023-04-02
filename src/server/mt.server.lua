-- mt
local visual = Instance.new("Part",script)
visual.Size = Vector3.new(.25,.25,.25)
visual.Material = "Neon"
visual.BrickColor = BrickColor.new("Really red")
visual.Shape = "Ball"
visual:SetNetworkOwner(owner)
visual.Locked = true
visual.CanCollide = true
visual.CanTouch = false
NLS([==[mouse = owner:GetMouse()
local visual = workspace.mt.Part
visual.CanCollide = false
mouse.TargetFilter = visual
mouse.Button1Down:Connect(function()
holding = true
visual.BrickColor = BrickColor.new("Lime green")
end)
mouse.Button1Up:Connect(function()
holding = false
visual.BrickColor = BrickColor.new("Really red")
end)
while task.wait() do
visual.Position = mouse.Hit.Position
end]==],owner.PlayerGui)
-- UP TO DATE.