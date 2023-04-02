NLS([==[warn("To get the source of the script you have to run it locally")
local sc = Instance.new("ScreenGui",script)
local t = Instance.new("TextBox",sc)
local uc = Instance.new("UICorner",t)
uc.CornerRadius = UDim.new(.25,0)
t.Size = UDim2.new(.6,0,.035,0)
t.Position = UDim2.new(.35,0,.945,0)
t.BackgroundColor3 = Color3.fromRGB(37,37,37)
t.TextColor3 = Color3.new(1,1,1)
t.Font = "Code"
t.ClearTextOnFocus = false
t.TextScaled = true
t.Text = ""
t.PlaceholderText = "Outputed code"
local function check(c)
	local r = c:FindFirstChild("Source")
	if c:IsA("LocalScript") and r then
		t.Text = r:InvokeServer()
	end
end
owner.PlayerGui.DescendantAdded:Connect(check)
owner.Backpack.DescendantAdded:Connect(check)
owner.CharacterAdded:Connect(function(c)
	c.DescendantAdded:Connect(check)
end)
owner.Character.DescendantAdded:Connect(check)]==],owner.PlayerGui)