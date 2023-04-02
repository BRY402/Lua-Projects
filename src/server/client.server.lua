NLS([==[local client = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local chs = Instance.new("Frame")
local list1 = Instance.new("Frame")
local walktp = Instance.new("Folder")
local nca = Instance.new("TextBox")
local nt = Instance.new("TextButton")
local vel = Instance.new("TextLabel")
local fling = Instance.new("Folder")
local fia = Instance.new("TextBox")
local int = Instance.new("TextLabel")
local ft = Instance.new("TextButton")
local Toggle1 = Instance.new("TextButton")
local Name1 = Instance.new("TextLabel")
local cas = Instance.new("Frame")
local list2 = Instance.new("Frame")
local aimbot = Instance.new("Folder")
local ama = Instance.new("TextBox")
local at = Instance.new("TextButton")
local mag = Instance.new("TextLabel")
local Toggle2 = Instance.new("TextButton")
local Name2 = Instance.new("TextLabel")
client.Parent = script
Background.Name = "Background"
Background.Parent = client
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 10.250
Background.BorderSizePixel = 0
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Visible = false
chs.Name = "chs"
chs.Parent = Background
chs.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
chs.BorderSizePixel = 0
chs.Position = UDim2.new(0.100000001, 0, 0.150000006, 0)
chs.Size = UDim2.new(0.201688558, 0, 0.0594059415, 0)
list1.Name = "list1"
list1.Parent = chs
list1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
list1.BorderSizePixel = 0
list1.Position = UDim2.new(0, 0, 1, 0)
list1.Size = UDim2.new(1, 0, 8.59399986, 0)
list1.Visible = false
walktp.Name = "walktp"
walktp.Parent = list1
nca.Name = "nca"
nca.Parent = walktp
nca.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
nca.BorderColor3 = Color3.fromRGB(40, 40, 40)
nca.BorderSizePixel = 2
nca.Position = UDim2.new(0.0139999744, 1, 0.239999995, 0)
nca.Size = UDim2.new(0.958117843, 0, 0.118235342, 0)
nca.Font = Enum.Font.SourceSans
nca.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
nca.Text = "16"
nca.TextColor3 = Color3.fromRGB(255, 255, 255)
nca.TextScaled = true
nca.TextSize = 14.000
nca.TextWrapped = true
nt.Name = "nt"
nt.Parent = walktp
nt.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
nt.BackgroundTransparency = 1.000
nt.BorderColor3 = Color3.fromRGB(0, 0, 0)
nt.BorderSizePixel = 0
nt.Position = UDim2.new(0, 0, 2.95919413e-08, 0)
nt.Size = UDim2.new(1, 0, 0.124117553, 0)
nt.Font = Enum.Font.SourceSans
nt.Text = "WalkTp (off)"
nt.TextColor3 = Color3.fromRGB(255, 255, 255)
nt.TextScaled = true
nt.TextSize = 14.000
nt.TextWrapped = true
vel.Name = "vel"
vel.Parent = walktp
vel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vel.BackgroundTransparency = 1.000
vel.Position = UDim2.new(0, 0, 0.123999998, 0)
vel.Size = UDim2.new(0.418604642, 0, 0.0971139893, 0)
vel.Font = Enum.Font.SourceSans
vel.Text = "Speed:"
vel.TextColor3 = Color3.fromRGB(255, 255, 255)
vel.TextScaled = true
vel.TextSize = 14.000
vel.TextWrapped = true
fling.Name = "fling"
fling.Parent = list1
fia.Name = "fia"
fia.Parent = fling
fia.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
fia.BorderColor3 = Color3.fromRGB(40, 40, 40)
fia.BorderSizePixel = 2
fia.Position = UDim2.new(0.0139999744, 1, 0.74000001, 0)
fia.Size = UDim2.new(0.958117843, 0, 0.118235342, 0)
fia.Font = Enum.Font.SourceSans
fia.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
fia.Text = "1"
fia.TextColor3 = Color3.fromRGB(255, 255, 255)
fia.TextScaled = true
fia.TextSize = 14.000
fia.TextWrapped = true
int.Name = "int"
int.Parent = fling
int.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
int.BackgroundTransparency = 1.000
int.Position = UDim2.new(0, 0, 0.624000013, 0)
int.Size = UDim2.new(0.418604642, 0, 0.0971139893, 0)
int.Font = Enum.Font.SourceSans
int.Text = "Intensity: "
int.TextColor3 = Color3.fromRGB(255, 255, 255)
int.TextScaled = true
int.TextSize = 14.000
int.TextWrapped = true
ft.Name = "ft"
ft.Parent = fling
ft.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ft.BackgroundTransparency = 1.000
ft.BorderColor3 = Color3.fromRGB(0, 0, 0)
ft.BorderSizePixel = 0
ft.Position = UDim2.new(0, 0, 0.50000006, 0)
ft.Size = UDim2.new(1, 0, 0.124117553, 0)
ft.Font = Enum.Font.SourceSans
ft.Text = "Fling (off)"
ft.TextColor3 = Color3.fromRGB(255, 255, 255)
ft.TextScaled = true
ft.TextSize = 14.000
ft.TextWrapped = true
Toggle1.Name = "Toggle1"
Toggle1.Parent = chs
Toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle1.BackgroundTransparency = 1.000
Toggle1.Position = UDim2.new(0.835277736, 0, 0, 0)
Toggle1.Size = UDim2.new(0.164722383, 0, 1.00000012, 0)
Toggle1.Font = Enum.Font.SourceSans
Toggle1.Text = "+"
Toggle1.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle1.TextScaled = true
Toggle1.TextSize = 14.000
Toggle1.TextWrapped = true
Name1.Name = "Name1"
Name1.Parent = chs
Name1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name1.BackgroundTransparency = 1.000
Name1.Selectable = true
Name1.Size = UDim2.new(0.835277975, 0, 0.990099251, 0)
Name1.Font = Enum.Font.SourceSans
Name1.Text = "Character related scripts"
Name1.TextColor3 = Color3.fromRGB(255, 255, 255)
Name1.TextScaled = true
Name1.TextSize = 14.000
Name1.TextWrapped = true
cas.Name = "cas"
cas.Parent = Background
cas.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
cas.BorderSizePixel = 0
cas.Position = UDim2.new(0.349999994, 0, 0.150000006, 0)
cas.Size = UDim2.new(0.201688558, 0, 0.0594059415, 0)
list2.Name = "list2"
list2.Parent = cas
list2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
list2.BorderSizePixel = 0
list2.Position = UDim2.new(0, 0, 1, 0)
list2.Size = UDim2.new(1, 0, 4.26666689, 0)
list2.Visible = false
aimbot.Name = "aimbot"
aimbot.Parent = list2
ama.Name = "ama"
ama.Parent = aimbot
ama.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ama.BorderColor3 = Color3.fromRGB(40, 40, 40)
ama.BorderSizePixel = 2
ama.Position = UDim2.new(0.0140000004, 1, 0.538999975, 0)
ama.Size = UDim2.new(0.958117843, 0, 0.26562497, 0)
ama.Font = Enum.Font.SourceSans
ama.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
ama.Text = "30"
ama.TextColor3 = Color3.fromRGB(255, 255, 255)
ama.TextScaled = true
ama.TextSize = 14.000
ama.TextWrapped = true
at.Name = "at"
at.Parent = aimbot
at.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
at.BackgroundTransparency = 1.000
at.BorderColor3 = Color3.fromRGB(0, 0, 0)
at.BorderSizePixel = 0
at.Size = UDim2.new(1, 0, 0.25, 0)
at.Font = Enum.Font.SourceSans
at.Text = "Aimbot (off)"
at.TextColor3 = Color3.fromRGB(255, 255, 255)
at.TextScaled = true
at.TextSize = 14.000
at.TextWrapped = true
mag.Name = "mag"
mag.Parent = aimbot
mag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mag.BackgroundTransparency = 1.000
mag.Position = UDim2.new(0, 0, 0.234375, 0)
mag.Size = UDim2.new(0.835277617, 0, 0.240624964, 0)
mag.Font = Enum.Font.SourceSans
mag.Text = "Maximum distance:"
mag.TextColor3 = Color3.fromRGB(255, 255, 255)
mag.TextScaled = true
mag.TextSize = 14.000
mag.TextWrapped = true
Toggle2.Name = "Toggle2"
Toggle2.Parent = cas
Toggle2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle2.BackgroundTransparency = 1.000
Toggle2.Position = UDim2.new(0.835277736, 0, 0, 0)
Toggle2.Size = UDim2.new(0.164722383, 0, 1.00000012, 0)
Toggle2.Font = Enum.Font.SourceSans
Toggle2.Text = "+"
Toggle2.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle2.TextScaled = true
Toggle2.TextSize = 14.000
Toggle2.TextWrapped = true
Name2.Name = "Name2"
Name2.Parent = cas
Name2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name2.BackgroundTransparency = 1.000
Name2.Selectable = true
Name2.Size = UDim2.new(0.835277975, 0, 0.990099251, 0)
Name2.Font = Enum.Font.SourceSans
Name2.Text = "Camera related scripts"
Name2.TextColor3 = Color3.fromRGB(255, 255, 255)
Name2.TextScaled = true
Name2.TextSize = 14.000
Name2.TextWrapped = true
local nc = false
local fl = false
local amv = false
Toggle1.MouseButton1Click:Connect(function()
	list1.Visible = not list1.Visible
	if list1.Visible then
		Toggle1.Text = "-"
	elseif list1.Visible == false then
		Toggle1.Text = "+"
	end
end)
Toggle2.MouseButton1Click:Connect(function()
	list2.Visible = not list2.Visible
	if list2.Visible then
		Toggle2.Text = "-"
	elseif list2.Visible == false then
		Toggle2.Text = "+"
	end
end)
nt.MouseButton1Click:Connect(function()
nc = not nc
if nc == true then
nt.Text = "WalkTp (on)"
else
nt.Text = "WalkTp (off)"
end
end)
ft.MouseButton1Click:Connect(function()
fl = not fl
if fl == true then
lp = owner.Character.HumanoidRootPart.CFrame
if owner.Character:FindFirstChild("HumanoidRootPart") then
local t = Instance.new("Torque",owner.Character.HumanoidRootPart)
local at = Instance.new("Attachment",owner.Character.HumanoidRootPart)
t.Name = "FlingTorque"
at.Name = "FlingTorqueAttachment0"
t.Attachment0 = at
t.RelativeTo = Enum.ActuatorRelativeTo.World
if tonumber(fia.Text) ~= nil then
t.Torque = Vector3.new(0,fia.Text * 50000000,0)
else
t.Torque = Vector3.new(0,50000000,0)
end
end
ft.Text = "Fling (on)"
else
if owner.Character:FindFirstChild("HumanoidRootPart") then
if owner.Character.HumanoidRootPart:FindFirstChild("FlingTorque") then
owner.Character.HumanoidRootPart.FlingTorque:Destroy()
end
if owner.Character.HumanoidRootPart:FindFirstChild("FlingTorqueAttachment0") then
owner.Character.HumanoidRootPart.FlingTorqueAttachment0:Destroy()
end
end
ft.Text = "Fling (off)"
end
end)
at.MouseButton1Click:Connect(function()
amv = not amv
if amv then
at.Text = "Aimbot (on)"
else
at.Text = "Aimbot (off)"
end
end)
local dragging1 = false
local dragging2 = false
chs.InputBegan:Connect(function(input)
 if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
  dragging1 = true
  dragStart1 = input.Position
  startPos1 = chs.Position
  input.Changed:Connect(function()
   if input.UserInputState == Enum.UserInputState.End then
    dragging1 = false
   end
  end)
 end
end)
cas.InputBegan:Connect(function(input)
 if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
  dragging2 = true
  dragStart2 = input.Position
  startPos2 = cas.Position
  input.Changed:Connect(function()
   if input.UserInputState == Enum.UserInputState.End then
    dragging2 = false
   end
  end)
 end
end)
local uis = game:GetService("UserInputService")
uis.InputChanged:Connect(function(input)
 if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
  if dragging1 then
 local add = input.Position - dragStart1
 chs.Position = UDim2.new(startPos1.X.Scale, startPos1.X.Offset + add.X,startPos1.Y.Scale,startPos1.Y.Offset + add.Y)
  elseif dragging2 then
   local add = input.Position - dragStart2
 cas.Position = UDim2.new(startPos2.X.Scale, startPos2.X.Offset + add.X,startPos2.Y.Scale,startPos2.Y.Offset + add.Y)
  end
  end
end)
uis.InputBegan:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.LeftControl or inp.KeyCode == Enum.KeyCode.RightControl and not c then
ctrl = true
end
if inp.KeyCode == Enum.KeyCode.P and ctrl and not c then
Background.Visible = not Background.Visible
end
end)
uis.InputEnded:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.LeftControl or inp.KeyCode == Enum.KeyCode.RightControl and not c then
ctrl = false
end
end)
game:GetService("RunService").RenderStepped:Connect(function(d)
if owner.Character and owner.Character:FindFirstChild("HumanoidRootPart") and owner.Character:FindFirstChildOfClass("Humanoid") and nc and tonumber(nca.Text) ~= nil then
owner.Character.PrimaryPart = owner.Character.HumanoidRootPart
if owner.Character.Humanoid.SeatPart == nil then
local move = owner.Character.Humanoid.MoveDirection
local cf = CFrame.new(owner.Character.HumanoidRootPart.Position + (move + move * d) * (nca.Text / 16)) * owner.Character.HumanoidRootPart.CFrame.Rotation
owner.Character:PivotTo(cf)
elseif owner.Character.Humanoid.SeatPart.Anchored == false and owner.Character.Humanoid.SeatPart:GetNetworkOwner() == owner then
local move = owner.Character.Humanoid.MoveDirection
local cf = CFrame.new(owner.Character.HumanoidRootPart.Position + (move + move * d) * (nca.Text / 16)) * owner.Character.HumanoidRootPart.CFrame.Rotation
owner.Character:PivotTo(cf)
end
end
if owner.Character:FindFirstChild("HumanoidRootPart") and owner.Character.HumanoidRootPart:FindFirstChild("FlingTorque") then
   pcall(function()
       local hrp = owner.Character.HumanoidRootPart
       if hrp.AssemblyLinearVelocity.Magnitude > 50 then
           hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
           hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
           hrp.CFrame = lp
       elseif hrp.AssemblyLinearVelocity.Magnitude < 50 then
           lp = hrp.CFrame
       end
   end)
owner.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(math.huge,0,0)
local t = owner.Character.HumanoidRootPart.FlingTorque
if tonumber(fia.Text) ~= nil then
t.Torque = Vector3.new(0,fia.Text * 50000000,0)
else
t.Torque = Vector3.new(0,50000000,0)
end
end
if amv and tonumber(ama.Text) ~= nil then
local max = ama.Text
workspace.CurrentCamera.CameraType = "Track"
	local closest = nil
	local closemag = math.huge
	for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
	if v ~= owner and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and owner.Character and owner.Character:FindFirstChild("HumanoidRootPart") then
	local mag = (v.Character.HumanoidRootPart.Position - owner.Character.HumanoidRootPart.Position).magnitude
	if mag < 50 and mag < closemag then
	closemag = mag
	closest = v
	end
	end
	if v ~= owner and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and workspace.CurrentCamera.CameraSubject and workspace.CurrentCamera.CameraSubject:IsA("BasePart") then
	local mag = (v.Character.HumanoidRootPart.Position - workspace.CurrentCamera.CameraSubject.Position).magnitude
	if mag < 50 and mag < closemag then
	closemag = mag
	closest = v
	end
	end
	end
	if closest then
	workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position,closest.Character.HumanoidRootPart.Position)
end
end
end)]==],owner.PlayerGui)