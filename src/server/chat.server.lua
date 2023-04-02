-- chat
local d = game:GetService("Debris")
local ru = game:GetService("RunService")
local so = Instance.new("Sound",owner.Character.Head)
local newmsg = false
so.SoundId = "rbxassetid://428071857"
so.Volume = 1.5
so.Name = "MsgSFX"
local function type(msg,ca)
local st = string.sub(msg,0,ca)
return st
end
local function chat(msg)
if string.sub(msg,0,2) == "/e" then
else
if string.lower(msg) == "lol" then
so:Stop()
so.SoundId = "rbxassetid://319332735"
so.Volume = 3.5
so:Play()
local s,f = pcall(function()
if owner.Character.Head:FindFirstChild("ChatMsg") then
d:AddItem(owner.Character.Head.ChatMsg,0)
end
b = Instance.new("BillboardGui",owner.Character.Head)
end)
b.DistanceLowerLimit = 0
b.DistanceUpperLimit = 0
b.MaxDistance = 100
b.Size = UDim2.new(20,0,5,0)
b.StudsOffset = Vector3.new(0,2.5,0)
b.Name = "ChatMsg"
local t = Instance.new("TextBox",b)
t.BackgroundTransparency = 1
t.Font = Enum.Font.Fantasy
t.Size = UDim2.new(1,0,1,0)
t.TextWrapped = true
t.TextColor3 = Color3.fromRGB(255,255,255)
t.TextSize = 26
for i = 1,#msg do
t.Text = type(msg,i)
task.wait(.25)
end
d:AddItem(b,3.5)
else
so:Stop()
so.SoundId = "rbxassetid://428071857"
so.Volume = 1.5
local s,f = pcall(function()
if owner.Character.Head:FindFirstChild("ChatMsg") then
d:AddItem(owner.Character.Head.ChatMsg,0)
end
b = Instance.new("BillboardGui",owner.Character.Head)
end)
b.DistanceLowerLimit = 0
b.DistanceUpperLimit = 0
b.MaxDistance = 100
b.Size = UDim2.new(20,0,5,0)
b.StudsOffset = Vector3.new(0,2.5,0)
b.Name = "ChatMsg"
local t = Instance.new("TextBox",b)
t.BackgroundTransparency = 1
t.Font = Enum.Font.Fantasy
t.Size = UDim2.new(1,0,1,0)
t.TextWrapped = true
t.TextColor3 = Color3.fromRGB(255,255,255)
t.TextSize = 26
for i = 1,#msg do
t.Text = type(msg,i)
so:Play()
game:GetService("RunService").Stepped:Wait(so.TimeLength)
end
d:AddItem(b, 6)
end
end
end
owner.Character.Head.DescendantRemoving:Connect(function(sop)
if sop.Name == "MsgSFX" then
local op = sop.Parent
so = sop:Clone()
so.Parent = op
end
end)
owner.CharacterAdded:Connect(function()
so = Instance.new("Sound",owner.Character.Head)
so.SoundId = "rbxassetid://428071857"
so.Volume = 1.5
so.Name = "MsgSFX"
owner.Character.Head.DescendantRemoving:Connect(function(sop)
if sop.Name == "MsgSFX" then
local op = sop.Parent
so = sop:Clone()
so.Parent = op
end
end)
end)
owner.Chatted:Connect(chat)
-- UP TO DATE.