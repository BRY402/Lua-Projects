-- spawn
local part = owner.Character.HumanoidRootPart
part.Parent.Humanoid.RequiresNeck = false
local TweenService = game:GetService("TweenService")
part.CanCollide = false

local Info = TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0)

local whatToDo = { Position = Vector3.new(0,2,0) }

local spawn = TweenService:Create(part, Info, whatToDo)

spawn:Play()
-- UP TO DATE.