-- music
r = Instance.new("RemoteEvent",owner.Character)
r2 = Instance.new("RemoteEvent",owner.Character)
r2.Name = "ep"
mode = 1
NLS([==[uis = game:GetService("UserInputService") mode = 1 uis.InputBegan:Connect(function(input) if input.KeyCode == Enum.KeyCode.Q then mode = mode - 1 if mode == 0 or mode < 0 then mode = 1 end owner.Character.RemoteEvent:FireServer(player,mode) end if input.KeyCode == Enum.KeyCode.E then mode = mode + 1 if mode == 4 or mode > 4 then mode = 3 end owner.Character.ep:FireServer(player,mode) end end)]==],owner.PlayerGui)
a = Instance.new("Sound",owner.Character.Head)
a.Name = "Music"
r.OnServerEvent:Connect(function(player,mode)
mode = mode
print(mode)
end)
r2.OnServerEvent:Connect(function(player,mode)
mode = mode
print(mode)
end)
owner.Chatted:Connect(function(msg)
if mode == 1 then
a.SoundId = "rbxassetid://"..msg
a.Name = "Music: "..msg
print("Now playing: "..a.SoundId)
end
if mode == 2 then
a.Volume = msg
end
if mode == 3 then
a.PlaybackSpeed = msg
end
if msg == "play" or msg == "/e play" then
a:Play()
end
if msg == "stop" or msg == "/e stop" then
a:Stop()
end
end)
-- UPDATE!