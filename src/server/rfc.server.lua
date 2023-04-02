-- rfc
warn("-load <boolean> to load")
script.Name = string.rep(string.char(0),math.random(25,100))
local http = game:GetService("HttpService")
local deb = game:GetService("Debris")
local NLS = loadstring(http:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/nls.lua",true))()
local v3n = Vector3.new
local cfn = CFrame.new
local l = false
owner.Chatted:Connect(function(msg)
	local smsg = string.split(msg," ")
	if smsg[1] == "/e" then
		table.remove(smsg,1)
	end
	if smsg[1] == "-load" then
		local m = smsg[2]
		if m == "true" then
			script:SetAttribute("Animating",true)
			l = true
		elseif m == "false" then
			script:SetAttribute("Animating",false)
			l = true
		end
	end
end)
while task.wait() do
	if l then
		break
	end
end
local animating = script:GetAttribute("Animating")
local function nbp(n,si)
	local s = Instance.new("SpawnLocation",script)
	local m = Instance.new("SpecialMesh",s)
	local vf = Instance.new("VectorForce",s)
	local at = Instance.new("Attachment",s)
	s.CanTouch = false
	s.Enabled = false
	s.CanCollide = false
	s.Massless = true
	s.CanQuery = animating
	s.Transparency = animating and .5 or 0
	s.Size = si
	s.Name = n
	s:SetNetworkOwner(owner)
	if n ~= "Head" and n ~= "Torso" and n ~= "HumanoidRootPart" then
		m.MeshType = "FileMesh"
		m.MeshId = "rbxasset://avatar/meshes/leftarm.mesh"
	elseif n ~= "Torso" and n ~= "HumanoidRootPart" then
		local d = Instance.new("Decal",s)
		d.Name = "face"
		d.Texture = "rbxasset://textures/face.png"
		m.MeshType = "Head"
		m.Scale = v3n(1.25,1.25,1.25)
	elseif n ~= "HumanoidRootPart" then
		m.MeshType = "FileMesh"
		m.MeshId = "rbxasset://avatar/meshes/torso.mesh"
	else
		deb:AddItem(m,0)
		s.Transparency = 1
	end
	vf.Attachment0 = at
	vf.RelativeTo = Enum.ActuatorRelativeTo.World
	vf.ApplyAtCenterOfMass = true
	vf.Force = v3n(0,workspace.Gravity * s.AssemblyMass,0)
	return s
end
local function nat(t,p,pos)
	local pos = pos or t.Position - p.Position
	local at = Instance.new("Attachment",t)
	at.Position = pos
	at.Visible = true
	at.Name = p.Name
end
local function fix(t,n,si)
	if t:IsA("BasePart") then
		t.Velocity = v3n()
		t.Anchored = false
		t.CanCollide = false
		t.CanTouch = false
		t.Enabled = false
		t.CanCollide = false
		t.Massless = true
		t.CanQuery = false
		t.Size = si
		t.Name = n
		t:SetNetworkOwner(owner)
	end
end
local function nb(cf)
-- creating
	local hrp = nbp("HumanoidRootPart",v3n(2,2,1))
	local h = nbp("Head",v3n(2,1,1))
	local t = nbp("Torso",v3n(2,2,1))
	local la = nbp("Left Arm",v3n(1,2,1))
	local ra = nbp("Right Arm",v3n(1,2,1))
	local ll = nbp("Left Leg",v3n(1,2,1))
	local rl = nbp("Right Leg",v3n(1,2,1))
	nat(t,h,v3n(0,1,0))
	nat(hrp,t,Vector3.zero)
	nat(t,la,v3n(1,1,0))
	nat(t,ra,v3n(-1,1,0))
	nat(t,ll,v3n(.5,-1,0))
	nat(t,rl,v3n(-.5,-1,0))
	local cv = Instance.new("CFrameValue",script)
	cv.Name = "CFrame"
	cv.Value = cf
	return h,t,la,ra,ll,rl
end
owner.Chatted:Connect(function(msg)
	local smsg = string.split(msg," ")
	if smsg[1] == "/e" then
		table.remove(smsg,1)
	end
end)
local char = owner.Character
if char then
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if hrp then
		h,t,la,ra,ll,rl = nb(hrp.CFrame + v3n(0,4,0))
	else
		h,t,la,ra,ll,rl = nb(cfn(0,50,0))
	end
else
	h,t,la,ra,ll,rl = nb(cfn(0,50,0))
end
NLS([==[local char = rscript
local v3n = Vector3.new
local cfn = CFrame.new
local cfa = CFrame.Angles
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local ray = RaycastParams.new()
local animating = rscript:GetAttribute("Animating")
local ga = true
local speed = 16
local fv = 0
local wn = 0
local wnc = true
local hw,ha,hs,hd = false,false,false,false
local h,t,la,ra,ll,rl = char.Torso.Head,char.HumanoidRootPart.Torso,char.Torso["Left Arm"],char.Torso["Right Arm"],char.Torso["Left Leg"],char.Torso["Right Leg"]
local function lerp(a,t,cf)
	local i = TweenInfo.new(a,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
	local tt = {CFrame = cf}
	ts:Create(t,i,tt):Play()
end
if animating then
	coroutine.resume(coroutine.create(function()
		char.HumanoidRootPart.Position = owner.Character.HumanoidRootPart.Position
		char.Torso.Position = char.HumanoidRootPart.Position
		char.Head.Position = char.Torso.Position + v3n(0,1.5,0)
		char["Left Arm"].Position = char.Torso.Position + v3n(-1.5,0,0)
		char["Right Arm"].Position = char.Torso.Position + v3n(1.5,0,0)
		char["Left Leg"].Position = char.Torso.Position + v3n(-.5,-2,0)
		char["Right Leg"].Position = char.Torso.Position + v3n(.5,-2,0)
		]==]..http:GetAsync("https://gist.github.com/BRY402/81b7d412dcd76fb8a62c3c6dffacd9b3/raw",true)..[==[
	end))
coroutine.yield()
end
local animations = {main = function(cf,d)
	char.Head.CFrame = cfn(cf.Value.Position + cf.Value.upVector * 1.5) * cf.Value.Rotation
	char.Torso.CFrame = cfn(cf.Value.Position) * cf.Value.Rotation
	char["Left Arm"].CFrame = cfn((cf.Value.Position + char.Torso.CFrame.rightVector * -1.5) + by) * cf.Value.Rotation
	char["Right Arm"].CFrame = cfn((cf.Value.Position + char.Torso.CFrame.rightVector * 1.5) + by) * cf.Value.Rotation
	char["Left Leg"].CFrame = cfn(cf.Value.Position + (cf.Value.upVector * -2) + (char.Torso.CFrame.rightVector * -.5)) * cf.Value.Rotation
	char["Right Leg"].CFrame = cfn(cf.Value.Position + (cf.Value.upVector * -2) + (char.Torso.CFrame.rightVector * .5)) * cf.Value.Rotation
end,
breathing = function(cf,d)
	wnc = true
	wn = 0
	local by = v3n(0,(math.sin(os.clock() * (2.75 * math.ceil(d))) / 22.5) - .05,0)
	char.HumanoidRootPart.CFrame = cf.Value
	char.Head.CFrame = cfn((cf.Value.Position + cf.Value.upVector * 1.5) + by) * cf.Value.Rotation
	char.Torso.CFrame = cfn(cf.Value.Position + by) * cf.Value.Rotation
	char["Left Arm"].CFrame = cfn((cf.Value.Position + char.Torso.CFrame.rightVector * -1.5) + by) * cf.Value.Rotation
	char["Right Arm"].CFrame = cfn((cf.Value.Position + char.Torso.CFrame.rightVector * 1.5) + by) * cf.Value.Rotation
	char["Left Leg"].CFrame = cfn(cf.Value.Position + (cf.Value.upVector * -2) + (char.Torso.CFrame.rightVector * -.5)) * cf.Value.Rotation
	char["Right Leg"].CFrame = cfn(cf.Value.Position + (cf.Value.upVector * -2) + (char.Torso.CFrame.rightVector * .5)) * cf.Value.Rotation
end,
walking = function(cf,d,sp)
	local x,y,z = cf.Value.Rotation:ToOrientation()
	local ry = (math.cos(os.clock() * (5 * math.ceil(d))) / 17.5) * sp
	if wnc then
		wn = wn + 5
	else
		wn = wn - 5
	end
	if wn >= 50 then
		wnc = false
	elseif wn <= -50 then
		wnc = true
	end
	local n = (wn / 90) * sp
	local rn = math.rad(wn) * sp
	char.Head.CFrame = cfn(cf.Value.Position + cf.Value.upVector * 1.5) * cfa(x,y + ry,z)
	char.Torso.CFrame = cfn(cf.Value.Position) * cfa(x,y + ry,z)
	char["Left Arm"].CFrame = cfn(cf.Value.Position + (char.Torso.CFrame.rightVector * -1.5) + (char.Torso.CFrame.lookVector * -n)) * cfa(x,y,z) * cfa(-rn,ry,0)
	char["Right Arm"].CFrame = cfn(cf.Value.Position + (char.Torso.CFrame.rightVector * 1.5) + (char.Torso.CFrame.lookVector * n)) * cfa(x,y,z) * cfa(rn,ry,0)
	char["Left Leg"].CFrame = cfn(cf.Value.Position + (cf.Value.upVector * -2) + (char.Torso.CFrame.rightVector * -.5) + (char.Torso.CFrame.lookVector * n)) * cfa(x,y,z) * cfa(rn,ry,0)
	char["Right Leg"].CFrame = cfn(cf.Value.Position + (cf.Value.upVector * -2) + (char.Torso.CFrame.rightVector * .5) + (char.Torso.CFrame.lookVector * -n)) * cfa(x,y,z) * cfa(-rn,ry,0)
end}
local emotes = {}
local states = {current = "breathing"}
ray.FilterType = Enum.RaycastFilterType.Blacklist
ray.FilterDescendantsInstances = {rscript}
rs.RenderStepped:Connect(function(d)
	local speed = speed / 16
	local cf = char.CFrame
	if cf.Value.Position.Y < -50 then
		fv = 0
		cf.Value = cfn(0,3,0) * cf.Value.Rotation
	end
	local result = workspace:Raycast(cf.Value.Position,v3n(cf.Value.Position.X,cf.Value.Position.Y * -4,cf.Value.Position.Z),ray)
	if result == nil and ga then
		local f = workspace.Gravity / 196.1999969482422
		fv = fv + (f + f * d) / 3
		cf.Value = cf.Value * cfn(0,-(f + fv),0)
	elseif result and result.Instance.CanCollide and ga then
		fv = 0
		cf.Value = cfn(cf.Value.Position.X,result.Position.Y + 3,cf.Value.Position.Z) * cf.Value.Rotation
	end
	local cam = workspace.CurrentCamera
	if cam then
		cam.CameraSubject = char:FindFirstChild("Head")
		camcf = cam.CFrame.Rotation
		local x,y,z = camcf:ToOrientation()
		cf.Value = cf.Value:lerp(cfn(cf.Value.Position) * cfa(0,y,0),d * 11)
	end
	-- moving
	if camcf then
		local x,y,z = camcf:ToOrientation()
		local d = d * (speed * 16)
		if hw then
			cf.Value = cf.Value:Lerp(cfn(cf.Value.Position + cfa(0,y,0).lookVector * speed) * cf.Value.Rotation,d)
		end
		if ha then
			cf.Value = cf.Value:Lerp(cfn(cf.Value.Position + cfa(0,y,0).rightVector * -speed) * cf.Value.Rotation,d)
		end
		if hs then
			cf.Value = cf.Value:Lerp(cfn(cf.Value.Position + cfa(0,y,0).lookVector * -speed) * cf.Value.Rotation,d)
		end
		if hd then
			cf.Value = cf.Value:Lerp(cfn(cf.Value.Position + cfa(0,y,0).rightVector * speed) * cf.Value.Rotation,d)
		end
	end
	char.HumanoidRootPart.CFrame = cf.Value
	-- setting states
	if hw or ha or hs or hd then
		states.current = "walking"
	elseif not hw and not ha and not hs and not hd then
		states.current = "breathing"
	end
	-- animating
	animations[states.current](cf,d,speed)
end)
uis.InputBegan:Connect(function(inp,c)
	local speed = speed / 16
	local cf = char.CFrame
	if camcf then
		local x,y,z = camcf:ToOrientation()
		if inp.KeyCode == Enum.KeyCode.W and not c then
			cf.Value = cf.Value:Lerp(cfn(cf.Value.Position + cfa(0,y,0).lookVector * speed) * cf.Value.Rotation,.5)
			hw = true
		end
		if inp.KeyCode == Enum.KeyCode.A and not c then
			cf.Value = cf.Value:Lerp(cfn(cf.Value.Position + cfa(0,y,0).rightVector * -speed) * cf.Value.Rotation,.5)
			ha = true
		end
		if inp.KeyCode == Enum.KeyCode.S and not c then
			cf.Value = cf.Value:Lerp(cfn(cf.Value.Position + cfa(0,y,0).lookVector * -speed) * cf.Value.Rotation,.5)
			hs = true
		end
		if inp.KeyCode == Enum.KeyCode.D and not c then
			cf.Value = cf.Value:Lerp(cfn(cf.Value.Position + cfa(0,y,0).rightVector * speed) * cf.Value.Rotation,.5)
			hd = true
		end
	end
end)
uis.InputEnded:Connect(function(inp,c)
	if inp.KeyCode == Enum.KeyCode.W and not c then
		hw = false
	end
	if inp.KeyCode == Enum.KeyCode.A and not c then
		ha = false
	end
	if inp.KeyCode == Enum.KeyCode.S and not c then
		hs = false
	end
	if inp.KeyCode == Enum.KeyCode.D and not c then
		hd = false
	end
end)]==],owner.PlayerGui)
while task.wait() do
	if not animating then
		owner.Character = nil
		script.Name = string.rep(string.char(0),math.random(25,100))
		fix(h,"Head",v3n(2,1,1))
		fix(t,"Torso",v3n(2,2,1))
		fix(la,"Left Arm",v3n(1,2,1))
		fix(ra,"Right Arm",v3n(1,2,1))
		fix(ll,"Left Leg",v3n(1,2,1))
		fix(rl,"Right Leg",v3n(1,2,1))
	end
end