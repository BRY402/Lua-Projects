-- newpart
local part = Instance.new("Part",script)
part.Material = "Glass"
part.Transparency = .45
part.CFrame = owner.Character.HumanoidRootPart.CFrame
local ts = game:GetService("TweenService")
local info = TweenInfo.new(2.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0)
local size = { Size = Vector3.new(5,5,5) }
local resize = ts:Create(part,info,size)
resize:Play()
-- UP TO DATE.