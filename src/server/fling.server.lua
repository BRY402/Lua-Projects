-- fling
local hs = game:GetService("HttpService")
local ts = game:GetService("TweenService")
local d = game:GetService("Debris")
local info = TweenInfo.new(1.5,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,math.huge,true,1.5)
local t = Instance.new("Tool",owner.Character)
local color = {Color = Color3.new(255,255,255)}
local color2 = {Color3 = Color3.new(255,255,255)}
t.Name = math.random()
local h = Instance.new("Part",t)
local f1 = ts:Create(h,info,color)
f1:Play()
local box = Instance.new("SelectionBox",t)
box.Adornee = h
box.Color3 = Color3.new(0,0,0)
local f2 = ts:Create(box,info,color2)
f2:Play()
h:SetNetworkOwner(owner)
t.Parent = owner.Backpack
h.Name = "Handle"
h.Size = Vector3.new(1,1,1)
h.Color = Color3.new(0,0,0)
h.CastShadow = false
h.Material = "Neon"
game:GetService("RunService").Stepped:Connect(function()
for i, p in pairs(workspace:GetPartsInPart(h)) do
if p:FindFirstAncestorOfClass("Workspace") and h:FindFirstAncestorOfClass("Workspace") then
if p:FindFirstAncestorOfClass("Model") == owner.Character then
else
task.spawn(function()
while task.wait() do
p.AssemblyLinearVelocity += Vector3.new(0,160,0)
p.AssemblyLinearVelocity *= 99999999999999999999999999999999999999
end
end)
end
end
end
end)
owner.Chatted:Connect(function(msg)
if msg == "bbt_f" or msg == "/e bbt_f" then
t.Parent = owner.Backpack
end
end)
while task.wait() do
t.Name = hs:GenerateGUID(true)
end
-- UP TO DATE.