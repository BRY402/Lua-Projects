-- thans
local ts = game:GetService("TweenService")
local deb = game:GetService("Debris")
local thanosg = Instance.new("Part",owner.Character)
local mesh = Instance.new("SpecialMesh",thanosg)
local snaps = Instance.new("Sound",thanosg)
owner.Character.Humanoid.MaxHealth = 100000
owner.Character.Humanoid.Health = 100000
snaps.SoundId = "rbxassetid://2930668938"
local w = Instance.new("Weld",owner.Character)
w.Part1 = owner.Character["Left Arm"]
w.Part0 = thanosg
mesh.MeshType = "FileMesh"
mesh.MeshId = "rbxassetid://3124357259"
mesh.TextureId = "rbxassetid://3134804122"
thanosg.Size = Vector3.new(1.4,2.2,1.3)
thanosg.CanCollide = false
thanosg.Locked = true
thanosg:SetNetworkOwner(owner)
thanosg.Material = "DiamondPlate"
thanosg.CustomPhysicalProperties = PhysicalProperties.new(9999,9999,0,9999,0)
w.C0 = CFrame.new(0,.75,0) * CFrame.Angles(math.rad(-15),math.rad(0),math.rad(0))
mesh.Scale = mesh.Scale / 7.5
local info = TweenInfo.new(3,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
local sinfo = TweenInfo.new(.25,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
local r = Instance.new("RemoteEvent",owner.PlayerGui)
r.Name = "ThanosS"
NLS([==[local m = owner:GetMouse() local uis = game:GetService("UserInputService") if workspace:FindFirstChild("Base") then m.TargetFilter = workspace.Base end
local canthans = true
uis.InputBegan:Connect(function(inp,cant)
if inp.KeyCode == Enum.KeyCode.F and not cant then
canthans = not canthans
if canthans then
print("Thanos snap: on")
else
print("Thanos snap: off")
end
end
end)
m.Button1Down:Connect(function()
for i, v in pairs(workspace:GetDescendants()) do
if v:IsA("Part") then
if v.Transparency >= .0000000000000000000000000000000000001 and not v.Transparency == 1 then
v.Transparency = 0
end
end
end
if canthans then
if workspace:FindFirstChild("Base") then m.TargetFilter = workspace.Base end
if m.Target then
local ta = m.Target
owner.PlayerGui.ThanosS:FireServer(ta,owner)
end
end
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(player, ta)
snaps:Play()
local gone = {Position = Vector3.new(ta.Position.X * math.random(-3,3),ta.Position.Y * 6,ta.Position.Z * math.random(-3,3))}
local go = ts:Create(ta,info,gone)
go:Play()
local gon2 = {Size = Vector3.new(0,0,0)}
local go2 = ts:Create(ta,info,gon2)
go2:Play()
local tran = {Transparency = 1}
ta.Anchored = true
ta.CanCollide = false
local dis = ts:Create(ta,info,tran)
dis:Play()
for i, v in pairs(ta:GetDescendants()) do
deb:AddItem(v,0)
end
local hum = ta.Parent:FindFirstChildOfClass("Humanoid")
if hum then
for i, p in pairs(hum.Parent:GetDescendants()) do
if p:IsA("Part") then
p.Anchored = true
p.CanCollide = false
local gone = {Position = Vector3.new(ta.Position.X * math.random(-3,3),ta.Position.Y * 6,ta.Position.Z * math.random(-3,3))}
local go = ts:Create(p,info,gone)
go:Play()
local tran = {Transparency = 1}
local dis = ts:Create(p,info,tran)
local gon2 = {Size = Vector3.new(0,0,0)}
local go2 = ts:Create(p,info,gon2)
go2:Play()
dis:Play()
elseif p:IsA("Decal") then
local tran = {Transparency = 1}
local dis = ts:Create(p,info,tran)
dis:Play()
elseif p:IsA("Sound") then
local sfad = {Volume = 0}
local go = ts:Create(p,sinfo,sfad)
go:Play()
end
end
elseif not ta.Parent:IsA("Workspace") then
for i, p in pairs(ta.Parent:GetDescendants()) do
if p:IsA("Part") then
p.Anchored = true
p.CanCollide = false
local gone = {Position = Vector3.new(ta.Position.X * math.random(-3,3),ta.Position.Y * 6,ta.Position.Z * math.random(-3,3))}
local go = ts:Create(p,info,gone)
go:Play()
local tran = {Transparency = 1}
local dis = ts:Create(p,info,tran)
local gon2 = {Size = Vector3.new(0,0,0)}
local go2 = ts:Create(p,info,gon2)
go2:Play()
dis:Play()
elseif p:IsA("Sound") then
local sfad = {Volume = 0}
local go = ts:Create(p,sinfo,sfad)
go:Play()
end
end
end
task.wait(3)
if hum then
hum:TakeDamage(hum.MaxHealth)
end
end)
while workspace:FindFirstChild("Base") do
for i, v in pairs(workspace.Base:GetDescendants()) do
if v:IsA("Part") then
v.Parent = workspace
end
end
task.wait()
end
while task.wait() do
owner.Character:FindFirstChildOfClass("Humanoid").MaxHealth = 100000
end
-- UP TO DATE.