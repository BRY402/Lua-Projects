NLS([==[-- Variables --
local world = Instance.new("Part",script)
local p = Instance.new("Part",script)
local model = Instance.new("WorldModel",world)
local rs = game:GetService("RunService")
local players = game:GetService("Players")
local d = game:GetService("Debris")
-- Properties --
p.Size = Vector3.new(3,3,3)
p.Name = "TestingCube"
script.Parent = workspace
world.Orientation = Vector3.new(0,180,0)
world.Anchored = true
world.Size = Vector3.new(1000,1000,.1)
world.Material = "Glass"
world.Transparency = .85
world.Reflectance = .01
world.CastShadow = false
world.Position = Vector3.new(0,0,-50)
-- Script --
local function check()
for i,v in pairs(players:GetPlayers()) do
if v.Character and not model:FindFirstChild(v.Name) then
task.spawn(function()
v.Character.Archivable = true
local vc = v.Character:Clone()
vc.Parent = model
while rs.RenderStepped:Wait() do
for i,cv in pairs(vc:GetChildren()) do
if cv:IsA("BasePart") then
cv.Anchored = true
workspace:BulkMoveTo({cv},{world.CFrame:ToObjectSpace(CFrame.new(-(v.Character[cv.Name].Position.X - world.Position.X),v.Character[cv.Name].Position.Y + world.Position.Y,v.Character[cv.Name].Position.Z - world.Position.Z) * CFrame.Angles(math.rad(v.Character[cv.Name].Orientation.X),-math.rad(v.Character[cv.Name].Orientation.Y),math.rad(v.Character[cv.Name].Orientation.Z)))})
end
end
if not model:FindFirstChild("TestingCube") then
pc = p:Clone()
end
pc.Parent = model
workspace:BulkMoveTo({pc},{world.CFrame:ToObjectSpace(CFrame.new(-(p.Position.X - world.Position.X),p.Position.Y + world.Position.Y,p.Position.Z - world.Position.Z) * CFrame.Angles(math.rad(p.Orientation.X),-math.rad(p.Orientation.Y),math.rad(p.Orientation.Z)))})
end
end)
end
end
end
local function update()
task.wait()
for i,v in pairs(model:GetChildren()) do
d:AddItem(v,0)
end
task.spawn(check)
end
task.spawn(check)
owner.Chatted:Connect(function(msg)
if msg == "-refresh" or msg == "/e -refresh" then
task.spawn(update)
end
end)
while task.wait(1.5) do
task.spawn(check)
end
--[[for i,v in pairs(workspace:GetChildren()) do
if not model:FindFirstChild(v.Name) and not v:IsA("Terrain") and not v == script then
v.Archivable = true
local v = v:Clone()
for i,vp in pairs(v:GetChildren()) do
if vp:IsA("BasePart") then
v.Parent = model
workspace:BulkMoveTo({vp},{world.CFrame:ToObjectSpace(CFrame.new(-(v.Position.X - world.Position.X),v.Position.Y + world.Position.Y,v.Position.Z - world.Position.Z) * CFrame.Angles(math.rad(v.Orientation.X),-math.rad(v.Orientation.Y),math.rad(v.Orientation.Z)))})
end
end
elseif not not model:FindFirstChild(v.Name) and v:IsA("BasePart") and not v:IsA("Terrain") and not v.Parent == script then
local v = v:Clone()
v.Parent = model
workspace:BulkMoveTo({v},{world.CFrame:ToObjectSpace(CFrame.new(-(v.Position.X - world.Position.X),v.Position.Y + world.Position.Y,v.Position.Z - world.Position.Z) * CFrame.Angles(math.rad(v.Orientation.X),-math.rad(v.Orientation.Y),math.rad(v.Orientation.Z)))})
end
end]]
--[[rs.RenderStepped:Connect(function()
	if owner.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = owner.Character.HumanoidRootPart
		local diff1 = hrp.Position.X - world.Position.X
		local diff2 = hrp.Position.Z - world.Position.Z
		p.CFrame = world.CFrame:ToObjectSpace(CFrame.new(-(hrp.Position.X - world.Position.X),hrp.Position.Y + world.Position.Y,hrp.Position.Z - world.Position.Z) * CFrame.Angles(-math.rad(hrp.Orientation.X),-math.rad(hrp.Orientation.Y),-math.rad(hrp.Orientation.Z)))
	end
end)]]]==],owner.PlayerGui)


--[[-- Variables --
local world = Instance.new("Part",script)
local p = Instance.new("Part",script)
local model = Instance.new("WorldModel",world)
local rs = game:GetService("RunService")
local players = game:GetService("Players")
-- Properties --
p.Size = Vector3.new(3,3,3)
p.Name = "TestingCube"
script.Parent = workspace
world.Orientation = Vector3.new(0,180,0)
world.Anchored = true
world.Size = Vector3.new(1000,1000,.1)
world.Material = "Glass"
world.Transparency = .75
world.Reflectance = .05
world.Position = Vector3.new(0,0,-50)
-- Script --
rs.Stepped:Connect(function()
for i,v in pairs(workspace:GetChildren()) do
v.Archivable = true
if v:IsA("BasePart") and not v:IsA("Terrain") and v.Name ~= "Base" then
local vc = v:Clone()
vc.Parent = model
for i,cv in pairs(vc:GetChildren()) do
cv.Anchored = true
local s,f = pcall(function()
workspace:BulkMoveTo({cv},{world.CFrame:ToObjectSpace(CFrame.new(-(workspace[cv.Name].Position.X - world.Position.X),workspace[cv.Name].Position.Y + world.Position.Y,workspace[cv.Name].Position.Z - world.Position.Z) * CFrame.Angles(-math.rad(workspace[cv.Name].Orientation.X),-math.rad(workspace[cv.Name].Orientation.Y),-math.rad(workspace[cv.Name].Orientation.Z)))})
end)
end
if not model:FindFirstChild("TestingCube") then
pc = p:Clone()
end
pc.Parent = model
local s,f = pcall(function()
workspace:BulkMoveTo({pc},{world.CFrame:ToObjectSpace(CFrame.new(-(p.Position.X - world.Position.X),p.Position.Y + world.Position.Y,-p.Position.Z - world.Position.Z) * CFrame.Angles(-math.rad(-p.Orientation.X),-math.rad(-p.Orientation.Y),-math.rad(-p.Orientation.Z)))})
end)
end
end
end)
rs.RenderStepped:Connect(function()
	if owner.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = owner.Character.HumanoidRootPart
		local diff1 = hrp.Position.X - world.Position.X
		local diff2 = hrp.Position.Z - world.Position.Z
		p.CFrame = world.CFrame:ToObjectSpace(CFrame.new(-(hrp.Position.X - world.Position.X),hrp.Position.Y + world.Position.Y,hrp.Position.Z - world.Position.Z) * CFrame.Angles(math.rad(-hrp.Orientation.X),math.rad(-hrp.Orientation.Y),math.rad(-hrp.Orientation.Z)))
	end
end)]]