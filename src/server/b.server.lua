-- b
NLS([==[if workspace:FindFirstChild("Fake Base") then workspace["Fake Base"]:Destroy() end
local base = Instance.new("Part",script) base.Size = Vector3.new(700,1,700)
script.Parent = workspace
script.Name = "fbb"
base.Material = "Grass"
base.BrickColor = BrickColor.new("Forest green")
base.Name = "Fake Base"
base.Anchored = true
base.Position = Vector3.new(0,-.6,0)]==],owner.PlayerGui)
-- UP TO DATE.