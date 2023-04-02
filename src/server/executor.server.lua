-- executor --
-- Variables --
--[[string.gsub([==[
]==],[==[
]==],"+1LINE<'NL'>CODE1")]]
local r = Instance.new("RemoteEvent",owner.PlayerGui)
-- Properties --
r.Name = "RERCOPR"
-- Script --
r.OnServerEvent:Connect(function(plr,t)
	if plr == owner then
		if tonumber(t.wtd) == 1 then
			local s,f = pcall(function()
				loadstring(t.code)()
			end)
			if f then
				warn("Executor error: "..string.sub(f,21,#f))
			end
		elseif tonumber(t.wtd) == 2 then
			local pos = owner.Character.HumanoidRootPart.Position
			owner:LoadCharacter()
			owner.Character:MoveTo(pos)
		end
	end
end)
script.Parent = owner.PlayerGui
NLS([==[-- Variables --
local Executor = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Topbar = Instance.new("Frame")
local Credits = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local roundtop = Instance.new("UICorner")
local pr = Instance.new("TextButton")
local clr = Instance.new("TextButton")
local run = Instance.new("TextButton")
local scroll = Instance.new("ScrollingFrame")
local text = Instance.new("TextBox")
local lines = Instance.new("TextLabel")
local showsc = Instance.new("TextButton")
local round = Instance.new("UICorner")
local SCTopbar = Instance.new("Frame")
local roundtop_2 = Instance.new("UICorner")
local Toggle_2 = Instance.new("TextButton")
local list = Instance.new("ScrollingFrame")
local Script1 = Instance.new("TextButton")
local layout = Instance.new("UIGridLayout")
local Searchbar = Instance.new("TextBox")
local scripts = Instance.new("ScrollingFrame")
local scriptsSeparate = Instance.new("Folder")
local scriptlist = Instance.new("UIGridLayout")
local Script1_2 = Instance.new("TextLabel")
local NSButton = Instance.new("TextButton")
local rs = game:GetService("RunService") 
local remote = owner.PlayerGui.RERCOPR
local rbr = 3
local delay = 3
local hold = false
local gone = false
local uis = game:GetService('UserInputService')
local draggable = false
local dragStart
local startPos = Topbar.Position
-- Properties --
Executor.Name = "Executor"
Executor.Parent = script
Executor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Executor.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = Executor
Main.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
Main.BorderSizePixel = 0
Main.Draggable = true
Main.Position = UDim2.new(0.0850084275, 0, 0.0966403782, 0)
Main.Size = UDim2.new(0.433899641, 0, 0.421227515, 0)

Topbar.Name = "Topbar"
Topbar.Parent = Main
Topbar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Topbar.BorderColor3 = Color3.fromRGB(27, 42, 53)
Topbar.BorderSizePixel = 0
Topbar.Draggable = true
Topbar.Position = UDim2.new(0, 0, -0.0856912881, 0)
Topbar.Size = UDim2.new(1, 0, 0.112812214, 0)

Credits.Name = "Credits"
Credits.Parent = Topbar
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.BorderColor3 = Color3.fromRGB(27, 42, 53)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0.0123587577, 0, 0, 0)
Credits.Size = UDim2.new(0, 138, 0, 28)
Credits.Font = Enum.Font.SourceSans
Credits.Text = "Made with love by BRY402."
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextWrapped = true

Toggle.Name = "Toggle"
Toggle.Parent = Topbar
Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Toggle.BackgroundTransparency = 1.000
Toggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
Toggle.BorderSizePixel = 0
Toggle.ClipsDescendants = true
Toggle.Position = UDim2.new(0.944582045, 0, 0, 0)
Toggle.Size = UDim2.new(0.054731641, 0, 1, 0)
Toggle.Font = Enum.Font.Code
Toggle.Text = "-"
Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle.TextScaled = true
Toggle.TextSize = 14.000
Toggle.TextWrapped = true

roundtop.CornerRadius = UDim.new(0.189999998, 0)
roundtop.Name = "roundtop"
roundtop.Parent = Topbar

pr.Name = "pr"
pr.Parent = Main
pr.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
pr.BackgroundTransparency = 1.000
pr.BorderColor3 = Color3.fromRGB(27, 42, 53)
pr.BorderSizePixel = 0
pr.Position = UDim2.new(0.305370927, 0, 0.840874672, 0)
pr.Size = UDim2.new(0.153601706, 0, 0.159125388, 0)
pr.Font = Enum.Font.SourceSans
pr.Text = "Refresh player"
pr.TextColor3 = Color3.fromRGB(255, 255, 255)
pr.TextSize = 20.000
pr.TextWrapped = true

clr.Name = "clr"
clr.Parent = Main
clr.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
clr.BackgroundTransparency = 1.000
clr.BorderColor3 = Color3.fromRGB(27, 42, 53)
clr.BorderSizePixel = 0
clr.Position = UDim2.new(0.151769221, 0, 0.840874672, 0)
clr.Size = UDim2.new(0.153601706, 0, 0.159125388, 0)
clr.Font = Enum.Font.SourceSans
clr.Text = "Clear"
clr.TextColor3 = Color3.fromRGB(255, 255, 255)
clr.TextSize = 20.000
clr.TextWrapped = true

run.Name = "run"
run.Parent = Main
run.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
run.BackgroundTransparency = 1.000
run.BorderColor3 = Color3.fromRGB(27, 42, 53)
run.BorderSizePixel = 0
run.Position = UDim2.new(0, 0, 0.840874672, 0)
run.Size = UDim2.new(0.153601706, 0, 0.159125388, 0)
run.Font = Enum.Font.SourceSans
run.Text = "Execute"
run.TextColor3 = Color3.fromRGB(255, 255, 255)
run.TextSize = 20.000
run.TextWrapped = true

scroll.Name = "scroll"
scroll.Parent = Main
scroll.Active = true
scroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scroll.BorderColor3 = Color3.fromRGB(50, 50, 50)
scroll.BorderSizePixel = 0
scroll.Position = UDim2.new(0.0398818962, 0, 0.113994852, 0)
scroll.Size = UDim2.new(0.917090476, 0, 0.723020852, 0)
scroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always
scroll.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

text.Name = "text"
text.Parent = scroll
text.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
text.BorderColor3 = Color3.fromRGB(40, 40, 40)
text.BorderSizePixel = 5
text.ClipsDescendants = true
text.Position = UDim2.new(0.0332336016, 0, -0.00785319507, 0)
text.Size = UDim2.new(0.943918347, 0, 2.58630061, 0)
text.ClearTextOnFocus = false
text.Font = Enum.Font.SourceSans
text.MultiLine = true
text.PlaceholderText = "Code here."
text.Text = "print(\"Hello World!\")"
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextSize = 16.000
text.TextWrapped = true
text.TextXAlignment = Enum.TextXAlignment.Left
text.TextYAlignment = Enum.TextYAlignment.Top

lines.Name = "lines"
lines.Parent = scroll
lines.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
lines.BackgroundTransparency = 1.000
lines.Position = UDim2.new(0, 0, 0.0120000001, 0)
lines.Size = UDim2.new(0.0299999993, 0, 0.0399999991, 0)
lines.SizeConstraint = Enum.SizeConstraint.RelativeXX
lines.Font = Enum.Font.SourceSans
lines.Text = "1"
lines.TextColor3 = Color3.fromRGB(255, 255, 255)
lines.TextSize = 16.000
lines.TextWrapped = true

showsc.Name = "showsc"
showsc.Parent = Main
showsc.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
showsc.BackgroundTransparency = 1.000
showsc.BorderColor3 = Color3.fromRGB(27, 42, 53)
showsc.BorderSizePixel = 0
showsc.Position = UDim2.new(0.457167506, 0, 0.840874672, 0)
showsc.Size = UDim2.new(0.153601706, 0, 0.159125388, 0)
showsc.Font = Enum.Font.SourceSans
showsc.Text = "Script control"
showsc.TextColor3 = Color3.fromRGB(255, 255, 255)
showsc.TextScaled = true
showsc.TextSize = 19.000
showsc.TextWrapped = true

round.CornerRadius = UDim.new(0.0250000004, 0)
round.Name = "round"
round.Parent = Main

SCTopbar.Name = "SCTopbar"
SCTopbar.Parent = Main
SCTopbar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SCTopbar.BorderColor3 = Color3.fromRGB(27, 42, 53)
SCTopbar.BorderSizePixel = 0
SCTopbar.Position = UDim2.new(0.60995841, 0, 0.999985933, 0)
SCTopbar.Size = UDim2.new(0.263052344, 0, 0.0987886339, 0)
SCTopbar.Visible = false

roundtop_2.CornerRadius = UDim.new(0.189999998, 0)
roundtop_2.Name = "roundtop"
roundtop_2.Parent = SCTopbar

Toggle_2.Name = "Toggle"
Toggle_2.Parent = SCTopbar
Toggle_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Toggle_2.BackgroundTransparency = 1.000
Toggle_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Toggle_2.BorderSizePixel = 0
Toggle_2.ClipsDescendants = true
Toggle_2.Position = UDim2.new(0.842283547, 0, 0, 0)
Toggle_2.Size = UDim2.new(0.157030046, 0, 0.761323869, 0)
Toggle_2.Font = Enum.Font.Code
Toggle_2.Text = "-"
Toggle_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle_2.TextScaled = true
Toggle_2.TextSize = 14.000
Toggle_2.TextWrapped = true

list.Name = "list"
list.Parent = SCTopbar
list.Active = true
list.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
list.BorderSizePixel = 0
list.Position = UDim2.new(0, 0, 2.0732336, 0)
list.Size = UDim2.new(1.00000012, 0, 9.51314735, 0)
list.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

Script1.Name = "Script1"
Script1.Parent = list
Script1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Script1.BackgroundTransparency = 1.000
Script1.BorderSizePixel = 0
Script1.Size = UDim2.new(0, 200, 0, 50)
Script1.Font = Enum.Font.SourceSans
Script1.Text = "Script1"
Script1.TextColor3 = Color3.fromRGB(255, 255, 255)
Script1.TextSize = 18.000
Script1.TextWrapped = true

layout.Name = "layout"
layout.Parent = list
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.CellSize = UDim2.new(1, 0, 0.174999997, 0)

Searchbar.Name = "Searchbar"
Searchbar.Parent = SCTopbar
Searchbar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Searchbar.BorderSizePixel = 0
Searchbar.Position = UDim2.new(0, 0, 0.919499993, 0)
Searchbar.Size = UDim2.new(1, 0, 1.15250003, 0)
Searchbar.Visible = false
Searchbar.ClearTextOnFocus = false
Searchbar.Font = Enum.Font.SourceSans
Searchbar.PlaceholderText = "Search (Ctrl + f)"
Searchbar.Text = ""
Searchbar.TextColor3 = Color3.fromRGB(255, 255, 255)
Searchbar.TextSize = 14.000

scripts.Name = "scripts"
scripts.Parent = Main
scripts.Active = true
scripts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scripts.BackgroundTransparency = 1.000
scripts.BorderSizePixel = 0
scripts.Position = UDim2.new(0, 0, 0.0271209404, 0)
scripts.Size = UDim2.new(1.00000036, 0, 0.0811959654, 0)
scripts.ScrollBarThickness = 2
scripts.VerticalScrollBarInset = Enum.ScrollBarInset.Always
scripts.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

scriptsSeparate.Name = "scriptsSeparate"
scriptsSeparate.Parent = scripts

scriptlist.Name = "scriptlist"
scriptlist.Parent = scriptsSeparate
scriptlist.FillDirection = Enum.FillDirection.Vertical
scriptlist.SortOrder = Enum.SortOrder.LayoutOrder
scriptlist.CellPadding = UDim2.new(0, 0, 1, 0)
scriptlist.CellSize = UDim2.new(0.150000006, 0, 0.0399999991, 0)

Script1_2.Name = "Script1"
Script1_2.Parent = scriptsSeparate
Script1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Script1_2.BackgroundTransparency = 1.000
Script1_2.BorderSizePixel = 0
Script1_2.Size = UDim2.new(0, 200, 0, 50)
Script1_2.Font = Enum.Font.SourceSans
Script1_2.Text = "Script1"
Script1_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Script1_2.TextSize = 18.000
Script1_2.TextWrapped = true

NSButton.Name = "NSButton"
NSButton.Parent = scripts
NSButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NSButton.BackgroundTransparency = 1.000
NSButton.Position = UDim2.new(0.14744927, 0, 0, 0)
NSButton.Size = UDim2.new(0.0441864133, 0, 0.985269904, 0)
NSButton.Font = Enum.Font.SourceSans
NSButton.Text = "+"
NSButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NSButton.TextSize = 18.000
NSButton.TextWrapped = true
-- Script --
run.MouseButton1Click:Connect(function()
	local t = {wtd = 1,code = text.Text}
	remote:FireServer(t)
end)
pr.MouseButton1Click:Connect(function()
	local t = {wtd = 2}
	remote:FireServer(t)
end)
clr.MouseButton1Click:Connect(function()
	text.Text = ""
end)
Toggle.MouseButton1Click:Connect(function()
if not gone then
for i,v in pairs(Main:GetDescendants()) do
if v.Parent ~= Topbar then
Main.BackgroundTransparency = 1
if v:IsA("TextButton") or v:IsA("TextBox") then
v.Visible = false
elseif v:IsA("ScrollingFrame") then
v.Visible = false
end
end
end
gone = true
else
for i,v in pairs(Main:GetDescendants()) do
if v.Parent ~= Topbar then
Main.BackgroundTransparency = 0
if v:IsA("TextButton") or v:IsA("TextBox") then
v.Visible = true
elseif v:IsA("ScrollingFrame") then
v.Visible = true
end
end
end
gone = false
end
end)
Topbar.InputBegan:Connect(function(input)
 if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
  draggable = true
  dragStart = input.Position
  startPos = Main.Position
  input.Changed:Connect(function()
   if input.UserInputState == Enum.UserInputState.End then
    draggable = false
   end
  end)
 end
end)
SCTopbar.InputBegan:Connect(function(input)
 if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
  draggable2 = true
  dragStart = input.Position
  startPos = SCTopbar.Position
  input.Changed:Connect(function()
   if input.UserInputState == Enum.UserInputState.End then
    draggable2 = false
   end
  end)
 end
end)
uis.InputChanged:Connect(function(input)
 if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
  if draggable then
 local delta = input.Position - dragStart
 Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,startPos.Y.Scale,startPos.Y.Offset + delta.Y)
  end
  if draggable2 then
  local delta = input.Position - dragStart
 SCTopbar.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,startPos.Y.Scale,startPos.Y.Offset + delta.Y)
  end
 end
end)
uis.InputBegan:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.LeftControl or inp.KeyCode == Enum.KeyCode.RightControl and not c then
ctrl = true
end
if inp.KeyCode == Enum.KeyCode.F and not c then
if Searchbar.Visible then
Searchbar:CaptureFocus()
end
end
end)
uis.InputEnded:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.LeftControl or inp.KeyCode == Enum.KeyCode.RightControl and not c then
ctrl = false
end
end)
Searchbar:GetPropertyChanged("Text"):Connect(function()
for i,v in pairs(list:GetChildren()) do
if v:IsA("TextLabel") then
if not string.find(string.lower(v.Text),Searchbar.Text) then
v.Visible = false
else
v.Visible = true
end
end
end
end)
Searchbar.FocusLost:Connect(function()
for i,v in pairs(list:GetChildren()) do
if v:IsA("TextLabel") then
if not string.find(string.lower(v.Text),Searchbar.Text) then
v.Visible = false
else
v.Visible = true
end
end
end
end)
showsc.Button1Click:Connect(function()
SCTopbar.Visible = not SCTopbar.Visible
Searchbar.Visible = SCTopbar.Visible
end)
rs.RenderStepped:Connect(function()
local hue = tick() % rbr / delay -- Returns the rest of the division of tick / res divided by delay
Credits.TextColor3 = Color3.fromHSV(hue,1,1)
end)]==],owner.PlayerGui)
-- UP TO DATE. --