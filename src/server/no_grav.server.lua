NLS([==[local hum = owner.Character.Humanoid
function nograv(p)
if p.Anchored ~= true and p:FindFirstChild("NogravityForce") == nil then
local vf = Instance.new("VectorForce",p)
local at = Instance.new("Attachment",p)
vf.Name = "NogravityForce"
vf.Attachment0 = at
vf.RelativeTo = Enum.ActuatorRelativeTo.World
vf.ApplyAtCenterOfMass = true
vf.Force = Vector3.new(0,workspace.Gravity * p:GetMass(),0)
end
end
owner.CharacterAdded:Connect(function()
local hum = owner.Character:WaitForChild("Humanoid")
hum.Touched:Connect(nograv)
end)
hum.Touched:Connect(nograv)]==],owner.PlayerGui)