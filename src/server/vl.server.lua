local rs = game:GetService("RunService")
local part = Instance.new("Part",script)
part.Anchored = true
part.CFrame = owner.Character.HumanoidRootPart.CFrame
rs.Stepped:Connect(function()
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
local pos = (part.Position - Vector3.new(v.Character.HumanoidRootPart.Position.X,part.Position.Y,v.Character.HumanoidRootPart.Position.Z)).Unit
local mag = (part.Position - Vector3.new(v.Character.HumanoidRootPart.Position.X,part.Position.Y,v.Character.HumanoidRootPart.Position.Z)).magnitude
local look = pos:Dot(part.CFrame.lookVector)
if look < -.5 and mag < 50 then
plrsin = true
part.BrickColor = BrickColor.new("Lime green")
elseif plrsin == false then
part.BrickColor = BrickColor.new("Really red")
end
end
end
plrsin = false
end)