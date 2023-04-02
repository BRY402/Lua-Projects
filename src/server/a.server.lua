local p = Instance.new("Part",script)
local s = Instance.new("Sound",p)
local exp = Instance.new("Explosion",p)
local d = game:GetService("Debris")
p.Anchored = true
p.Size = Vector3.new(0,0,0)
p.Transparency = 1
p.CanCollide = false
p.CanTouch = false
p.CanQuery = false
p.CastShadow = false
s.SoundId = "rbxassetid://7772283448"
s.PlayOnRemove = true
s.Volume = 10
local s2 = s:Clone()
s2.Parent = owner.PlayerGui
p.CFrame = owner.Character.HumanoidRootPart.CFrame
exp.Position = p.Position
exp.BlastPressure = 500000 * 999999
--exp.BlastPressure = 1500000
d:AddItem(s,0)
d:AddItem(s2,0)
d:AddItem(p,.25)
for i,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("BasePart") then
d:AddItem(v,.25)
end
end
--waluigi scream = "rbxassetid://7772283448"
--sus = "rbxassetid://6573501241"
--vine boom = "rbxassetid://6823153536"