-- remote events
local a = Instance.new("RemoteFunction")
a:InvokeServer(player, part)
a.OnServerInvoke = function(player, part)
-- this will stop the script until all the requested things are ran.
end
local b = Instance.new("RemoteEvent")
b:FireServer(part,owner)
b.OnServerEvent:Connect(function(player, part)
-- this will fire the requested things inside the function and the script will run normally.
end)
