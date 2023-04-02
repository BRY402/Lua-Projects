-- orbit
-- Variables --
local r = 0
local res = 2.5
local size = 1.5
local speed = 1
local world = Instance.new("WorldModel",script)
local p = Instance.new("Part",world)
--local g = 1
-- Properties --
p.Anchored = true
p.CanCollide = false
p.Size = Vector3.new(size,size,size)
p.Shape = "Ball"
p.Material = "SmoothPlastic"
-- Script --
while game:GetService("RunService").Stepped:Wait() do
--	gravnum = (p.Position - owner.Character.HumanoidRootPart.Position).magnitude
--	gforce = g * (p.Mass / owner.Character.HumanoidRootPart.Mass) / (gravnum ^ 2)
--	p.CFrame = p.CFrame:lerp(owner.Character.HumanoidRootPart.CFrame,gforce)
--	owner.Character.HumanoidRootPart.CFrame = owner.Character.HumanoidRootPart.CFrame:lerp(p.CFrame,gforce)
	local size = p.Size.X
	local gspeed = math.pi / size
	local far = 5 * size
	x = math.sin(math.rad(r))
	y = math.sin(math.rad(r))
	z = math.cos(math.rad(r))
	p.Position = owner.Character.HumanoidRootPart.Position + (Vector3.new(x,0,z) * far)
	p.Orientation = Vector3.new(0,r * gspeed,0)
	r += 1 * speed
end