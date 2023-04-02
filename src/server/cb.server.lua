local bl = Instance.new("SpawnLocation",script)
bl.Anchored = true
bl.Name = "Base"
bl.Material = "Grass"
bl.BrickColor = BrickColor.new("Forest green")
bl.Anchored = true
bl.Size = Vector3.new(700,1,700)
bl.Position = Vector3.new(math.random(0,100000),math.random(100000,1000000),math.random(0,100000))
bl.Enabled = false
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") then
local a = v.Anchored
v.Anchored = true
local pos = v.Position - bl.Position
v.Position -= pos
v.Anchored = a
task.wait()
end
end