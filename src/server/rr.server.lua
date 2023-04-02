-- rr
local t = Instance.new("Tool",owner.Backpack)
local h = Instance.new("Part",t)
local s = Instance.new("Sound",h)
h.Size = Vector3.new(1,1,1)
s.SoundId = "rbxassetid://6784305960"
s.Volume = 2
h.Name = "Handle"
t.Name = "Funni block (don't activate)"
t.Activated:Connect(function()
s:Play()
end)
-- UP TO DATE.