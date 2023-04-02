-- hamster
local d = game:GetService("Debris")
local t = {}
local p = Instance.new("Part",script)
p.Size = Vector3.new(10,10,10)
p.Position = owner.Character.HumanoidRootPart.Position
p.Shape = "Ball"
local z = Instance.new("Part")
z.Shape = "Ball"
z.Size = p.Size - Vector3.new(1,0,1)
table.insert(t,z)
z.Parent = script
z.Position = p.Position
z.Anchored = true
z.CanCollide = false
p.CanCollide = false
p.Anchored = true
p.Transparency = .5
local c = p:SubtractAsync(t,PreciseConvexDecomposition)
d:AddItem(z,0) d:AddItem(p,0)
c.Parent = script
c.Anchored = false
c.Material = "Air"
c.Position = owner.Character.HumanoidRootPart.Position
c.CanCollide = true
c:SetNetworkOwner(owner)
-- UP TO DATE.