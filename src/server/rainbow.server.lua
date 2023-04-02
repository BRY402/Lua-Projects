-- rainbow
local ts = game:GetService("TweenService")
local info = TweenInfo.new(5,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,-1,true,0)
local t = {Color = Color3.fromHSV(1,1,1)}
local b = ts:Create(owner.Character.Head,info,t)
b:Play()
-- UP TO DATE.