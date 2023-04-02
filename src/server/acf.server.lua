NLS([==[
local messages = owner.PlayerGui.SB_Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay
local players = game:GetService("Players")
local function gl(d)
	if d:IsA("TextLabel") then
		return d
	end
end
--[[messages.DescendantAdded:Connect(function(d)
	print(d)
	gl(d)
end)]]
for i,v in pairs(players:GetPlayers()) do
	v.Chatted:Connect(function(msg)
		if string.sub(msg,0,2) ~= "/e" then
			local label = gl()
			if string.sub(label.TextButton.Text,2,#label.TextButton.Text - 2) == v.Name then
				label.Text = msg
			end
		end
	end)
end
players.PlayerAdded:Connect(function(v)
	v.Chatted:Connect(function(msg)
		if string.sub(msg,0,2) ~= "/e" then
			task.wait()
			local label = gl()
			if string.sub(label.TextButton.Text,2,#label.TextButton.Text - 2) == v.Name then
				label.Text = msg
			end
		end
	end)
end)]==],owner.PlayerGui)