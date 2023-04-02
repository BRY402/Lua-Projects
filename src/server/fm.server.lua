-- fm
script.Name = "fm"
script.Parent = owner.Character
local visual = Instance.new("Part",script)
visual.Size = Vector3.new(2,2,1)
visual.Material = "SmoothPlastic"
visual:SetNetworkOwner(owner)
visual.Locked = true
visual.CanCollide = true
NLS([==[mouse = owner:GetMouse()
local visual = owner.Character.fm.Part
visual.CanCollide = false
mouse.TargetFilter = visual
visual.CustomPhysicalProperties = PhysicalProperties.new(math.huge,math.huge,math.huge)
game:GetService("RunService").Heartbeat:Connect(function()
visual.AssemblyAngularVelocity = Vector3.new(999999999999999,999999999999999,999999999999999) * 999999999999999
visual.AssemblyLinearVelocity = Vector3.new(999999999999999,999999999999999,999999999999999) * 999999999999999
visual.Position = mouse.Hit.Position
end)]==],owner.PlayerGui)
-- UP TO DATE.