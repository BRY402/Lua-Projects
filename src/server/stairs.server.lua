-- stairs
local part = Instance.new("SpawnLocation",script)
part.Enabled = false
part.Anchored = true
part.Size = Vector3.new(6,1,1)
part.Position = Vector3.new(0,.5,0)
local y = .5
local z = 0
while task.wait() do
y += 1
z += 1
local part = Instance.new("SpawnLocation",script)
part.Enabled = false
part.Anchored = true
part.Size = Vector3.new(6,1,1)
part.Position = Vector3.new(0,y,z)
end
-- UP TO DATE.