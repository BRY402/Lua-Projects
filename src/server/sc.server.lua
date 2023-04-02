local r = Instance.new("RemoteEvent",owner.PlayerGui)
local char = Instance.new("Model",script)
local hum = Instance.new("Humanoid",char)
local h = Instance.new("SpawnLocation",char)
local nc = Instance.new("NoCollisionConstraint",script)
local nc2 = Instance.new("NoCollisionConstraint",script)
char.Name = "C"
nc.Part0 = owner.Character.Head
nc.Part1 = h
nc2.Part0 = owner.Character.Torso
nc2.Part1 = h
hum.DisplayName = " "
h.Name = "Head"
h.Enabled = false
h.Size = Vector3.new(0,0,0)
h.Anchored = true
h.CanCollide = false
r.Name = "ChatRemote"
NLS([==[local r = owner.PlayerGui.ChatRemote -- this remote has to be created by you btw it doesn't exist
local box = script.Parent.SB_Chat.Frame.ChatBarParentFrame.Frame:GetChildren()[2].Frame.ChatBar
box.FocusLost:Connect(function()
local msg = box.Text
box.Text = ""
r:FireServer(msg,owner) -- fires message
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(plr,msg)
if plr == owner and msg ~= "" then
local oh = owner.Character:FindFirstChild("Humanoid")
if oh then
oh.DisplayName = " "
end
hum.DisplayName = msg
end
end)
game:GetService("RunService").Stepped:Connect(function()
if owner.Character then
local he = owner.Character:FindFirstChild("Head")
if he then
h.CFrame = he.CFrame
end
end
end)