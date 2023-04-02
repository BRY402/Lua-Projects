-- is
NLS([==[local sf = Instance.new("Folder",owner.Character)
sf.Name = "SetupFolder"
local r = Instance.new("RemoteEvent",owner.Character.SetupFolder)
local mouse = owner:GetMouse()
mouse.Button1Down:Connect(function()
local target = mouse.Target
r:FireServer(target)
end)]==],owner.PlayerGui)
owner.Character.SetupFolder.RemoteEvent.OnServerEvent:Connect(function(player,target) if target.Parent:IsA("Tool") then target.Parent.Parent = owner.Backpack end end)
-- UPDATE! (DISABLED FOR NOW.)