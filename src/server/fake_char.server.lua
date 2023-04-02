script.Name = "BFC"
local r = Instance.new("RemoteEvent",owner.PlayerGui)
local ts = game:GetService("TweenService")
local mode = 1
local rs = game:GetService("RunService")
local v3n = Vector3.new
local cfn = CFrame.new
local cfla = CFrame.lookAt
local cfang = CFrame.Angles
local mrad = math.rad
local ray = RaycastParams.new()
local http = game:GetService("HttpService")
local d = game:GetService("Debris")
local char = Instance.new("WorldModel",script)
local canc = true
if owner.Character then
local hrp = owner.Character:FindFirstChild("HumanoidRootPart")
if hrp then
char:PivotTo(hrp.CFrame)
end
end
local fc = {fake = char,bps = {},cons = {},crs = {}}
local bl = {workspace:FindFirstChild("Base"),wd = {}}
local info = TweenInfo.new(.05,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
local info2 = TweenInfo.new(.75,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
local info3 = TweenInfo.new(1.25,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
function fc:mbp(name,size,pos,ori,trans)
local bp = Instance.new("SpawnLocation",self.fake)
local r = Instance.new("RemoteEvent",bp)
table.insert(self.crs,r)
r.Name = name
bp.Material = "SmoothPlastic"
bp.Enabled = false
bp.Name = name
bp.Color = Color3.new(1,1,1)
bp.Anchored = true
bp.Size = size
bp.Position = pos
bp.Orientation = ori
bp.Transparency = trans
fc.bps[bp.Name] = size
fc.bps[bp.Name.."2"] = trans
return bp
end
local cn = false
local hw = false
local ha = false
local hs = false
local hd = false
local speed,ram,sa,g,y,wan,add,spinvel,vel = 1,0,0,1,3,0,.01,1.5,1.5
ray.FilterDescendantsInstances = {char}
function fc:makechar(cf,ori)
table.clear(fc.bps)
local char = Instance.new("WorldModel",script)
self.fake = char
local hum = Instance.new("Humanoid",char)
local hrp = fc:mbp("HumanoidRootPart",v3n(2,2,1),cf.Position,ori,1)
local t = fc:mbp("Torso",v3n(2,2,1),v3n(cf.X,cf.Y + math.sin(os.clock()) / 3,cf.Z),hrp.Orientation,0)
local pos = t.Position
local ori = t.Orientation
local h = fc:mbp("Head",v3n(2,1,1),pos + t.CFrame.upVector * 1.5,t.Orientation,0)
local hm = Instance.new("SpecialMesh",h)
local ra = fc:mbp("Right Arm",v3n(1,2,1),((pos + t.CFrame.lookVector * .875) + (t.CFrame.rightVector * -.53)) + v3n(0,.3 + math.sin(os.clock() * 1.5) / 12,0),v3n(ori.X,ori.Y,82.5),0)
local la = fc:mbp("Left Arm",v3n(1,2,1),((pos + t.CFrame.lookVector * .875) + (t.CFrame.rightVector * .53)) + v3n(0,.3 + math.sin(os.clock() * 1.5) / 12,0),v3n(ori.X,ori.Y,-82.5),0)
local rl = fc:mbp("Right Leg",v3n(1,2,1),(pos + t.CFrame.upVector * -1.45) + (t.CFrame.rightVector * .5),v3n(ori.X + -35,ori.Y,ori.Z),0)
local ll = fc:mbp("Left Leg",v3n(1,2,1),(pos + t.CFrame.upVector * -1.75) + (t.CFrame.rightVector * -.5),v3n(ori.X + -7.5,ori.Y,ori.Z),0)
hm.MeshType = "Head"
hm.Scale = v3n(1.25,1.25,1.25)
hum.HealthDisplayType = 2
hum.MaxHealth = 0
hum.Health = 0
hum.DisplayName = 2/wait()--string.rep(" ",math.random(50,150))
char.PrimaryPart = hrp
char:PivotTo(cf)
char.Name = http:GenerateGUID(false)
return char,h,hm,t,hrp,ra,la,rl,ll,hum
end
local char,h,hm,t,hrp,ra,la,rl,ll,hum = fc:makechar(char.WorldPivot,v3n())
r.Name = "FCWE"
NLS([==[local sc = workspace.BFC
local cf = CFrame.new()
local rot = workspace.CurrentCamera.CFrame.Rotation
local m = owner:GetMouse()
local r = owner.PlayerGui.FCWE
local mode = 1
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local hw = false
local ha = false
local hs = false
local hd = false
print([[-- Keybinds --
-- Attacks --
T: Area attack
F: Small area attack
-- Moving --
K: Tp to mouse location
-- Switching --
E: Switch mode add
Q: Switch mode subtract]])
workspace.CurrentCamera.CameraSubject = sc:FindFirstChildOfClass("WorldModel"):FindFirstChildOfClass("Humanoid")
r:FireServer({"ROT",workspace.CurrentCamera.CFrame.Rotation},owner)
uis.InputBegan:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.W and not c then
hw = true
r:FireServer({"W",true},owner)
while hw do
r:FireServer({"W",true},owner)
task.wait()
end
elseif inp.KeyCode == Enum.KeyCode.A and not c then
ha = true
r:FireServer({"A",true},owner)
while ha do
r:FireServer({"A",true},owner)
task.wait()
end
elseif inp.KeyCode == Enum.KeyCode.S and not c then
hs = true
r:FireServer({"S",true},owner)
while hs do
r:FireServer({"S",true},owner)
task.wait()
end
elseif inp.KeyCode == Enum.KeyCode.D and not c then
hd = true
r:FireServer({"D",true},owner)
while hd do
r:FireServer({"D",true},owner)
task.wait()
end
elseif inp.KeyCode == Enum.KeyCode.T and not c then
r:FireServer({"AT",m.Hit.Position},owner)
elseif inp.KeyCode == Enum.KeyCode.F and not c then
r:FireServer({"AT2",m.Hit.Position},owner)
elseif inp.KeyCode == Enum.KeyCode.K and not c then
r:FireServer({"TP",m.Hit.Position},owner)
elseif inp.KeyCode == Enum.KeyCode.E and not c then
r:FireServer({"SMA",mode},owner)
elseif inp.KeyCode == Enum.KeyCode.Q and not c then
r:FireServer({"SMS",mode},owner)
end
end)
uis.InputEnded:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.W and not c then
hw = false
r:FireServer({"W",false},owner)
elseif inp.KeyCode == Enum.KeyCode.A and not c then
ha = false
r:FireServer({"A",false},owner)
elseif inp.KeyCode == Enum.KeyCode.S and not c then
hs = false
r:FireServer({"S",false},owner)
elseif inp.KeyCode == Enum.KeyCode.D and not c then
hd = false
r:FireServer({"D",false},owner)
end
end)
workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
local olrot = rot
rot = workspace.CurrentCamera.CFrame.Rotation
if olrot ~= rot then
r:FireServer({"ROT",workspace.CurrentCamera.CFrame.Rotation},owner)
end
end)
rs.RenderStepped:Connect(function()
local char = sc:FindFirstChildOfClass("WorldModel")
if char then
cf = workspace.CurrentCamera.CFrame
workspace.CurrentCamera.CameraSubject = char:FindFirstChildOfClass("Humanoid")
else
workspace.CurrentCamera.CFrame = cf
end
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(plr,typ)
if cn == false then
cn = true
end
local cf = char.WorldPivot
if mode == 1 then
speed = .25
local re = workspace:Raycast(cf.Position,cf.upVector * -4,ray)
if re then
y = re.Position.Y + 3
else
y -= 1
end
elseif mode == 2 then
speed = 1
y = cf.Position.Y
end
if typ[1] == "W" then
if typ[2] == true then
hw = true
local ang = t.CFrame.Rotation
char:PivotTo(CFrame.new(v3n(cf.Position.X,y,cf.Position.Z) + cf.lookVector * speed) * ang)
else
hw = false
end
elseif typ[1] == "A" then
if typ[2] == true then
ha = true
local ang = t.CFrame.Rotation
char:PivotTo(CFrame.new(v3n(cf.Position.X,y,cf.Position.Z) + cf.rightVector * -speed) * ang)
else
ha = false
end
elseif typ[1] == "S" then
if typ[2] == true then
hs = true
local ang = t.CFrame.Rotation
char:PivotTo(CFrame.new(v3n(cf.Position.X,y,cf.Position.Z) + cf.lookVector * -speed) * ang)
else
hs = false
end
elseif typ[1] == "D" then
if typ[2] == true then
hd = true
local ang = t.CFrame.Rotation
char:PivotTo(CFrame.new(v3n(cf.Position.X,y,cf.Position.Z) + cf.rightVector * speed) * ang)
else
hd = false
end
elseif typ[1] == "ROT" then
if mode == 1 then
local x,y2,z = typ[2]:ToOrientation()
char:PivotTo(CFrame.new(v3n(cf.Position.X,y,cf.Position.Z)) * cfang(0,y2,0))
elseif mode == 2 then
char:PivotTo(CFrame.new(v3n(cf.Position.X,y,cf.Position.Z)) * typ[2])
end
elseif typ[1] == "SMA" then
mode += 1
mode = math.clamp(mode,1,2)
elseif typ[1] == "SMS" then
mode -= 1
mode = math.clamp(mode,1,2)
elseif typ[1] == "TP" then
local tm = NS("",workspace)
tm.Disabled = true
table.foreach(char:GetDescendants(),function(x,v)
if v:IsA("BasePart") then
local ov = v
local v = Instance.new("SpawnLocation",am)
v.Name = ov.Name
if v.Name == "HumanoidRootPart" then
local s = Instance.new("Sound",v)
s.SoundId = "rbxassetid://9022476960"
s.PlayOnRemove = true
v.Transparency = 1
d:AddItem(s,0)
elseif v.Name == "Head" then
local m = Instance.new("SpecialMesh",v)
m.Scale = v3n(1.25,1.25,1.25)
m.MeshType = "Head"
end
v.Parent = tm
v.Enabled = false
v.Size = ov.Size
v.CanCollide = false
v.CFrame = ov.CFrame
v.Color = Color3.new(1,1,1)
v.Anchored = true
v.Material = "Neon"
local fd = {Transparency = 1}
local pt1 = ts:Create(v,info2,fd)
pt1:Play()
end
end)
d:AddItem(tm,.75)
char:PivotTo(CFrame.new(typ[2] + v3n(0,3,0)) * char.WorldPivot.Rotation)
elseif typ[1] == "AT" then
bl[1] = workspace:FindFirstChild("Base")
local am = NS("",workspace)
local p = Instance.new("Part",am)
local e = Instance.new("Part",am)
local s = Instance.new("Sound",e)
table.insert(bl,p)
table.insert(bl,e)
local ds1 = {Size = v3n(1024,10,10)}
local ds2 = {Size = v3n(50,50,50)}
local dp = {Position = typ[2] + v3n(0,512,0)}
local fd = {Transparency = 1}
local att1 = ts:Create(p,info,ds1)
local att2 = ts:Create(e,info,ds2)
local att3 = ts:Create(p,info,dp)
local att4 = ts:Create(p,info2,fd)
local att5 = ts:Create(e,info2,fd)
local atc = true
p.Anchored = true
p.CanCollide = false
p.Material = "Neon"
p.Shape = "Cylinder"
p.Locked = true
p.Orientation = v3n(0,0,90)
p.Color = Color3.new(1,1,1)
p.Size = v3n(0,17.5,17.5)
p.Position = typ[2] + v3n(0,1024,0)
e.Anchored = true
e.CanCollide = false
e.Material = "Neon"
e.Locked = true
e.Shape = "Ball"
e.Size = v3n(0,0,0)
e.Color = Color3.new(1,1,1)
e.Position = typ[2]
s.Volume = 5
s.Pitch = math.random(1,1.75)
s.SoundId = "rbxassetid://2648568095"
am.Disabled = true
att1:Play()
att3:Play()
task.wait(.2)
att2:Play()
task.spawn(function()
while task.wait() do
if atc then
for x,v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and not table.find(bl,v) and (v.Position - e.Position).magnitude - (v.Size.X + v.Size.Y + v.Size.Z) / 2.5 <= e.Size.X / 1.5 then
d:AddItem(v,0)
end
task.wait()
end
end
end
end)
s:Play()
task.wait(.62)
att4:Play()
att5:Play()
task.wait(.75)
atc = false
d:AddItem(am,0)
elseif typ[1] == "AT2" then
bl[1] = workspace:FindFirstChild("Base")
local am = NS("",workspace)
local p = Instance.new("Part",am)
table.insert(bl,p)
local ds1 = {Size = v3n(5,5,5)}
local fd = {Transparency = 1}
local atc = true
p.Anchored = true
p.CanCollide = false
p.Material = "Neon"
p.Locked = true
p.Color = Color3.new(1,1,1)
p.Size = v3n(1,1,4)
p.CFrame = cfla(char.WorldPivot.Position,typ[2])
p.CFrame = cfn(p.Position + p.CFrame.lookVector * 2) * p.CFrame.Rotation
am.Disabled = true
repeat
p.Position += p.CFrame.lookVector * 3
task.wait()
until (p.Position - typ[2]).magnitude <= 4
d:AddItem(p,0)
local e = Instance.new("Part",am)
local s = Instance.new("Sound",e)
local att2 = ts:Create(e,info2,ds1)
local att3 = ts:Create(e,info3,fd)
table.insert(bl,e)
e.Anchored = true
e.CanCollide = false
e.Material = "Neon"
e.Locked = true
e.Shape = "Ball"
e.Size = v3n(5,5,5)
e.Color = Color3.new(1,1,1)
e.Position = typ[2]
s.SoundId = "rbxassetid://7093763783"
s.Volume = 2.5
att2:Play()
s:Play()
task.spawn(function()
while task.wait() do
if atc then
for x,v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and not table.find(bl,v) and (v.Position - e.Position).magnitude - (v.Size.X + v.Size.Y + v.Size.Z) / 2.25 <= e.Size.X / 1.75 then
d:AddItem(v,0)
end
end
end
end
end)
task.wait(.2)
att3:Play()
task.wait(1.25)
atc = false
d:AddItem(am,0)
end
end)
coroutine.resume(coroutine.create(function()
while task.wait() do
task.spawn(function()
owner.Character = nil
hum.HealthDisplayType = 2
hum.MaxHealth = 0
hum.Health = 0
for i,v in pairs(script:GetDescendants()) do
if v:IsA("BasePart") then
v.Anchored = true
if v ~= hrp then
v.Transparency = 0
v.Material = "SmoothPlastic"
v.Color = Color3.new(1,1,1)
end
local s = fc.bps[v.Name]
local s2 = fc.bps[v.Name..2]
if s then
v.Size = fc.bps[v.Name]
end
if s2 then
v.Transparency = fc.bps[v.Name.."2"]
end
end
if v ~= char and v ~= h and v ~= hm and v ~= t and v ~= hrp and v ~= ra and v ~= la and v ~= rl and v ~= ll and v ~= hum and table.find(fc.crs,v) == nil then
d:AddItem(v,0)
end
task.wait()
end
end)
if char.Parent == nil then
char,h,hm,t,hrp,ra,la,rl,ll,hum = fc:makechar(char.WorldPivot,v3n(char.WorldPivot.Rotation:ToOrientation()))
end
if hum.Parent ~= nil then
hum.Parent = char
end
hum.DisplayName = 2/wait()--string.rep(" ",math.random(50,150))
if cn then
script.Name = http:GenerateGUID(false)
char.Name = http:GenerateGUID(false)
end
local rp = char.WorldPivot.Position
local pos = t.Position
local ori = t.Orientation
local rot = t.CFrame.Rotation
if mode == 1 then
if not hw and not ha and not hs and not hd then
wan = 0
local ty = math.sin(os.clock() * 1.5) / 25
t.CFrame = cfn(rp.X,rp.Y + ty,rp.Z) * rot
h.CFrame = cfn(pos + t.CFrame.upVector * 1.5) * rot
ra.CFrame = cfn((pos + t.CFrame.rightVector * -1.5)) * rot
la.CFrame = cfn((pos + t.CFrame.rightVector * 1.5)) * rot
rl.CFrame = cfn((pos + t.CFrame.upVector * (-2 - ty)) + (t.CFrame.rightVector * .5)) * rot
ll.CFrame = cfn((pos + t.CFrame.upVector * (-2 - ty)) + (t.CFrame.rightVector * -.5)) * rot
else
wan += 1
local nx = math.sin(mrad(wan) * 2.45) / 1.75
local x = cfang(nx,0,0)
t.CFrame = cfn(rp.X,rp.Y,rp.Z) * rot
h.CFrame = cfn(pos + t.CFrame.upVector * 1.5) * rot
ra.CFrame = cfn((pos + t.CFrame.rightVector * -1.5) + t.CFrame.lookVector * (nx)) * (rot * x)
la.CFrame = cfn((pos + t.CFrame.rightVector * 1.5) + t.CFrame.lookVector * -(nx)) * (rot * cfang(-nx,0,0))
rl.CFrame = cfn((pos + t.CFrame.upVector * math.clamp(-2 - (nx),-2,0)) + (t.CFrame.rightVector * .5) + t.CFrame.lookVector * (nx)) * (rot * x)
ll.CFrame = cfn((pos + t.CFrame.upVector * math.clamp(-2 - (nx),-2,0)) + (t.CFrame.rightVector * -.5) + t.CFrame.lookVector * -(nx)) * (rot * cfang(-nx,0,0))
end
elseif mode == 2 then
t.CFrame = cfn(rp.X,rp.Y + math.sin(os.clock()) / 3,rp.Z) * rot
h.CFrame = cfn(pos + t.CFrame.upVector * 1.5) * rot
ra.CFrame = cfn(((pos + t.CFrame.lookVector * .875) + (t.CFrame.rightVector * -.53)) + v3n(0,.3 + math.sin(os.clock() * 1.5) / 12,0)) * (rot * cfang(0,0,mrad(82.5)))
la.CFrame = cfn(((pos + t.CFrame.lookVector * .875) + (t.CFrame.rightVector * .53)) + v3n(0,.3 + math.sin(os.clock() * 1.5) / 12,0)) * (rot * cfang(0,0,mrad(-82.5)))
rl.CFrame = cfn((pos + t.CFrame.upVector * -1.45) + (t.CFrame.rightVector * .5)) * (rot * cfang(mrad(-35),0,0))
ll.CFrame = cfn((pos + t.CFrame.upVector * -1.75) + (t.CFrame.rightVector * -.5)) * (rot * cfang(mrad(-7.5),0,0))
end
end
end))
script.DescendantRemoving:Connect(function(des)
if des == char or des == h or des == hm or des == t or des == hrp or des == ra or des == la or des == rl or des == ll or des == hum then
d:AddItem(char,0)
end
end)
while task.wait(math.random(12.5,25)) do
for i = 1,22.5,.25 do
local ori = t.Orientation
h.Orientation = v3n(ori.X,ori.Y + i,ori.Z)
task.wait()
end
for i = 22.5,-22.5,-.25 do
local ori = t.Orientation
h.Orientation = v3n(ori.X,ori.Y + i,ori.Z)
task.wait()
end
for i = -22.5,0,.25 do
local ori = t.Orientation
h.Orientation = v3n(ori.X,ori.Y + i,ori.Z)
task.wait()
end
local ori = t.Orientation
h.Orientation = v3n(ori.X,ori.Y,ori.Z)
end