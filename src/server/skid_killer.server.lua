-- skid_killer
local ts = game:GetService("TweenService")
decayinfo = TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
decayt = { Color = Color3.fromHSV(0,0,0) }
local success, errormessage = pcall(function()
local folder = Instance.new("Folder",owner.Character) folder.Name = "SetupFolder"
folder = owner.Character:WaitForChild("SetupFolder")
end)
if errormessage then
error("Error while loading SK")
end
if success then
local mode = Instance.new("NumberValue",folder)
local gui = Instance.new("ScreenGui",owner.PlayerGui)
local modetext = Instance.new("TextLabel",gui)
modetext.Position = UDim2.new(.2,0,.65,0)
modetext.Size = UDim2.new(.05,0,.1,0)
modetext.BackgroundTransparency = 0
mode.Name = "toolMode"
mode.Value = 1
modetext.Text = "Mode: "..mode.Value
local r = Instance.new("RemoteEvent",folder)
local rt = Instance.new("RemoteEvent",folder)
rt.Name = "modeSwitch"
local mesh = Instance.new("SpecialMesh",folder)
mesh.Scale = Vector3.new(0,0,0)
mesh.MeshType = "Brick"
local blacklist = {base = workspace:FindFirstChild("Base"),char = owner.Character}
local t = Instance.new("Tool",owner.Backpack)
eq = false
local h = Instance.new("Part")
local sound = Instance.new("Sound",h) 
local secretroll = Instance.new("Sound",h)
secretroll:Stop()
secretroll.SoundId = "rbxassetid://6784305960"
sound.PlaybackSpeed = .75
secretroll.Volume = 1
sound:Stop() 
sound.SoundId = "rbxassetid://5240058145" 
sound.Looped = true 
sound.Volume = 1 
local color = h.BrickColor 
h.Name = "Handle" 
h.Parent = t 
t.Name = "Destroy" 
h.Size = Vector3.new(1,1,1) 
h.Touched:Connect(function(part)
local success, errormessage = pcall(function() if part.Parent.Name == owner.Character.Name or 
part.Name == "Base" or part.Parent.Parent.Name == owner.Character.Name or part.Name == "BRY402's skid_killer Zone" or part.Name == "HumanoidRootPart" then
else
game:GetService("Debris"):AddItem(part,0)
local success, errormessage = pcall(function()
enemyhum = part.Parent:FindFirstChild("Humanoid")
 enemyhum:TakeDamage(math.huge)
end)
warn('Attempt to index nil with "'..part.Name..'" (Unknown Instance).')
if success then
rickrollchance = math.random(1,1000)
if rickrollchance == 1 then
secretroll.Parent = part.Parent.HumanoidRootPart
secretroll:Play()
wait(2)
secretroll.Parent = h
else
deathsound.Parent = part.Parent.HumanoidRootPart
deathsound:Play()
wait(3)
deathsound.Parent = h
end
end
end 
end)
end)
t.Equipped:Connect(function()
t.Parent = owner.Character
eq = true 
sound:Play()
for i, c in pairs(owner.Character:GetChildren()) do
if c:IsA("CharacterMesh") then
c.Parent = folder
end
end
while eq do
mesh.Parent = owner.Character["Left Arm"]
t.Name = "NIL" wait(.01)
h.BrickColor = BrickColor.Random()
 wait(.01)
mesh.Parent = owner.Character["Left Leg"]
 h.BrickColor = BrickColor.Random()
 wait(.01)
 h.Size = Vector3.new(math.random(1,3),math.random(1,3),math.random(1,3))
 wait(.01)
mesh.Parent = owner.Character.Torso
 t.Name = "CORRUPT?" 
h.BrickColor = BrickColor.Random()
 wait(.01) 
h.BrickColor = BrickColor.Random() 
mesh.Parent = owner.Character["Right Arm"]
wait(.01)
 t.Name = "UNKNOWN" 
wait(.01) 
mesh.Parent = owner.Character.Head
h.Size = Vector3.new(math.random(1,3),math.random(1,3),math.random(1,3)) 
wait(.01) 
h.BrickColor = BrickColor.Random() 
wait(.01) 
mesh.Parent = owner.Character["Right Leg"]
h.BrickColor = BrickColor.Random() 
wait(.01) 
mesh.Parent = folder
t.Name = "SKID_KILLER" 
h.Size = Vector3.new(1,1,1) 
h.BrickColor = color 
end
end) 
t.Unequipped:Connect(function()
t.Parent = owner.Backpack
eq = false
sound:Stop()
for i, m in pairs(folder:GetChildren()) do
if m:IsA("CharacterMesh") then
m.Parent = owner.Character
end
end
end)
dt = {}
owner.Chatted:Connect(function(msg)
if msg == "nope" or msg == "/e nope" then
if t.Parent.Name == workspace.Name or t.Parent.Parent.Name == owner.Name or t.Parent.Name == owner.Character.Name then
else
for i, a in pairs(t.Parent:GetChildren()) do
if a.Parent:FindFirstChildOfClass("Humanoid") then
c = a.Parent:FindFirstChildOfClass("Humanoid")
c:TakeDamage(1.5)
end
if a:IsA("Part") or a.Name == "Head" then
table.insert(dt,a)
end
end
b = math.random(1,#dt)
local decay = ts:Create(b,decayinfo,decayt)
decay:Play()
wait(1)
b:Destroy()
t.Parent = owner.Backpack
end
end
end)
t.Activated:Connect(function()
if mode.Value == 1 then
activated = true
local areainfo = TweenInfo.new(.5,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
local areafade = TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0)
local affectedarea = 25
local area = Instance.new("Part",workspace)
area.Anchored = true
area.Name = "BRY402's skid_killer Zone"
area.Shape = "Ball"
area.Material = "SmoothPlastic"
area.CanCollide = false
area.Color = Color3.fromHSV(0,1,1)
local at = { Size = Vector3.new(affectedarea,affectedarea,affectedarea) }
local fade = { Transparency = 1 }
area.Position = owner.Character.HumanoidRootPart.Position
for i, v in pairs(workspace:GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("Humanoid") then
if not v.Name == owner.Character.Name then
else
for i, p in pairs(v:GetChildren()) do
if p:IsA("Part") then
p.CanTouch = true
end
end
end
end
end
local tsresize = ts:Create(area,areainfo,at)
tsresize:Play()
local tsfade = ts:Create(area,areafade,fade)
tsfade:Play()
game:GetService("Debris"):AddItem(area,1.1)
area.Touched:Connect(function(part)
local success, errormessage = pcall(function() if part.Parent.Name == owner.Character.Name or 
part.Name == "Base" or part.Parent.Parent.Name == owner.Character.Name then
else
if part:IsA("Part") then
game:GetService("Debris"):AddItem(part,0)
end
end
end)
end)
end
end)
NLS([==[t = { qpressed = false, epressed = false } local toolMode = owner.Character.SetupFolder.toolMode local uis = game:GetService("UserInputService") uis.InputBegan:Connect(function(input) if input.KeyCode == Enum.KeyCode.Q then t.qpressed = true owner.Character.SetupFolder.modeSwitch:FireServer(player,t) end if input.KeyCode == Enum.KeyCode.E then t.epressed = true owner.Character.SetupFolder.modeSwitch:FireServer(player,t) end end) local mouse = owner:GetMouse() mouse.Button1Down:Connect(function() if owner.Character.SetupFolder.toolMode.Value == 2 then if mouse.Target and not mouse.Target == workspace.Base then local target = mouse.Target owner.Character.SetupFolder.RemoteEvent:FireServer(player,target) end end end)]==],owner.Character.SetupFolder)
r.OnServerEvent:Connect(function(player,target)
if target then
local exp = Instance.new("Explosion",workspace)
exp.Parent = target
exp.Position = target.Position
if target.Parent.Parent == workspace then
target.Parent:Destroy()
else
target:Destroy()
end
end
end)
rt.OnServerEvent:Connect(function(player,t)
if t.qpressed then
mode.Value = mode.Value - 1
if mode.Value < 1 then
mode.Value = 1
end
end
if t.epressed then
mode.Value = mode.Value + 1
if mode.Value > 4 then
mode.Value = 4
end
end
end)
while wait(5) do
for i, c in pairs(workspace:GetChildren()) do
if c.Name == "BRY402's skid_killer Zone" then
game:GetService("Debris"):AddItem(c,0)
end
end
end
end
-- FIX!