-- tc
local folder = Instance.new("Folder",owner.Character)
folder.Name = "Setup"
local event = Instance.new("RemoteEvent",folder)
NLS([==[local mouse = owner:GetMouse() mouse.Button1Down:Connect(function() if mouse.Target then local target = mouse.Target owner.Character.Setup.RemoteEvent:FireServer(player,target) end end)]==],folder)
event.OnServerEvent:Connect(function(player,target)
if target.Parent:IsA("Tool") then 
tool = target.Parent:Clone()
tool.Parent = owner.Backpack
end
end)
-- UP TO DATE.