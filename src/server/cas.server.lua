-- cas
local shield = Instance.new("Part",script)
local r = Instance.new("RemoteEvent",owner.PlayerGui)
shield.Shape = "Cylinder"
shield.Size = Vector3.new(.1,3,3)
NLS([==[local m = owner:GetMouse()
local hold = false
m.Button1Down:Connect(function()
hold = true
while hold do
task.wait()
local t = {hit = m.Hit, target = m.Target, hold = hold}
script.Parent.RemoteEvent:FireServer(player,t)
end
end)
m.Button1Up:Connect(function()
hold = false
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(player,t)
local long = (shield.Position - t.hit.Position).magnitude
shield.Position = t.hit.lookVector * long
end)
-- UP TO DATE.