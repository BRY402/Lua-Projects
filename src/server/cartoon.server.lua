-- cartoon
for i,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("BasePart") then
local h = Instance.new("Highlight",script)
h.Name = v.Name
h.Adornee = v
h.FillTransparency = 1
h.DepthMode = 1
h.OutlineColor = Color3.fromHSV(0,0,0)
end
end
owner.Character.DescendantAdded:Connect(function(d)
if d:IsA("BasePart") then
local h = Instance.new("Highlight",script)
h.Name = d.Name
h.Adornee = d
h.FillTransparency = 1
h.DepthMode = 1
h.OutlineColor = Color3.fromHSV(0,0,0)
end
end)
-- UP TO DATE.