-- pb
NLS([==[script.Parent = workspace
local b = Instance.new("Part",script)
b.Size = Vector3.new(1024,.5,1024) * 2
b.Position = Vector3.new(100000,100000,100000)
owner.Character.HumanoidRootPart.CFrame = CFrame.new(b.Position + Vector3.new(0,45,0))
b.BrickColor = BrickColor.new("Forest green")
b.Material = "Grass"
b.Anchored = true
owner.CharacterAdded:Connect(function(char)
if char then
local hrp = char:WaitForChild("HumanoidRootPart")
hrp.CFrame = CFrame.new(b.Position + Vector3.new(0,45,0))
end
end)]==],owner.PlayerGui)
-- UP TO DATE.