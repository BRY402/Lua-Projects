NLS([==[local part = Instance.new("Part")
script.Parent = workspace
local lighting = game:GetService("Lighting")
local distFromCam = 16
part.Shape = "Ball"
part.Material = "Neon"
part.Color = Color3.fromRGB(255,0,0)
part.Anchored = true
local size = (1 / distFromCam) * 100
part.Size = Vector3.new(size,size,size)
part.Parent = script
part.CanCollide = false
game:GetService("RunService").RenderStepped:Connect(function()
	part.Position = workspace.CurrentCamera.CFrame.Position + lighting:GetSunDirection() * distFromCam
end)]==],owner.PlayerGui)