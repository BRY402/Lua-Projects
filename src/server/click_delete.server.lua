-- click_delete
local folder = Instance.new("Folder",owner.Character)
folder.Name = "SetupFolder"
local r = Instance.new("RemoteEvent",folder)
NLS([==[local mouse = owner:GetMouse() mouse.Button1Down:Connect(function() if mouse.Target or not mouse.Target.Name == "Base" then local target = mouse.Target owner.Character.SetupFolder.RemoteEvent:FireServer(target,owner) end end)]==],folder)
r.OnServerEvent:Connect(function(player,target)
if target.Parent == workspace then
target:Destroy()
else
target.Parent:Destroy()
end
end)
-- UPDATE!