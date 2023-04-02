local g = 1
local p1 = Instance.new("Part",script)
p1.Anchored = true
p1.CanCollide = false
p1.Size = Vector3.new(3,3,3)
p1.Shape = "Ball"
p1.Position = Vector3.new(-10,10,0)
local p2 = p1:Clone()
p2.Parent = script
p2.Position = Vector3.new(10,10,0)
while task.wait() do
gravnum = (p1.Position - p2.Position).magnitude
gforce = (g * (p1.Mass * p2.Mass) / (gravnum ^ 2)) * .0000000000667408
p1.CFrame = p1.CFrame:lerp(CFrame.new(p2.Position) * CFrame.Angles(math.rad(p1.Orientation.X),math.rad(p1.Orientation.Y),math.rad(p1.Orientation.Z)),gforce)
p2.CFrame = p2.CFrame:lerp(CFrame.new(p1.Position) * CFrame.Angles(math.rad(p2.Orientation.X),math.rad(p2.Orientation.Y),math.rad(p2.Orientation.Z)),gforce)
end
--local f = ((1 * (23 * 50)) / (15 ** 2)) * .0000000000667408