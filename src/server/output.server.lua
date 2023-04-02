-- EXECUTOR
--[[Todo list to remember:
edit uicorners to round depending on users screensize
finish close and open button
finish output
finish script execution
]]
-- source
local loaded = false
local src = [==[print("Loaded")
local gui = Instance.new("ScreenGui",script)
local X,Y = gui.AbsoluteSize.X,gui.AbsoluteSize.Y
local rgb = Color3.fromRGB
local main = Instance.new("Frame",gui)
local output = Instance.new("ScrollingFrame",main)
local saves = Instance.new("ScrollingFrame",gui)
local input_frame = Instance.new("Frame",gui)
local input_button = Instance.new("TextButton",input_frame)
local input = Instance.new("TextBox",input_frame)
local round1 = Instance.new("UICorner",main)
local round2 = Instance.new("UICorner",input_frame)
gui.IgnoreGuiInset = true
main.Name = "Main"
main.Size = UDim2.new(0,X / 2.5,0,Y / 2.8)
main.BackgroundTransparency = .4
main.BackgroundColor3 = rgb(75,75,75)
saves.Size = UDim2.new(0,X / 15,0,Y / 2.8)
saves.Name = "Saves"
saves.BackgroundTransparency = 1
input_frame.Size = UDim2.new(0,X / 2.5,0,Y / 25)
input_frame.Position = UDim2.new(0,0,0,Y / 2.75)
input_frame.Name = "I_Frame"
input_frame.BackgroundTransparency = .4
input_frame.BackgroundColor3 = main.BackgroundColor3
input_button.BackgroundTransparency = 1
input_button.TextScaled = true
input_button.Text = "Useless for now"
input.Size = UDim2.new(1,0,1,0)
input.BackgroundTransparency = 1
input.ClearTextOnFocus = false
input.TextColor3 = rgb(255,255,255)
]==]

-- execution
owner.PlayerGui.ChildAdded:Connect(function(c)
if c:IsA("LocalScript") and c:FindFirstChild("Source") and not loaded then
loaded = true
while task.wait() do
c:FindFirstChild("Source").OnServerInvoke = function(plr)
if plr == owner then
return src
else
print(plr.." attempted to log you")
return "unfunny"
end
end
end
end
end)
NLS("",owner.PlayerGui)