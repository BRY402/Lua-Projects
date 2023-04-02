-- afk
local t = owner.Character.Torso
t.Anchored = true
local ts = game:GetService("TweenService")
local platform = Instance.new("Part",workspace) 
platform.Position = Vector3.new(10000,10000,10000)
platform.Anchored = true
local click = Instance.new("ClickDetector",platform)
click.MouseClick:Connect(function() platform:Destroy() t.Anchored = false t.Position = Vector3.new(0,0,0) end)
platform.Size = Vector3.new(10,1,10)
local Info = TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0)
local whatToDo = { Position = platform.Position }
local afk = ts:Create(t, Info, whatToDo)
afk:Play()
-- UP TO DATE.