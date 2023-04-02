-- gone
local debug = false
owner.Chatted:Connect(function(msg)
if msg == "/e debug/true" then
debug = true
elseif msg == "/e debug/false" then
debug = false
end
end)
local gonee = Instance.new("RemoteEvent",owner.PlayerGui)
NLS([[local uis = game:GetService("UserInputService")
local invis = false
local invist = {}
uis.InputBegan:Connect(function(input,re)
if input.KeyCode == Enum.KeyCode.F and not re then
invis = not invis
local pos = owner.Character.PrimaryPart.CFrame
owner.PlayerGui.RemoteEvent:FireServer(pos,owner)
if invis then
for i,v in pairs(workspace:GetDescendants()) do
if owner.Parent:GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model")) == nil and v:IsA("BasePart") then
local contents = {Transparency = v.Transparency, CFrame = v.CFrame,part = v,Anchored = v.Anchored,CanCollide = v.CanCollide}
table.insert(invist,contents)
end
end
for i,v in pairs(invist) do
local cf = CFrame.new(math.random(content.CFrame.X + 10,content.CFrame.X - 10),math.random(content.CFrame.Y + 10,content.CFrame.Y - 10),math.random(content.CFrame.Z + 10,content.CFrame.Z - 10)) * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
for i = content.Transparency,1,.5 do
content.part.Transparency = i
end
for i = 0,1,.5 do
content.part.CFrame = content.part.CFrame:Lerp(cf,i)
end
content.part.CanCollide = false
content.part.Anchored = True
end
else
for i,content in pairs(invist) do
for i = 1,content.Transparency,-.5 do
content.part.Transparency = i
end
for i = 0,1,.5 do
content.part.CFrame = content.part.CFrame:Lerp(content.CFrame,i)
end
content.part.CanCollide = CanCollide
content.part.Anchored = content.Anchored
end
table.clear(invist)
end
end
end)
while task.wait() do
owner.Character.Parent = workspace
end]],owner.PlayerGui)
gonee.OnServerEvent:Connect(function(player,pos)
owner.Character:SetPrimaryPartCFrame(pos)
if owner.Character.Parent == owner then
owner.Character.Parent = workspace
if debug then print(owner.Character.Parent) end
for i, a in pairs(owner.Character:GetDescendants()) do
if a:IsA("Part") or a:IsA("Decal") then
a.Transparency = 0
owner.Character.Humanoid.WalkSpeed = 16
if a.Name == "HumanoidRootPart" then
a.Transparency = 1
end
end
end
else
owner.Character.Parent = owner
if debug then print(owner.Character.Parent) end
for i, a in pairs(owner:GetDescendants()) do
if a:IsA("Part") or a:IsA("Decal") then
a.Transparency = .5
owner.Character.Humanoid.WalkSpeed = 42
if a.Name == "HumanoidRootPart" then
a.Transparency = 1
end
end
end
end
end)
-- UP TO DATE.