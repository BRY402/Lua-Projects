-- player_tool
local folder = Instance.new("Folder",owner.Character)
folder.Name = "Setup"
local event = Instance.new("RemoteEvent",folder)
local tool = Instance.new("Tool",owner.Backpack)
tool.Name = "Player"
NLS([==[local mouse = owner:GetMouse() mouse.Button1Down:Connect(function() if mouse.Target then local target = mouse.Target owner.Character.Setup.RemoteEvent:FireServer(player,target) end end)]==],folder)
event.OnServerEvent:Connect(function(player,target)
if target.Parent == workspace then
target.Parent.Parent = tool
tool.Name = target.Parent.Name
end
end)
-- UP TO DATE.