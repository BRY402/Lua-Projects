-- This is a literal copy from TN lol
local function newid()
return game:GetService("HttpService"):GenerateGUID(false)
end
warn("Copied from some TN guy i forgot the username but if you're him i'm sorry lol.")
local char = Instance.new("Model",script)
local ball = Instance.new("SpawnLocation",char)
--local h = Instance.new("Highlight",script)
local ts = game:GetService("TweenService")
local chat = game:GetService("Chat")
local deb = game:GetService("Debris")
local scriptid = newid()
local info = TweenInfo.new(1.5,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
local delay = 3
local rbr = 3
local function tct(str,l)
  if l == true then
  str = string.lower(str)
  end
  if string.lower(string.sub(str,0,3)) == "/e " then
  return string.sub(str,4,#str),true
  else
  return str,false
  end
  end
  local function newball(cf,vel)
  deb:AddItem(ball,0)
  local ball = Instance.new("SpawnLocation",char)
  ball.Shape = "Ball"
ball.Material = "SmoothPlastic"
ball.Locked = true
ball.Enabled = false
ball.CanTouch = false
ball.CanQuery = false
ball.Size = Vector3.new(2.5,2.5,2.5)
ball.Name = "Main"
ball:SetNetworkOwner(owner)
ball.CFrame = cf
ball.Velocity = vel
  return ball
  end
script.Name = "fcs"..scriptid
char.Name = "BallChar"
ball.Shape = "Ball"
ball.Material = "SmoothPlastic"
ball.Locked = true
ball.Enabled = false
ball.CanTouch = false
ball.CanQuery = false
ball.Size = Vector3.new(2.5,2.5,2.5)
ball.Name = "Main"
ball:SetNetworkOwner(owner)
--[[h.Name = "BH"
h.Adornee = ball
h.FillTransparency = 1
h.DepthMode = 1
h.OutlineColor = Color3.fromHSV(0,0,0)]]
if owner.Character and owner.Character:FindFirstChild("HumanoidRootPart") then
ball.CFrame = owner.Character.HumanoidRootPart.CFrame
end
owner.Character = nil
  owner.Chatted:Connect(function(msg)
  local msg2,can2 = tct(msg)
  local msg,can = tct(msg,true)
  if can2 == false and ball.Parent == char then
  chat.BubbleChatEnabled = true
  chat:Chat(ball,msg2)
  end
  if string.sub(msg,0,#"-size ") == "-size " then
  local size = string.sub(msg,#"-size " + 1,#msg)
  res = {Size = Vector3.new(size,size,size)}
local resize = ts:Create(ball,info,res)
resize:Play()
end
end)
NLS([==[local sc = workspace:WaitForChild("]==]..script.Name..[==[")
  if sc then
    print("Found script.")
  end
  local function tct(str)
  if string.lower(string.sub(str,0,3)) == "/e " then
  return string.lower(string.sub(str,4,#str))
  else
  return string.lower(str)
  end
  end
  local ball = sc.BallChar.Main
  print("Script id: "..string.sub(sc.Name,4,#sc.Name))
  local camera = workspace.CurrentCamera
  local uis = game:GetService("UserInputService")
  local rs = game:GetService("RunService")
  local ray = RaycastParams.new()
  local speed = 5 --math.rad(90)
  local jp = 50
  local hw = false
  local hs = false
  local ha = false
  local hd = false
  local hsp = false
  ray.FilterType = Enum.RaycastFilterType.Blacklist
  ray.FilterDescendantsInstances = {owner.Character, gun}
  ray.IgnoreWater = false
  local function spin(part,rot)
  part.RotVelocity = part.RotVelocity + rot
  end
  uis.InputBegan:Connect(function(inp,c)
  if inp.KeyCode == Enum.KeyCode.W and not c then
  spin(ball,-camera.CFrame.rightVector * speed)
  hw = true
  elseif inp.KeyCode == Enum.KeyCode.A and not c then
  spin(ball,-camera.CFrame.lookVector * speed)
  ha = true
  elseif inp.KeyCode == Enum.KeyCode.S and not c then
  spin(ball,camera.CFrame.rightVector * speed)
  hs = true
  elseif inp.KeyCode == Enum.KeyCode.D and not c then
  spin(ball,camera.CFrame.lookVector * speed)
  hd = true
  elseif inp.KeyCode == Enum.KeyCode.Space and not c then
  local result = workspace:Raycast(ball.Position,Vector3.new(0,-ball.Size.Y - .05,0))
  if result ~= nil and result.Instance.CanCollide then
  ball.Velocity = Vector3.new(ball.Velocity.X,jp,ball.Velocity.Z)
  end
  hsp = true
  end
  end)
  uis.InputEnded:Connect(function(inp,c)
  if inp.KeyCode == Enum.KeyCode.W and not c then
  hw = false
  elseif inp.KeyCode == Enum.KeyCode.A and not c then
  ha = false
  elseif inp.KeyCode == Enum.KeyCode.S and not c then
  hs = false
  elseif inp.KeyCode == Enum.KeyCode.D and not c then
  hd = false
  elseif inp.KeyCode == Enum.KeyCode.Space and not c then
  hsp = false
  end
  end)
  owner.Chatted:Connect(function(msg)
  local msg = tct(msg)
  if string.sub(msg,0,#"-grav ") == "-grav " then
  if string.sub(msg,#"-grav " + 1,#msg) == "fix" then
  workspace.Gravity = 196.1999969482422
  elseif tonumber(string.sub(msg,#"-grav " + 1,#msg)) then
  workspace.Gravity = string.sub(msg,#"-grav " + 1,#msg)
  end
  elseif string.sub(msg,0,#"-speed ") == "-speed " then
  speed = string.sub(msg,#"-speed " + 1,#msg)
  elseif string.sub(msg,0,#"-jp ") == "-jp " then
  jp = string.sub(msg,#"-jp " + 1,#msg)
  end
  end)
  rs.RenderStepped:Connect(function()
  camera = workspace.CurrentCamera
  camera.CameraSubject = ball
  local s,f = pcall(function()
  ball = sc.BallChar.Main
  end)
  if hw then
  spin(ball,-camera.CFrame.rightVector * speed)
  end
  if ha then
  spin(ball,-camera.CFrame.lookVector * speed)
  end
  if hs then
  spin(ball,camera.CFrame.rightVector * speed)
  end
  if hd then
  spin(ball,camera.CFrame.lookVector * speed)
  end
  if hsp then
  local result = workspace:Raycast(ball.Position,Vector3.new(0,-ball.Size.Y - .05,0))
  if result ~= nil and result.Instance.CanCollide then
  ball.Velocity = Vector3.new(ball.Velocity.X,jp,ball.Velocity.Z)
  end
  end
  if not hw and not ha and not hs and not hd then
  ball.RotVelocity = Vector3.new()
  end
  if ball.Position.Y - ball.Size.Y / 2 <= -50 then
  ball.Position = Vector3.new(0,50 + ball.Size.Y,20)
  end
  end)]==],owner.PlayerGui)
while task.wait() do
  owner.Character = nil
  ball.Anchored = false
    if ball.Parent == char and char.Parent == script and script.Parent == workspace and ball.Anchored == false and ball:GetNetworkOwner() ~= owner then
        ball:SetNetworkOwner(owner)
	end
	if script:FindFirstAncestorOfClass("Workspace") ~= true and char.Parent ~= script then
	char = Instance.new("Model",script)
	char.Name = "BallChar"
	local olcf = ball.CFrame
	local ovel = ball.Velocity
	ball = newball(olcf,ovel)
	elseif ball.Parent ~= char then
	local olcf = ball.CFrame
	local ovel = ball.Velocity
	ball = newball(olcf,ovel)
	end
	ball.CustomPhysicalProperties = PhysicalProperties.new(math.huge,math.huge,0)
	ball.Locked = true
ball.CanTouch = false
ball.CanQuery = false
--local hue = tick() % rbr / delay -- Returns division leftovers of resolution / delay
--h.OutlineColor = Color3.fromHSV(hue,1,1)
end