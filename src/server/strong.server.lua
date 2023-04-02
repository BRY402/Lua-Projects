-- strong
script.Parent = owner.Character
for i = 1,150 do
local hit = Instance.new("SpawnLocation",owner.Character)
hit:ClearAllChildren()
hit.Enabled = false
local w = Instance.new("Weld",owner.Character)
w.Part0 = owner.Character.PrimaryPart
w.Part1 = hit
hit.Size = Vector3.new(100,100,100)
hit.CanCollide = false
hit.CanTouch = false
hit.Locked = true
hit.Transparency = 1
end
for i, v in pairs(owner.Character:GetDescendants()) do
if v:IsA("Part") then
v.CustomPhysicalProperties = PhysicalProperties.new(500000,500000,0,500000,0)
end
end
--[[NLS([==[script.Parent = owner.Character
for _,v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and not v:FindFirstAncestor(owner.Character) and not v:IsA("Camera") and not v:IsA("Terrain") then
v.Massless = true
v.Changed:Connect(function()
if v.Anchored ~= true then
v.Massless = true
end
end)
end
end
workspace.DescendantAdded:Connect(function(v)
if v:IsA("BasePart") and not v:FindFirstAncestor(owner.Character) and not v:IsA("Camera") and not v:IsA("Terrain") then
v.Massless = true
v.Changed:Connect(function()
if v.Anchored ~= true then
v.Massless = true
end
end)
end
end)]==],owner.PlayerGui)]]
-- UP TO DATE.