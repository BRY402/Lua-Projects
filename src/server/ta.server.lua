-- ta
local r = Instance.new("RemoteEvent",script)
script.Name = "TA"
NLS([==[local m = owner:GetMouse() local r = workspace.TA.RemoteEvent
m.Button1Down:Connect(function()
if m.Target then
if m.Target.Parent:IsA("Tool") then
local t = m.Target.Parent
r:FireServer(player,t)
end
end
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(player,t)
t:Activate()
end)
-- UP TO DATE.