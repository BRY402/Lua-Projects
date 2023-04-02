local p = Instance.new("Part",script)
p.Size = Vector3.new(1,1,1)
p.CanCollide = false
p.Anchored = true
local r = Instance.new("RemoteEvent",script)
NLS([==[script.Parent = workspace
local s = workspace.laser
local p = s.Part
local r = s.RemoteEvent
local m = owner:GetMouse()
m.TargetFilter = p
game:GetService("RunService").RenderStepped:Connect(function()
r:FireServer(m.Hit,owner)
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(player,hit)
p.Size = Vector3.new(1,1,(owner.Character.Head.Position - hit.Position).magnitude)
p.CFrame = CFrame.lookAt(owner.Character.Head.Position,hit.Position) * CFrame.new(0,0,-(p.Size.Z / 2))
end)