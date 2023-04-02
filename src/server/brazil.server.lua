local s1 = Instance.new("Sound",owner.Character.HumanoidRootPart)
local s2 = Instance.new("Sound",owner.Character.HumanoidRootPart)
local s3 = Instance.new("Sound",owner.Character.HumanoidRootPart)
s1.SoundId = "rbxassetid://7252560427"
s2.SoundId = "rbxassetid://8383718211"
s3.SoundId = "rbxassetid://6860224234"
s3.TimePosition = 2.9
s1.Volume = 1
s2.Volume = 2
s3.Volume = .1
s3.Pitch = 1.75
s1:Play()
task.wait(3)
s2:Play()
task.wait(4)
for i = 0,7 do
task.wait(.15)
s2.Pitch = 1 + i / 10
s2:Play()
end
task.wait(s1.TimeLength - 7.9)
s3:Play()