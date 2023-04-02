game:GetService("RunService").Stepped:Connect(function()
local s,f = pcall(function()
for i,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("BasePart") and v.Anchored == false then
v:SetNetworkOwner(owner)
end
end
end)
end)
NLS([==[local speed = .1
local function tct(str,l)
  if l == true then
  str = string.lower(str)
  end
  if string.lower(string.sub(str,0,3)) == "/e " then
  return string.sub(str,4,#str),true
  else
  return str,false
  end
  end
owner.Chatted:Connect(function(msg)
local msg = tct(msg,true)
if string.sub(msg,0,#"-ws ") == "-ws " then
speed = string.sub(msg,#"-ws " + 1,#msg) / 160
end
end)
script.Parent = workspace
local d = game:GetService("Debris")
local char = Instance.new("Model",script)
local function buildcharacter()
char:ClearAllChildren()
local anim = owner.Character:FindFirstChild("Animate")
if anim then
anim.Archivable = true
d:AddItem(anim,0)
anim = anim:Clone()
end
for i,v in pairs(owner.Character:GetChildren()) do
if v:IsA("Humanoid") then
v.Parent = char
v:SetStateEnabled("Dead",false)
v.BreakJointsOnDeath = false
v.Parent = char
elseif v:IsA("BasePart") then
v.Parent = char
if v.Name == "Head" then
v.Name = "head"
v.CanCollide = false
elseif v.Name == "LowerTorso" then
v.CanCollide = false
elseif v.Name == "HumanoidRootPart" then
v.CanCollide = false
end
elseif v.Name ~= "Animate" then
v.Archivable = true
d:AddItem(v,0)
local v = v:Clone()
v.Parent = char
end
end
owner.Character = nil
owner.Character = char
if anim then
anim.Parent = char
end
local hrp = owner.Character:FindFirstChild("HumanoidRootPart")
local nc = Instance.new("NoCollisionConstraint",hrp)
if hrp then
nc.Part0 = hrp
end
nc.Part1 = owner.Character:FindFirstChild("Torso")
end
buildcharacter()
game:GetService("RunService").Heartbeat:Connect(function()
local hrp = char:FindFirstChild("HumanoidRootPart")
local tor = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
if hrp and tor then
local rj = hrp:FindFirstChild("RootJoint")
if rj then
hrp.CFrame = CFrame.new(hrp.Position + Vector3.new(0,5,0))
d:AddItem(rj,0)
end
workspace:BulkMoveTo({tor},{hrp.CFrame})
end
end)
game:GetService("RunService").RenderStepped:Connect(function(d)
if owner.Character and owner.Character:FindFirstChild("HumanoidRootPart") and owner.Character:FindFirstChildOfClass("Humanoid") then
owner.Character.PrimaryPart = owner.Character.HumanoidRootPart
if owner.Character.Humanoid.SeatPart == nil then
local move = Vector3.new(owner.Character.Humanoid.MoveDirection.X + owner.Character.HumanoidRootPart.Velocity.X,0,owner.Character.Humanoid.MoveDirection.Z + owner.Character.HumanoidRootPart.Velocity.Z)
local cf = CFrame.new(owner.Character.HumanoidRootPart.Position + (move + move * d) * speed) * owner.Character.HumanoidRootPart.CFrame.Rotation
owner.Character:PivotTo(cf)
elseif owner.Character.Humanoid.SeatPart.Anchored == false and owner.Character.Humanoid.SeatPart:GetNetworkOwner() == owner then
local move = owner.Character.Humanoid.MoveDirection
local cf = CFrame.new(owner.Character.HumanoidRootPart.Position + (move + move * d) * speed) * owner.Character.HumanoidRootPart.CFrame.Rotation
owner.Character:PivotTo(cf)
end
end
end)
owner:GetPropertyChangedSignal("Character"):Connect(function()
task.wait()
local c = owner.Character
if c ~= nil and c ~= char then
buildcharacter()
end
end)]==],owner.PlayerGui)