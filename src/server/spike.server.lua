local r = Instance.new("RemoteEvent",owner)
r.Name = "SE"
local ts = game:GetService("TweenService")
local d = game:GetService("Debris")
local function newtween(dotable,p,takes,style,direction,repeatamount,dorepeat,delay)
task.spawn(function()
local info = TweenInfo.new(takes,style,direction,repeatamount,dorepeat,delay)
local tween = ts:Create(p,info,dotable)
tween:Play()
if dorepeat then
task.wait(takes + delay)
else
task.wait(takes)
end
end)
end
local function openportal(hrp)
task.spawn(function()
if hrp then
if hrp:FindFirstAncestorOfClass("Model") then
hum = hrp:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid")
else
hum = hrp.Parent:FindFirstChildOfClass("Humanoid")
end
local p = Instance.new("SpawnLocation",script)
p.Size = Vector3.new(0,0,0)
newtween({Size = Vector3.new(0,2.5,2.5)},p,.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
p.Shape = "Cylinder"
local rand = {1,2,3,-1,-2,-3}
local x,z = rand[math.random(0,#rand)],rand[math.random(0,#rand)]
p.Position = hrp.Position + Vector3.new(x,0,z)
p.CFrame = CFrame.lookAt(p.Position,hrp.Position)
p.Orientation += Vector3.new(0,90,0)
p.CanCollide = false
p.Enabled = false
p.Anchored = true
p.Color = Color3.new(0,0,0)
task.wait(.5)
local spike = Instance.new("SpawnLocation",script)
local mesh = Instance.new("SpecialMesh",spike)
spike.Size = Vector3.new(1,1,1)
mesh.Scale = Vector3.new(.02,0,.02)
spike.Position = p.Position + p.CFrame.rightVector * 0
newtween({Scale = Vector3.new(.02,.15,.02)},mesh,.1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
mesh.MeshId = "rbxassetid://2591997453"
newtween({Position = p.Position + p.CFrame.rightVector * 3.75},spike,.1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
spike.Orientation = p.Orientation - Vector3.new(90,90,0)
spike.CanCollide = false
spike.Enabled = false
spike.Anchored = true
spike.BrickColor = BrickColor.new("Maroon")
task.wait(.1)
if (hrp.Position - spike.Position).magnitude <= 5 then
if hum then
hum.BreakJointsOnDeath = false
task.spawn(function()
while (hrp.Position - spike.Position).magnitude <= 5 and spike.Parent == script do
if hum then
hum.Health = -math.huge
end
task.wait()
end
end)
local s,f = pcall(function()
local sfx = Instance.new("Sound",spike)
sfx.SoundId = "rbxassetid://7441143433"
sfx.Volume = 1.5
sfx:Play()
end)
if f then
warn("Sound limit reached")
end
end
end
d:AddItem(p,1)
d:AddItem(spike,1)
end
end)
end
print("Attack: F over a target to attack.")
NLS([==[local r = owner.SE
local uis = game:GetService("UserInputService")
local m = owner:GetMouse()
uis.InputBegan:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.F and not c then
if m.Target ~= nil then
r:FireServer(m.Target,owner)
end
end
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(plr,target)
openportal(target)
end)