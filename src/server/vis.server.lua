-- vis
-- Variables --
local r = 1
local res = 4.5
local size = 4/3
local delay = 3
local rbr = 3
local sens = 450 -- Sensitivity for visualiser size
local t = game:GetService("TweenService")
local rs = game:GetService("RunService")
local world = Instance.new("WorldModel",script)
local vis = Instance.new("SpawnLocation",world)
--local mesh = Instance.new("SpecialMesh",vis)
local sound = Instance.new("Sound",vis)
local rem = Instance.new("RemoteEvent",owner)
local info = TweenInfo.new(.1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
songs = {HoP = 1837297801, tacos = 142376088,balls = 8206785908, what = 6828176320}
-- Properties --
rem.Name = "GPBLFV"
sound.Name = ""
script.Name = "vis"
world.Name = "World"
vis.Name = "Visual"
vis.Size = Vector3.new(size,size,size)
--[[mesh.MeshType = "FileMesh"
mesh.MeshId = "rbxassetid://5747973019"
]]
vis.Anchored = true
vis.CFrame = owner.Character.HumanoidRootPart.CFrame
vis.CanCollide = false
vis.Enabled = false
vis.Material = "Neon"
sound.Volume = 1.25
sound.Looped = true
sound.RollOffMaxDistance = 60
sound.SoundId = "rbxassetid://142376088"
-- Script --
sound:Play()
NLS([==[
-- Variables --
local platform = Instance.new("Part",script)
local r = owner.GPBLFV
local rs = game:GetService("RunService")
local delay = 3
local rbr = 3
local sens = 450 -- Sensitivity for visualiser size
local size = 4/3
local ps = 7.5
-- Properties
script.Parent = workspace
platform.Shape = "Cylinder"
platform.Material = "Neon"
platform.Anchored = true
platform.Reflectance = 1
platform.Size = Vector3.new(0,0,0)
platform.BrickColor = BrickColor.new("Forest green")
platform.Position = owner.Character.HumanoidRootPart.Position
-- Script --
rs.RenderStepped:Connect(function(d)
local s = workspace.vis.World.Visual:FindFirstChildOfClass("Sound")
local vis = s.Parent
local hue = tick() % rbr / delay -- Returns division leftovers of resolution / delay
platform.Color = Color3.fromHSV(hue,1,1)
r:FireServer(s.PlaybackLoudness,owner)
local result = size * (s.PlaybackLoudness / (sens / s.Volume))
platform.Size = Vector3.new(0,ps + result,ps + result)
if owner.Character:FindFirstChild("HumanoidRootPart") then
vis.Position = owner.Character.HumanoidRootPart.Position + Vector3.new(0,3 + vis.Size.Y / 2,0) + owner.Character.HumanoidRootPart.CFrame.lookVector * (-5 + -vis.Size.Z)
platform.Position = Vector3.new(owner.Character.HumanoidRootPart.Position.X,0,owner.Character.HumanoidRootPart.Position.Z)
platform.Orientation = Vector3.new(0,0,90)
end
end)]==],owner.PlayerGui)
rem.OnServerEvent:Connect(function(player,pbl)
local result = size * (pbl / (sens / sound.Volume))
--local wtdo = {Scale = Vector3.new(result,result,result)}
local wtdo = {Size = Vector3.new(result,result,result)}
local ndtt = t:Create(vis,info,wtdo)
ndtt:Play()
end)
print("Songs: ")
for i, v in pairs(songs) do
print("songs."..i.." ("..v..")")
end
rs.Stepped:Connect(function(delta)
if world:FindFirstChild("Visual") == vis then
if not vis:FindFirstChildOfClass("Sound") then
sound = sound:Clone()
sound.Parent = vis
sound.RollOffMaxDistance = 60
sound:Play()
end
else
vis = vis:Clone()
vis.Parent = world
if not vis:FindFirstChildOfClass("Sound") then
sound = sound:Clone()
sound.Parent = vis
sound.RollOffMaxDistance = 60
sound:Play()
end
end
local hue = tick() % rbr / delay -- Returns division leftovers of resolution / delay
local vol = size * math.pi * r / res -- Gets the size of the sphere you want * math.pi (sphere) * radius / resolution
r += 1
vis.Orientation = Vector3.new(vol,vol,vol)
vis.Color = Color3.fromHSV(hue,1,1)
if owner.Character:FindFirstChild("HumanoidRootPart") then
vis.Position = owner.Character.HumanoidRootPart.Position + Vector3.new(0,3 + vis.Size.Y / 2,0) + owner.Character.HumanoidRootPart.CFrame.lookVector * (-5 + -vis.Size.Z)
end
end)
owner.Chatted:Connect(function(msg)
if string.sub(msg,0,#"-id ") == "-id " then
sound.SoundId = "rbxassetid://"..string.sub(msg,#"-id  ",#msg)
sound:Play()
elseif string.sub(msg,0,#"/e -id ") == "/e -id " then
sound.SoundId = "rbxassetid://"..string.sub(msg,#"/e -id  ",#msg)
sound:Play()
elseif string.sub(msg,0,#"-pitch ") == "-pitch " then
sound.Pitch = string.sub(msg,#"-pitch  ",#msg)
elseif string.sub(msg,0,#"/e -pitch ") == "/e -pitch " then
sound.Pitch = string.sub(msg,#"/e -pitch  ",#msg)
elseif string.sub(msg,0,#"-volume ") == "-volume " then
sound.Volume = string.sub(msg,#"-volume  ",#msg)
elseif string.sub(msg,0,#"/e -volume ") == "/e -volume " then
sound.Volume = string.sub(msg,#"/e -volume  ",#msg)
end
end)
