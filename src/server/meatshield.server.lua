-- meatshield
local holdtool = Instance.new("Tool", owner.Character) local holder = Instance.new("Part", holdtool) local weld = Instance.new("Weld",holder) weld.Part0 = holder holder.Size = Vector3.new(1,1,1) holder.Name = "Handle" holder.Transparency = 1 holder.Touched:Connect(function(part) player = part.Parent:GetPlayerFromCharacter() if part.Name == "HumanoidRootPart" then weld.Part1 = part for i, a in pairs(part.Parent:GetDescendants()) do if a:IsA("Part") then a:SetNetworkOwner(owner) hum.WalkSpeed = 0
hum.JumpPower = 0 end end holdtool.Unequipped:Connect(function()
local hum = part.Parent:FindFirstChildOfClass("Humanoid")
if hum then
hum.WalkSpeed = 8
hum.JumpPower = 0
end
end)
holdtool.Equipped:Connect(function()
local hum = part.Parent:FindFirstChildOfClass("Humanoid")
if hum then
hum.WalkSpeed = 0
hum.JumpPower = 0
end
for i, a in pairs(part.Parent:GetDescendants()) do if a:IsA("Part") then a:SetNetworkOwner(owner) hum.WalkSpeed = 0
hum.JumpPower = 0 end end
end)
holdtool.Activated:Connect(function()
local head = part.Parent:FindFirstChild("Head")
if head then
weld.Part1 = holder
head:Destroy()
end
end)
end)
elseif part.Name == "Torso" or part.Name == "UpperTorso" then weld.Part1 = part for i, a in pairs(part.Parent:GetDescendants()) do if a:IsA("Part") then a:SetNetworkOwner(owner) hum.WalkSpeed = 0
hum.JumpPower = 0 end end holdtool.Unequipped:Connect(function()
local hum = part.Parent:FindFirstChildOfClass("Humanoid")
if hum then
hum.WalkSpeed = 8
hum.JumpPower = 0
end
if player then
for i, a in pairs(part.Parent:GetDescendants()) do if a:IsA("Part") then a:SetNetworkOwner(player) end end
end
end)
holdtool.Equipped:Connect(function()
local hum = part.Parent:FindFirstChildOfClass("Humanoid")
if hum then
hum.WalkSpeed = 0
hum.JumpPower = 0
end
for i, a in pairs(part.Parent:GetDescendants()) do if a:IsA("Part") then a:SetNetworkOwner(owner) hum.WalkSpeed = 0
hum.JumpPower = 0 end end
end)
holdtool.Activated:Connect(function()
local head = part.Parent:FindFirstChild("Head")
if head then
weld.Part1 = holder
head:Destroy()
end
end)
end) end end)
-- UPDATE!