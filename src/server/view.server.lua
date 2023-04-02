NLS([==[local de = game:GetService("Debris")
local rs = game:GetService("RunService")
local light = game:GetService("Lighting")
local s = Instance.new("ScreenGui",script)
local vi = Instance.new("ViewportFrame",s)
local skyc = Color3.fromRGB(10,10,10):Lerp(Color3.fromRGB(160,230,230),math.sin(light.ClockTime/(math.pi*2.4)))
s.IgnoreGuiInset = true
s.DisplayOrder = -math.huge
vi.Size = UDim2.new(1,0,1,0)
vi.BackgroundColor3 = skyc
vi.BackgroundTransparency = 1
vi.BorderColor3 = skyc
vi.Ambient = Color3.new(.541176,.541176,.541176)
vi.CurrentCamera = workspace.CurrentCamera
for i,v in pairs(workspace:GetChildren()) do
if v.ClassName == "Terrain" then
local t = Instance.new("WorldModel",vi)
t.Name = "Terrain"
task.spawn(function()
for i,v in pairs(workspace.Terrain:GetChildren()) do
v.Archivable = true
local c = v:Clone()
c.Parent = t
v.Destroying:Connect(function()
c:Destroy()
end)
v:GetPropertyChangedSignal("Parent"):Connect(function()
c:Destroy()
end)
if c:IsA("Model") or c:IsA("WorldModel") then
task.spawn(function()
while task.wait() do
for i,cv in pairs(c:GetDescendants()) do
if cv:IsA("BasePart") then
local p = v:FindFirstChild(cv.Name,true)
if p then
cv.CFrame = p.CFrame
cv.Anchored = true
end
end
end
end
end)
end
task.wait()
end
end)
else
v.Archivable = true
local c = v:Clone()
c.Parent = vi
v.Destroying:Connect(function()
c:Destroy()
end)
v:GetPropertyChangedSignal("Parent"):Connect(function()
c:Destroy()
end)
if c:IsA("Model") or c:IsA("WorldModel") then
task.spawn(function()
while task.wait() do
for i,cv in pairs(c:GetDescendants()) do
if cv:IsA("BasePart") then
local p = v:FindFirstChild(cv.Name,true)
if p then
cv.CFrame = p.CFrame
cv.Anchored = true
end
end
end
end
end)
end
task.wait()
end
end
workspace.ChildAdded:Connect(function(v)
task.wait(1.5)
v.Archivable = true
local c = v:Clone()
c.Parent = vi
v.Destroying:Connect(function()
c:Destroy()
end)
v:GetPropertyChangedSignal("Parent"):Connect(function()
c:Destroy()
end)
if c:IsA("Model") or c:IsA("WorldModel") then
task.spawn(function()
while task.wait() do
for i,cv in pairs(c:GetDescendants()) do
if cv:IsA("BasePart") then
local p = v:FindFirstChild(cv.Name,true)
if p then
cv.CFrame = p.CFrame
cv.Anchored = true
end
end
end
end
end)
end
end)
while task.wait() do
vi.LightDirection = -light:GetSunDirection()
skyc = Color3.fromRGB(10,10,10):Lerp(Color3.fromRGB(160,230,230),math.sin(light.ClockTime/(math.pi*2.4)))
vi.BackgroundColor3 = skyc
vi.BorderColor3 = skyc
end]==],owner.PlayerGui)