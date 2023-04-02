-- bh
local d = game:GetService("Debris")
local ts = game:GetService("TweenService")
local info = TweenInfo.new(3,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local cg = {Size = Vector3.new(20,20,20)}
local cs = {Size = Vector3.new(0,0,0)}
local r = Instance.new("RemoteEvent",owner.PlayerGui)
NLS([==[act = true local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(inp,cant)
if inp.KeyCode == Enum.KeyCode.F and not cant then
act = not act
if act then
print("On")
else
print("Off")
end
end
end)
local r = script.Parent.RemoteEvent
local m = owner:GetMouse()
m.Button1Down:Connect(function()
if act then
r:FireServer(m.Hit,owner)
end
end)]==],owner.PlayerGui)
local s = Instance.new("Sound",t)
s.Volume = 2
s.SoundId = "rbxassetid://711753382"
r.OnServerEvent:Connect(function(player,hit)
local bh = Instance.new("Part",script)
bh.CanCollide = false
bh.Anchored = true
bh.Color = Color3.new(0,0,0)
bh.Shape = "Ball"
bh.Size = Vector3.new(0,0,0)
bh.Material = "Neon"
bh.CastShadow = false
bh.Name = "BlackHoleG"
bh.Position = hit.Position
local g = ts:Create(bh,info,cg)
local g2 = ts:Create(bh,info,cs)
task.wait(.5)
s.Parent = bh
s.Volume = 10
s.SoundId = "rbxassetid://179294699"
s:Play()
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
s.Parent = script
d:AddItem(bh,0)
table.clear(tb)
end)
-- UP TO DATE.