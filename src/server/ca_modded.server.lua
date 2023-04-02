-- ca_modded
local run = game:GetService("RunService")
local debris = game:GetService("Debris")
local t = Instance.new("Tool",owner.Backpack)
t.Name = "Camera"
t.RequiresHandle = false
local surface = Instance.new("Part",script)
local gui = Instance.new("SurfaceGui",owner.PlayerGui)
gui.Adornee = surface
local view = Instance.new("ViewportFrame",gui)
local camera = Instance.new("Camera",script)
local r = Instance.new("RemoteEvent",owner.PlayerGui)
game:GetService("Players").PlayerAdded:Connect(function(a)
local gui = gui:Clone()
gui.Parent = a.PlayerGui
gui.Name = "Test"
gui.ViewportFrame.Size = UDim2.new(1,0,1,0)
gui.ViewportFrame.BackgroundTransparency = 1
gui.ViewportFrame.Name = "Frame"
local part = workspace.Base:Clone()
local view = gui.Frame
part.Parent = gui.Frame
gui.Adornee = script.Part
gui.Frame.CurrentCamera = camera
for i, b in pairs(workspace:GetDescendants()) do
if b:IsA("Part") then
local c = b:Clone()
c.Parent = view
end
end
r.OnServerEvent:Connect(function(player,cf)
local s, f = pcall(function()
camera.CFrame = cf
for i, des in pairs(view:GetChildren()) do
debris:AddItem(des,0)
end
for i, b in pairs(workspace:GetDescendants()) do
if b:IsA("Part") then
local c = b:Clone()
c.Parent = view
end
end
end)
end)
end)
for i, a in pairs(game:GetService("Players"):GetChildren()) do
if a:IsA("Player") then
local gui = gui:Clone()
gui.Parent = a.PlayerGui
gui.Name = "Test"
gui.ViewportFrame.Size = UDim2.new(1,0,1,0)
gui.ViewportFrame.BackgroundTransparency = 1
gui.ViewportFrame.Name = "Frame"
local view = gui.Frame
local part = workspace.Base:Clone()
part.Parent = gui.Frame
gui.Adornee = script.Part
gui.Frame.CurrentCamera = camera
for i, b in pairs(workspace:GetDescendants()) do
if b:IsA("Part") then
if b.Transparency >= .899 then
local c = b:Clone()
c.Transparency = 0
c.Parent = view
end
end
end
r.OnServerEvent:Connect(function(player,cf)
local s, f = pcall(function()
camera.CFrame = cf
for i, des in pairs(view:GetChildren()) do
debris:AddItem(des,0)
end
for i, b in pairs(workspace:GetDescendants()) do
if b:IsA("Part") then
local c = b:Clone()
c.Parent = view
end
end
end)
end)
end
end
surface.Size = Vector3.new(7.5,7.5,.1)
surface.Reflectance = 1
surface.Anchored = true
surface.CanCollide = false
surface.Material = "Glass"
NLS([==[local run = game:GetService("RunService") local t = owner.Backpack.Camera while task.wait(1) do cf = workspace.Camera.CFrame script.Parent.RemoteEvent:FireServer(player,cf) end]==],owner.PlayerGui)
surface.CFrame = CFrame.new(10,8,0) * CFrame.Angles(0,360,0)