-- goggles
local gui = Instance.new("ScreenGui",owner.PlayerGui)
local see = Instance.new("ViewportFrame",gui)
gui.Name = "GoggleG"
see.Name = "Watch"
see.Size = UDim2.new(1,0,1,0)
see.BackgroundTransparency = 1
local t = Instance.new("Tool",owner.Backpack)
t.RequiresHandle = false
t.Name = "Goggles" 
NLS([==[owner.PlayerGui.GoggleG.Watch.CurrentCamera = workspace.CurrentCamera local ts = game:GetService("TweenService")
local d = game:GetService("Debris")
local t = script.Parent
local info = TweenInfo.new(3,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local t1 = {Size = Vector3.new(60,60,60)}
local t2 = {Transparency = 1}
t.Activated:Connect(function()
local effect = Instance.new("Part",script)
effect.CastShadow = false
effect.Anchored = true
effect.CanCollide = false
effect.Material = "SmoothPlastic"
effect.Shape = "Ball"
effect.Color = Color3.fromRGB(0,255,0)
effect.Position = owner.Character.HumanoidRootPart.Position
local ef1 = ts:Create(effect,info,t1)
local ef2 = ts:Create(effect,info,t2)
ef1:Play()
ef2:Play()
d:AddItem(effect,3)
for i, s in pairs(owner.PlayerGui.GoggleG.Watch:GetChildren()) do
d:AddItem(s,0)
end
for i, v in pairs(workspace:GetDescendants()) do
if v:IsA("Part") then
if v.Transparency >= .899 then
local box = Instance.new("SelectionBox",owner.PlayerGui.GoggleG.Watch)
box.Name = "BBOX"
box.Adornee = v
box.Color3 = Color3.fromHSV(1,1,1)
end
end
end
end)
t.Equipped:Connect(function()
local effect = Instance.new("Part",script)
effect.CastShadow = false
effect.Anchored = true
effect.CanCollide = false
effect.Material = "SmoothPlastic"
effect.Shape = "Ball"
effect.Color = Color3.fromRGB(0,255,0)
effect.Position = owner.Character.HumanoidRootPart.Position
local ef1 = ts:Create(effect,info,t1)
local ef2 = ts:Create(effect,info,t2)
ef1:Play()
ef2:Play()
d:AddItem(effect,3)
for i, v in pairs(workspace:GetDescendants()) do
if v:IsA("Part") then
if v.Transparency >= .899 then
local box = Instance.new("SelectionBox",owner.PlayerGui.GoggleG.Watch)
box.Name = "BBOX"
box.Adornee = v
box.Color3 = Color3.fromHSV(1,1,1)
end
end
end
end)
t.Unequipped:Connect(function()
for i, s in pairs(owner.PlayerGui.GoggleG.Watch:GetChildren()) do
d:AddItem(s,0)
end
end)]==],t)
-- UP TO DATE.