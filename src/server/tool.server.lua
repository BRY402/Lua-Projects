-- tool
local t = Instance.new("Tool",owner.Character)
t.Name = "Tool"
owner.Character.Humanoid.Touched:Connect(function(part) if part.Name == "Base" or part.Name == "Terrain" then else local click = Instance.new("ClickDetector",part) click.MouseClick:Connect(function() t:ClearAllChildren() part.Name = "Handle" part.Parent = t end) end end)
-- UPDATE!