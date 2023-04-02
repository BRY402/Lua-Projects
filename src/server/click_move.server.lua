-- click_move
NLS([==[local m = owner:GetMouse()
local ps = game:GetService("PathfindingService")
local deb = game:GetService("Debris")
script.Parent = workspace
local mov = false
local b = 1
local h = owner.Character:FindFirstChildOfClass("Humanoid")
local t = h.Parent.Torso
m.Button1Up:Connect(function()
for i, v in pairs(script:GetChildren()) do
deb:AddItem(v,0)
end
h = owner.Character:FindFirstChildOfClass("Humanoid")
t = h.Parent.Torso
local p = ps:CreatePath()
local s, f = pcall(function()
m.TargetFilter = owner.Character
p:ComputeAsync(t.Position, m.Hit.Position)
end)
local w = p:GetWaypoints()
for i, wa in pairs(w) do
local sp = Instance.new("SpawnLocation",script)
sp.Size = Vector3.new(1,1,1)
sp.Shape = "Ball"
sp.CastShadow = false
sp.Material = "Neon"
sp.Color = Color3.new(1,1,1)
sp.CanCollide = false
sp.Anchored = true
sp.Position = wa.Position
sp.Enabled = false
sp.Position = sp.Position + Vector3.new(0,3,0)
sp.Name = "sp"..i
sp.Touched:Connect(function(pa)
if pa.Parent == owner.Character then
deb:AddItem(sp,0)
end
end)
end
for i, wa in pairs(w) do
if wa.Action == Enum.PathWaypointAction.Jump then 
h:ChangeState(Enum.HumanoidStateType.Jumping)
elseif wa.Action == Enum.PathWaypointAction.Walk then
mov = true
h:MoveTo(wa.Position)
end
h.MoveToFinished:Connect(function()
mov = false
end)
while mov do
h:MoveTo(wa.Position)
task.wait()
end
end
end)]==],owner.PlayerGui)
-- UP TO DATE.