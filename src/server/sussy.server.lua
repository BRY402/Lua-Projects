-- sussy
a = Instance.new("Sound",owner.Character.HumanoidRootPart)
a.SoundId = "rbxassetid://6677157344" a.Volume = 2 a:Play() a.PlaybackSpeed = 1.25 local sfx = Instance.new("PitchShiftSoundEffect",a) sfx.Octave = a.Pitch * 15
a.Looped = true
owner.Character.Head.Transparency = 1
owner.Character.Head.face.Transparency = 1
owner.Character["Left Arm"].Transparency = 1
owner.Character["Right Arm"].Transparency = 1
owner.Character.Humanoid.WalkSpeed = 32
for i, a in pairs(owner.Character:GetDescendants()) do
if a:IsA("Part") then
a.BrickColor = BrickColor.new("Really red")
elseif a:IsA("Accessory") then
a:Destroy()
end
end
a:GetPropertyChangedSignal("TimePosition"):Connect(function()
if a.TimePosition == 38.55 then
a.Pitch = .1
elseif a.TimePosition == 0 then
a.Pitch = .35
end
end)
-- UP TO DATE.