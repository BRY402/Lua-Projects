-- camt
local cam = Instance.new("Part",script)
cam.CastShadow = false
cam.CanCollide = true
cam:SetNetworkOwner(owner)
cam.Size = Vector3.new(1,1,2)
cam.Color = Color3.new(0,0,0)
cam.Material = "SmoothPlastic"
NLS([==[local cam = workspace.ct.Part
local r = game:GetService("RunService")
cam.Transparency = .5
cam.CanCollide = false
while task.wait() do
workspace:BulkMoveTo({cam},{workspace.CurrentCamera.CFrame})
end]==],owner.PlayerGui)
-- UP TO DATE.