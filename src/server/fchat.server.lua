NLS([==[local box = script.Parent.SB_Chat.Frame.ChatBarParentFrame.Frame:GetChildren()[2].Frame.ChatBar
box.FocusLost:Connect(function()
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SB_10:FireServer(box.Text,"Server")
box.Text = ""
end)]==],owner.PlayerGui)