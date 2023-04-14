local rs = game:GetService("RunService")
local model = Instance.new("Model",script)
local part = Instance.new("Part",model)
local m = Instance.new("SpecialMesh",part)
local s = Instance.new("Sound",part)
local msfx = Instance.new("Sound",part)
local moveto = false
s.SoundId = "rbxassetid://7785668424"
s.Volume = 1.5
msfx.SoundId = "rbxassetid://7556335272"
msfx.Volume = 2
msfx.Looped = true
part.Size = Vector3.new(4,10,4)
part.Anchored = true
part.CFrame = owner.Character.HumanoidRootPart.CFrame
part.Position = part.Position + Vector3.new(0,1,0)
part.CustomPhysicalProperties = PhysicalProperties.new(math.huge,math.huge,0)
part.BrickColor = BrickColor.new("Really red")
m.Scale = Vector3.new(.03,.03,.03)
m.MeshId = "rbxassetid://7176615085"
m.TextureId = "rbxassetid://7176615317"
owner.Chatted:Connect(function(msg)
if string.lower(msg) == "moveto/true" or string.lower(msg) == "/e moveto/true" then
moveto = true
elseif string.lower(msg) == "moveto/false" or string.lower(msg) == "/e moveto/false" then
moveto = false
end
end)
rs.Stepped:Connect(function()
part.Anchored = true
local high = math.huge
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
local hrp, pos, mag
if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
hrp = v.Character.HumanoidRootPart
pos = (hrp.Position - part.Position).Unit
mag = (part.Position - hrp.Position).magnitude
if mag < high then
high = mag
close = v
end
elseif v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health <= 0 then
close = nil
end
if hrp then
local look = pos:Dot(hrp.CFrame.lookVector)
if look < -.5 and mag < 50 then
partin = true
end
end
if partin == false and close then
part.CFrame = CFrame.lookAt(part.Position + part.CFrame.lookVector * 1,close.Character.HumanoidRootPart.Position)
part.Orientation = Vector3.new(0,part.Orientation.Y,part.Orientation.Z)
if moveto then
model:MoveTo(part.Position)
end
if msfx.Playing == false then
msfx:Play()
end
if high <= part.Size.X or high <= part.Size.Y or high <= part.Size.Z then
local hum = close.Character.Humanoid
hum.BreakJointsOnDeath = false
hum.Health = -100
s:Play()
end
else
msfx:Stop()
end
end
partin = false
end)