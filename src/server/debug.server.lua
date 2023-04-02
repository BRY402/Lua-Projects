-- debug
local d = game:GetService("Debris")
while task.wait() do
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("Message") or v:IsA("Hint") then
d:AddItem(v,0)
end
if v:IsA("Sound") and not v.Parent:IsA("Part") then
if not v.Parent:IsA("Seat") then
v.PlayOnRemove = false
d:AddItem(v,0)
end
end
if v:IsA("Sound") and v.Volume >= 5 then
v.PlayOnRemove = false
d:AddItem(v,0)
end
end
workspace:FindFirstChildOfClass("Humanoid")
if hum then
hum.Parent = script
end
local sky = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
if sky then
d:AddItem(sky,0)
end
for i, v in pairs(game:GetService("SoundService"):GetDescendants()) do
if v:IsA("Sound") then
s.PlayOnRemove = false
d:AddItem(v,0)
end
end
game:GetService("Lighting").Brightness = 2
end
-- UPDATE!