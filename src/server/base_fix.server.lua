-- base_fix
if not workspace:FindFirstChild("Base") then
local b = Instance.new("Part",workspace) base.Size = Vector3.new(700.35211181641, 1.2000000476837, 700.40380859375) base.Name = "Base"
b.CFrame = CFrame.new(0.493740678, -0.600000024, 0.919000864, 1, 0, 0, 0, 1, 0, 0, 0, 1)
b.Velocity = Vector3.new(0,0,0)
b.CanCollide = true
b.Anchored = true
end
-- UPDATE!