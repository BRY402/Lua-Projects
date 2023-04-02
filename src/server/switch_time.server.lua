-- switch_time
local ts = game:GetService("TweenService")
local Info = TweenInfo.new(5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0)
local ligh = game.Lighting
local day = { ClockTime = game.Lighting.ClockTime + 12 }
local transform = ts:Create(ligh, Info, day)
transform:Play()
-- UP TO DATE.