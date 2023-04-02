-- head_explosion
local ts = game:GetService("TweenService")
local Info = TweenInfo.new(1, Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0)
local grow = {Scale = Vector3.new(5,5,5)}
local doh = ts:Create(owner.Character.Head.Mesh,Info,grow)
doh:Play()
wait(1)
local kaboom = Instance.new("Explosion",owner.Character)
kaboom.Position = owner.Character.Head.Position
owner.Character.Head:Destroy()
kaboom.Hit:Connect(function(part)
if not part.Name == "Base" then
part.Anchored = false
end
end)
-- UP TO DATE.