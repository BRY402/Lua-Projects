-- create
local r = Instance.new("RemoteEvent",owner.PlayerGui)
NLS([==[local m = owner:GetMouse() m.Button1Down:Connect(function()
local hit = m.Hit
owner.PlayerGui.RemoteEvent:FireServer(player, hit)
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(player, hit)
local part = Instance.new("Part",script)
part.Size = Vector3.new(3,3,3)
part.Position = Vector3.new(math.round(hit.Position.X * part.Size.X),math.round(hit.Position.Y * part.Size.Y),math.round(hit.Position.Z * part.Size.Z))
end)
-- UP TO DATE.