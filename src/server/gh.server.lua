-- gh
local t = Instance.new("Tool",owner.Backpack)
t.Name = "Grappling hook"
local h = Instance.new("Part",t)
h.Name = "Handle"
local hd = Instance.new("Part",t)
hd.Transparency = 1
hd.Name = "Hook destination"
hd.CanCollide = false
hd.Anchored = true
hd.Size = Vector3.new(1,1,1)
h.Size = Vector3.new(1,1,2)
local r = Instance.new("RemoteEvent",owner.PlayerGui)
r.Name = "HGDP"
local at0 = Instance.new("Attachment",h)
local at1 = Instance.new("Attachment",hd)
local cord = Instance.new("RopeConstraint",h)
cord.Attachment0 = at0
cord.Attachment1 = at1
cord.Visible = true
cord.Enabled = false
t.Equipped:Connect(function()
cord.Enabled = true
end)
t.Unequipped:Connect(function()
cord.Enabled = false
end)
NLS([==[local HGDP = owner.PlayerGui.HGDP local m = owner:GetMouse()
local function gotodp(hold)
local ta = {hit = m.Hit, holding = hold}
HGDP:FireServer(player,ta)
end
script.Parent.Activated:Connect(gotodp(true))
script.Parent.Deactivated:Connect(gotodp(false))]==],t)
r.OnServerEvent:Connect(function(player, ta)
hd.Position = ta.hit.Position
while ta.holding do
cord.Length = cord.Length - 1
task.wait()
end
end)
-- ADD!