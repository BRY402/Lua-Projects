-- god
local d = game:GetService("Debris")
local hum = owner.Character:FindFirstChildOfClass("Humanoid")
if hum then
hum.RequiresNeck = false
end
hum.HealthChanged:Connect(function()
hum.Health = math.clamp(hum.Health,99,hum.MaxHealth)
end)
owner.CharacterAdded:Connect(function()
task.wait()
local hum = owner.Character:FindFirstChildOfClass("Humanoid")
if hum then
hum.RequiresNeck = false
end
hum.HealthChanged:Connect(function()
hum.Health = math.clamp(hum.Health,99,hum.MaxHealth)
end)
end)
NLS([==[script.Parent = workspace
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
end
script.DescendantRemoving:Connect(function(des)
if des == char then
char.Archivable = true
char = char:Clone()
char.Parent = script
end
end)
owner.CharacterRemoving:Connect(function()
local hrp = owner.Character:FindFirstChild("HumanoidRootPart")
if hrp then
pos = hrp.CFrame
end
end)
owner.CharacterAdded:Connect(function()
task.wait()
local hrp = owner.Character:FindFirstChild("HumanoidRootPart")
if hrp and pos then
hrp.CFrame = pos
end
end)
buildcharacter()
owner:GetPropertyChangedSignal("Character"):Connect(function()
task.wait()
local c = owner.Character
if c ~= nil and c ~= char then
buildcharacter()
end
end)]==],owner.PlayerGui)
game:GetService("RunService").Stepped:Connect(function()
pcall(function()
local hum = owner.Character:FindFirstChildOfClass("Humanoid")
if hum then
hum.Health = hum.MaxHealth
hum:BuildRigFromAttachments()
local char = owner.Character
if char ~= nil then
char:MakeJoints()
hum.HipHeight = 0
end
end
end)
end)
-- UP TO DATE.