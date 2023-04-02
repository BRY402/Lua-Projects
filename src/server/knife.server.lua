-- knife
cooldown = .1
damage = 10
maxhealth = 20
local d = game:GetService("Debris")
local ts = game:GetService("TweenService") local h = Instance.new("Part") h.Name = "Handle" local t = Instance.new("Tool", owner.Backpack) h.Parent = t t.Name = "Knife" h.Size = Vector3.new(.5,0,.5) local dmg = Instance.new("NumberValue",h) local Info = TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0) local whatToDo = { Size = Vector3.new(.5,2,.5) } local si = ts:Create(h, Info, whatToDo) t.Equipped:Connect(function() eq = true si:Play() end) t.Unequipped:Connect(function() eq = false end) dmg.Name = "dmg" dmg.Value = damage owner.Character.Humanoid.MaxHealth = maxhealth while eq do for i, a in pairs(workspace:GetPartsInPart(h)) do if a.Parent:FindFirstChildOfClass("Humanoid") then
if a.Parent == owner.Character then
else
hum.BreakJointsOnDeath = false
hum = a.Parent:FindFirstChildOfClass("Humanoid") hum:TakeDamage(dmg.Value) hum.Died:Connect(function()
if not game:GetService("Players"):GetPlayerFromCharacter(a.Parent) then
if hum.RigType == "R6" then
d:AddItem(a.Parent.Torso.Neck,0)
d:AddItem(a.Parent,6)
else
d:AddItem(a.Parent.UpperTorso.Neck,0)
d:AddItem(a.Parent,6)
end
end
if hum.RigType == "R6" then
d:AddItem(a.Parent.Torso.Neck,0)
else
d:AddItem(a.Parent.UpperTorso.Neck,0)
end
dmg.Value = dmg.Value + hum.MaxHealth / 10 owner.Character.Humanoid.MaxHealth = owner.Character.Humanoid.MaxHealth + hum.MaxHealth / 20 end) end end end
task.wait(.25)
end
-- UPDATE!