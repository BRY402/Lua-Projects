-- bhb
local d = game:GetService("Debris")
local ts = game:GetService("TweenService")
local wm = Instance.new("WorldModel",script)
local info = TweenInfo.new(3,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local cg = {Size = Vector3.new(20,20,20)}
local cs = {Size = Vector3.new(0,0,0)}
local t = Instance.new("Tool",owner.Backpack)
local s = Instance.new("Sound",t)
s.Volume = 2
s.SoundId = "rbxassetid://711753382"
local h = Instance.new("Part",t)
h.Shape = "Ball"
h.Name = "Handle"
t.Name = "BH bomb"
h.CanCollide = true
local w2 = Instance.new("Weld",h)
local d2 = Instance.new("Part",h)
d2.Shape = "Cylinder"
h.Size = Vector3.new(1,1,1)
h.Material = "DiamondPlate"
h.BrickColor = BrickColor.new("Dark stone grey")
d2.Material = "Neon"
d2.BrickColor = BrickColor.new("Toothpaste")
d2.Size = Vector3.new(.25,1.0001,1.0001)
d2.CanCollide = false
w2.Part0 = h
w2.Part1 = d2
w2.C0 = CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
t.Activated:Connect(function()
if h.Transparency == 0 then
local bh = Instance.new("Part",wm)
bh.CanCollide = false
bh.Anchored = true
bh.Color = Color3.new(0,0,0)
bh.Shape = "Ball"
bh.Size = Vector3.new(0,0,0)
bh.Material = "Neon"
bh.CastShadow = false
bh.CanTouch = false
bh.Name = "BlackHoleG"
w2.C0 = CFrame.new(0,0,-2) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
local h2 = h:Clone()
h2.CanCollide = true
s.Parent = h2
s.SoundId = "rbxassetid://711753382"
s:Play()
w2.C0 = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
h.Transparency = 1
for i, v in pairs(h:GetDescendants()) do
if v:IsA("Part") then
v.Transparency = 1
end
end
h2.Parent = script
h2:SetNetworkOwner(owner)
h2.Position = h.Position + h.CFrame.LookVector * 2
h2.Velocity = Vector3.new(0,35,0) + h.CFrame.LookVector * 35
local g = ts:Create(bh,info,cg)
local g2 = ts:Create(bh,info,cs)
h2.Touched:Connect(function()
h2.CanTouch = false
task.wait(.5)
s.Parent = bh
s.Volume = 10
s.SoundId = "rbxassetid://179294699"
s:Play()
bh.Position = h2.Position
d:AddItem(h2,0)
g:Play()
local tb = {}
table.insert(tb,bh)
task.spawn(function()
while bh:FindFirstAncestorOfClass("Workspace") do
for i, v in pairs(workspace:GetDescendants()) do
if v:IsA("Part") then
if not v.Anchored and (v.Position - bh.Position).magnitude <= 25 then
local s, f = pcall(function()
local vel = Instance.new("BodyPosition",v)
vel.P = 375000
vel.Position = bh.Position
d:AddItem(vel,8)
end)
end
end
end
for i, v in pairs(workspace:GetPartsInPart(bh)) do
if v == h2 or v.Name == "BlackHoleG" or v.Name == "Base" or not v.Parent == workspace then
else
local s, f = pcall(function()
p = v:SubtractAsync(tb,PreciseConvexDecomposition)
end)
if p then
p.Parent = v.Parent
p.Name = v.Name
d:AddItem(v,0)
end
if f then
d:AddItem(v,0)
end
end
end
task.wait()
end
end)
task.wait(5)
g2:Play()
task.wait(2.5)
s:Stop()
task.wait(.5)
s.Volume = 2
s.SoundId = "rbxassetid://5801257793"
s:Play()
bh:Explode()
task.wait(1.5)
s:Stop()
s.Parent = t
d:AddItem(bh,0)
table.clear(tb)
end)
task.wait(3)
h.Transparency = 0
for i, v in pairs(h:GetDescendants()) do
if v:IsA("Part") then
v.Transparency = 0
end
end
end
end)
-- UP TO DATE.