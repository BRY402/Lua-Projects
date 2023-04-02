-- @fake_char1
script:Destroy()
-- Services
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- Variables
local ray = RaycastParams.new()
ray.FilterType = Enum.RaycastFilterType.Blacklist
ray.RespectCanCollide = true
local fadetime = 3
local destroyed = {}
local v3n = Vector3.new
local cfn = CFrame.new
local cfa = CFrame.Angles
local mr = math.rad
local pi = math.pi
local lastStandingPartPosition = Vector3.zero
local speed = 1 / 4
local anim_speed = .4
local force = 0
local ctoggle = 0
local prefix = "-"
local lastAnim = "Breathing"
local hw, ha, hs, hd = false, false, false, false
local fall = false
local fly = false
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua",true))()
local refill = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/refill.lua",true))()
local rem = lib.Create("RemoteEvent", owner, {Name = HttpService:GenerateGUID()})
local standingPart = nil

-- Functions
local function removeinvalid(d)
	if not d:IsA("Sound") then
		lib.Destroy(d)
	end
end
local function newpart(typ)
	local storage = {}
	if typ == "Limb" then
		local p = lib.Create("Part",workspace,{
			Name = HttpService:GenerateGUID(false),
			Anchored = true,
			Size = v3n(1,2,1),
			CanCollide = false,
			CanTouch = false
		})
		local m = lib.Create("SpecialMesh",p,{MeshType = "FileMesh",
		MeshId = "rbxasset://avatar/meshes/leftarm.mesh"})
		local connection = refill(p,refonchange)
		connection.Main = p
		storage.addedConnection = p.DescendantAdded:Connect(removeinvalid)
		storage.meshConnection = m.Changed:Connect(function()
			lib.Destroy(p)
		end)
		connection.OnDestroy:Connect(function(new_part)
			local addedConnection = storage.addedConnection
			local meshConnection = storage.meshConnection
			if addedConnection then
				addedConnection:Disconnect()
			end
			if meshConnection then
				meshConnection:Disconnect()
			end
			storage.addedConnection = new_part.DescendantAdded:Connect(removeinvalid)
			storage.meshConnection = new_part:FindFirstChildOfClass("SpecialMesh").Changed:Connect(function()
				lib.Destroy(new_part)
			end)
			new_part.Name = HttpService:GenerateGUID(false)
			connection.Main = new_part
		end)
		return connection
	elseif typ == "Head" then
		local p = lib.Create("Part",workspace,{
			Name = HttpService:GenerateGUID(false),
			Anchored = true,
			Size = v3n(2,1,1),
			CanCollide = false,
			CanTouch = false
		})
		local d = lib.Create("Decal",p,{Name = "face",
		Texture = "rbxasset://textures/face.png"})
		local m = lib.Create("SpecialMesh",p,{MeshType = "Head",
		Scale = v3n(1.25,1.25,1.25)})
		local connection = refill(p,refonchange)
		connection.Main = p
		storage.addedConnection = p.DescendantAdded:Connect(removeinvalid)
		storage.meshConnection = m.Changed:Connect(function()
			lib.Destroy(p)
		end)
		connection.OnDestroy:Connect(function(new_part)
			local addedConnection = storage.addedConnection
			local meshConnection = storage.meshConnection
			if addedConnection then
				addedConnection:Disconnect()
			end
			if meshConnection then
				meshConnection:Disconnect()
			end
			storage.addedConnection = new_part.DescendantAdded:Connect(removeinvalid)
			storage.meshConnection = new_part:FindFirstChildOfClass("SpecialMesh").Changed:Connect(function()
				lib.Destroy(new_part)
			end)
			new_part.Name = HttpService:GenerateGUID(false)
			connection.Main = new_part
		end)
		return connection
	elseif typ == "Torso" then
		local p = lib.Create("Part",workspace,{
			Name = HttpService:GenerateGUID(false),
			Anchored = true,
			Size = v3n(2,2,1),
			CanCollide = false,
			CanTouch = false
		})
		local m = lib.Create("SpecialMesh",p,{MeshType = "FileMesh",
		MeshId = "rbxasset://avatar/meshes/torso.mesh"})
		local connection = refill(p,refonchange)
		connection.Main = p
		storage.addedConnection = p.DescendantAdded:Connect(removeinvalid)
		storage.meshConnection = m.Changed:Connect(function()
			lib.Destroy(p)
		end)
		connection.OnDestroy:Connect(function(new_part)
			local addedConnection = storage.addedConnection
			local meshConnection = storage.meshConnection
			if addedConnection then
				addedConnection:Disconnect()
			end
			if meshConnection then
				meshConnection:Disconnect()
			end
			storage.addedConnection = new_part.DescendantAdded:Connect(removeinvalid)
			storage.meshConnection = new_part:FindFirstChildOfClass("SpecialMesh").Changed:Connect(function()
				lib.Destroy(new_part)
			end)
			new_part.Name = HttpService:GenerateGUID(false)
			connection.Main = new_part
		end)
		return connection
	elseif typ == "HumanoidRootPart" then
		local p = lib.Create("Part",workspace,{
			Name = HttpService:GenerateGUID(false),
			Anchored = true,
			Transparency = 1,
			Size = v3n(2,2,1),
			CanCollide = false,
			CanTouch = false
		})
		local connection = refill(p,refonchange)
		connection.Main = p
		p.DescendantAdded:Connect(removeinvalid)
		connection.OnDestroy:Connect(function(new_part)
			local addedConnection = storage.addedConnection
			local meshConnection = storage.meshConnection
			if addedConnection then
				addedConnection:Disconnect()
			end
			if meshConnection then
				meshConnection:Disconnect()
			end
			storage.addedConnection = new_part.DescendantAdded:Connect(removeinvalid)
			new_part.Name = HttpService:GenerateGUID(false)
			connection.Main = new_part
		end)
		return connection
	end
end
local function newbody(fcf)
	local fcf = fcf or CFrame.identity
	cf = fcf
	local h = newpart("Head")
	local t = newpart("Torso")
	local hrp = newpart("HumanoidRootPart")
	local ra = newpart("Limb")
	local la = newpart("Limb")
	local rl = newpart("Limb")
	local ll = newpart("Limb")
	h.Main.CFrame = cfn(0,4.5,0) * cf
	t.Main.CFrame = cfn(0,3,0) * cf
	hrp.Main.CFrame = cfn(0,3,0) * cf
	ra.Main.CFrame = (cfn(0,3,0) * cf) + t.Main.CFrame.rightVector * 1.5
	la.Main.CFrame = (cfn(0,3,0) * cf) + t.Main.CFrame.rightVector * -1.5
	rl.Main.CFrame = (cfn(0,1,0) * cf) + t.Main.CFrame.rightVector * .5
	ll.Main.CFrame = (cfn(0,1,0) * cf) + t.Main.CFrame.rightVector * -.5
	h.OnDestroy:Connect(function(new_part)
		new_part.CFrame = cfn(0,4.5,0) * cf
	end)
	t.OnDestroy:Connect(function(new_part)
		new_part.CFrame = cfn(0,3,0) * cf
	end)
	hrp.OnDestroy:Connect(function(new_part)
		new_part.CFrame = cfn(0,3,0) * cf
	end)
	ra.OnDestroy:Connect(function(new_part)
		new_part.CFrame = (cfn(0,3,0) * cf) + t.Main.CFrame.rightVector * 1.5
	end)
	la.OnDestroy:Connect(function(new_part)
		new_part.CFrame = (cfn(0,3,0) * cf) + t.Main.CFrame.rightVector * -1.5
	end)
	rl.OnDestroy:Connect(function(new_part)
		new_part.CFrame = (cfn(0,1,0) * cf) + t.Main.CFrame.rightVector * .5
	end)
	ll.OnDestroy:Connect(function(new_part)
		new_part.CFrame = (cfn(0,1,0) * cf) + t.Main.CFrame.rightVector * -.5
	end)
	return h,t,hrp,ra,la,rl,ll
end
local function getInRange(filterlist, data)
	local params1 = OverlapParams.new()
	local params2 = OverlapParams.new()
	params1.FilterDescendantsInstances = filterlist
	params2.FilterDescendantsInstances = filterlist
	params1.RespectCanCollide = true
	local inrange = lib.Utilities.Pack(table.unpack(workspace:GetPartBoundsInRadius(data.Position, data.Radius, params1)), table.unpack(workspace:GetPartBoundsInRadius(data.Position, data.Radius, params2)))
	return inrange
end
local function destroy(part)
	if not table.find(destroyed, part) and part:IsDescendantOf(workspace) then
		part:ClearAllChildren()
		local partclone = lib.Clone(part)
		table.insert(destroyed, partclone)
		lib.Destroy(part)
		table.insert(destroyed, part)
		local n = 0
		partclone:BreakJoints()
		partclone.Anchored = true
		partclone.CanQuery = false
		partclone.CanCollide = false
		partclone.Material = "Neon"
		partclone.Parent = workspace
		TweenService:Create(partclone,TweenInfo.new(fadetime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),{
			Transparency = 1,
			Color = Color3.new(0,0,0),
			Position = partclone.Position + Vector3.new(lib.Utilities.Random(-7, 7).Number, lib.Utilities.Random(-7, 7).Number, lib.Utilities.Random(-7, 7).Number),
			Orientation = partclone.Orientation + Vector3.new(lib.Utilities.Random(-180, 180).Number, lib.Utilities.Random(-180, 180).Number, lib.Utilities.Random(-180, 180).Number)
		}):Play()
		TweenService:Create(partclone,TweenInfo.new(fadetime + 1, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0),{
			Size = Vector3.zero
		}):Play()
		local isnegative = math.random(1,2)
		lib.Destroy(partclone,fadetime)
	end
end
local function calc_alpha(alpha, delta)
	return alpha + 1 - alpha ^ delta
end
local function lerp(cframe, tocframe, delta)
	return cframe:Lerp(tocframe, calc_alpha(anim_speed, delta))
end

-- Tables
local refonchange = {
	"Size",
	"ResizeIncrement",
	"Transparency",
	"LocalTransparencyModifier",
	"RootPriority",
	"AssemblyRootPart",
	"AssemblyMass",
	"Mass",
	"Color",
	"BrickColor",
	"CastShadow",
	"CenterOfMass",
	"CollisionGroup",
	"CollisionGroupId",
	"Material",
	"MaterialVariant",
	"Reflectance",
	"Size",
	"Anchored",
	"CanCollide"
}
local anim_weights = {
	Head = 0,
	Torso = 0,
	RightArm = 0,
	LeftArm = 0,
	RightLeg = 0,
	LeftLeg = 0
}
local sounds = {
	DiamondPlate = "rbxassetid://3477114901",
	Concrete = "rbxassetid://5446226292",
	WoodPlanks = "rbxassetid://8454543187",
	Grass = "rbxassetid://4776173570",
	Plastic = "rbxassetid://5446226292",
	SmoothPlastic = "rbxassetid://5446226292",
	Wood = "rbxassetid://8454543187",
	Metal = "rbxassetid://3477114901",
	CorrodedMetal = "rbxassetid://3477114901",
	Brick = "rbxassetid://5446226292",
	Sand = "rbxassetid://6154305275",
	Snow = "rbxassetid://6154305275",
	Rock = "rbxassetid://544622629"
}
local anims = {
	State = "Breathing",
	Emoting = false,
	Emote = "",
	Breathing = function(delta)
		lastAnim = "Breathing"
		local dist = 10
		local brspeed = pi
		local broffset = math.sin(os.clock() * brspeed) / dist
		local head_cf = cf * cfn(0, 1.4 + broffset, 0)
		local torso_cf = cf * cfn(0,-.1 + broffset, 0)
		local rightarm_cf = cf * cfn(1.5, -.1 + broffset, 0)
		local leftarm_cf cf = cf * cfn(-1.5, -.1 + broffset, 0)
		local rightleg_cf = cf * cfn(.5, -2, 0)
		local leftleg_cf = cf * cfn(-.5, -2, 0)
		h.Main.CFrame = lerp(h.Main.CFrame, head_cf, delta)
		t.Main.CFrame = lerp(t.Main.CFrame, torso_cf, delta)
		ra.Main.CFrame = lerp(ra.Main.CFrame, rightarm_cf, delta)
		la.Main.CFrame = lerp(la.Main.CFrame, leftarm_cf, delta)
		rl.Main.CFrame = lerp(rl.Main.CFrame, rightleg_cf, delta)
		ll.Main.CFrame = lerp(ll.Main.CFrame, leftleg_cf, delta)
	end,
	Falling = function(delta)
		lastAnim = "Falling"
		local offset = math.sin(os.clock() * 2) / 3
		h.Main.CFrame = lerp(h.Main.CFrame, cf * cfn(0,1.5,0) * cfa(-math.rad(15),0,0), delta)
		t.Main.CFrame = lerp(t.Main.CFrame, cf, delta)
		ra.Main.CFrame = lerp(ra.Main.CFrame, cf * cfn(1.4,1.5,0) * cfa(0,0,-math.abs(offset)), delta)
		la.Main.CFrame = lerp(la.Main.CFrame, cf * cfn(-1.4,1.5,0) * cfa(0,0,math.abs(offset)), delta)
		rl.Main.CFrame = lerp(rl.Main.CFrame, cf * cfn(.5,-2,-math.rad(7.5) + .075) * cfa(-math.rad(7.5),0,0), delta)
		ll.Main.CFrame = lerp(ll.Main.CFrame, cf * cfn(-.5,-2,-math.rad(25) + .3) * cfa(-math.rad(25),0,0), delta)
	end,
	Walking = function(delta)
		lastAnim = "Walking"
		local ang = math.sin(os.clock() * 7.5) / 1.25
		local tang = ang / 10
		h.Main.CFrame = lerp(h.Main.CFrame, cf * cfn(0, 1.5, 0) * cfa(0, tang, 0), delta)
		t.Main.CFrame = lerp(t.Main.CFrame, cf * cfa(0, tang, 0), delta)
		local lookvector, upvector, rightvector = t.Main.CFrame.lookVector,t.Main.CFrame.upVector,t.Main.CFrame.rightVector
		ra.Main.CFrame = lerp(ra.Main.CFrame, (cf + rightvector * 1.5 + lookvector * -ang / pi * 2) * cfa(-ang,-tang,0), delta)
		la.Main.CFrame = lerp(la.Main.CFrame, (cf + rightvector * -1.5 + lookvector * ang / pi * 2) * cfa(ang,tang,0), delta)
		rl.Main.CFrame = lerp(rl.Main.CFrame, (cf + rightvector * .5 + upvector * -1.9 + lookvector * ang / pi * 2) * cfa(ang,0,0), delta)
		ll.Main.CFrame = lerp(ll.Main.CFrame, (cf + rightvector * -.5 + upvector * -1.9 + lookvector * -ang / pi * 2) * cfa(-ang,0,0), delta)
	end,
	Flying = function(delta)
		lastAnim = "Flying"
		local offset = math.sin(os.clock() * 2) / 3
		local x = (hw and -15 or 0) + (hs and 15 or 0)
		local y = (ha and -15 or 0) + (hd and 15 or 0)
		local tilt = cfa(math.sin(x),math.sin(y),0)
		h.Main.CFrame = lerp(h.Main.CFrame, cf * cfn(0,1.5 + offset,0), delta)
		t.Main.CFrame = lerp(t.Main.CFrame, cf * cfn(0,offset,0), delta)
		ra.Main.CFrame = lerp(ra.Main.CFrame, cf * cfn(.5,offset * 1.1 + .075,-.75) * cfa(0,0,-math.rad(85)), delta)
		la.Main.CFrame = lerp(la.Main.CFrame, cf * cfn(-.5,offset * 1.1 + .075,-.75) * cfa(0,0,math.rad(85)), delta)
		rl.Main.CFrame = lerp(rl.Main.CFrame, cf * cfn(.5,-2 + offset,-math.rad(7.5) + .075) * cfa(-math.rad(8),0,0), delta)
		ll.Main.CFrame = lerp(ll.Main.CFrame, cf * cfn(-.5,-2 + offset,-math.rad(25) + .3) * cfa(-math.rad(25),0,0), delta)
	end,
	Emotes = {}
}

-- Code
local char = owner.Character
if char then
	local chrp = char:FindFirstChild("HumanoidRootPart")
	if chrp then
		h,t,hrp,ra,la,rl,ll = newbody(chrp.CFrame * cfn(0,-3,0))
	else
		h,t,hrp,ra,la,rl,ll = newbody()
	end
else
	h,t,hrp,ra,la,rl,ll = newbody()
end
local new_local = NLS([==[local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local remote = owner:FindFirstChild("]==]..rem.Name..[==[")
local cam = workspace.CurrentCamera
local ctoggle = 0
UserInputService.InputBegan:Connect(function(inp,focus)
	if not focus then
		if inp.KeyCode == Enum.KeyCode.W then
			remote:FireServer({"holdW"})
		elseif inp.KeyCode == Enum.KeyCode.A then
			remote:FireServer({"holdA"})
		elseif inp.KeyCode == Enum.KeyCode.S then
			remote:FireServer({"holdS"})
		elseif inp.KeyCode == Enum.KeyCode.D then
			remote:FireServer({"holdD"})
		elseif inp.KeyCode == Enum.KeyCode.Q then
			ctoggle = math.clamp(ctoggle - 1,0,1)
			remote:FireServer({"toggleRemove"})
		elseif inp.KeyCode == Enum.KeyCode.E then
			ctoggle = math.clamp(ctoggle + 1,0,1)
			remote:FireServer({"toggleAdd"})
		elseif inp.KeyCode == Enum.KeyCode.R then
			remote:FireServer({"Reset"})
		end
	end
end)
UserInputService.InputEnded:Connect(function(inp,focus)
	if not focus then
		if inp.KeyCode == Enum.KeyCode.W then
			remote:FireServer({"releaseW"})
		elseif inp.KeyCode == Enum.KeyCode.A then
			remote:FireServer({"releaseA"})
		elseif inp.KeyCode == Enum.KeyCode.S then
			remote:FireServer({"releaseS"})
		elseif inp.KeyCode == Enum.KeyCode.D then
			remote:FireServer({"releaseD"})
		end
	end
end)
local function turn_Event()
	if cam then
		if ctoggle ~= 1 then
			local x,y,z = cam.CFrame:ToOrientation()
			remote:FireServer({"Turn",y})
		else
			local rot = cam.CFrame.Rotation
			remote:FireServer({"TurnFly",rot})
		end
	end
end
Connection = cam:GetPropertyChangedSignal("CFrame"):Connect(turn_Event)
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	cam = workspace.CurrentCamera
	Connection:Disconnect()
	Connection = cam:GetPropertyChangedSignal("CFrame"):Connect(turn_Event)
end)
RunService.RenderStepped:Connect(function()
	owner.Character = nil
	local cam = workspace.CurrentCamera
	if cam then
		local name = script:GetAttribute("Head")
		if name then
			cam.CameraSubject = workspace:FindFirstChild(name)
		end
	end
end)]==], owner:FindFirstChildOfClass("PlayerGui"))
if new_local then
	new_local:SetAttribute("Head", h.Main.Name)
end
rem.OnServerEvent:Connect(function(plr,data)
	if plr == owner then
		if data[1] == "Turn" then
			cf = cfn(cf.Position) * cfa(0,data[2],0)
		elseif data[1] == "TurnFly" then
			cf = cfn(cf.Position) * data[2]
		elseif data[1] == "holdW" then
			hw = true
		elseif data[1] == "holdA" then
			ha = true
		elseif data[1] == "holdS" then
			hs = true
		elseif data[1] == "holdD" then
			hd = true
		elseif data[1] == "releaseW" then
			hw = false
		elseif data[1] == "releaseA" then
			ha = false
		elseif data[1] == "releaseS" then
			hs = false
		elseif data[1] == "releaseD" then
			hd = false
		elseif data[1] == "toggleAdd" then
			ctoggle = math.clamp(ctoggle + 1,0,1)
		elseif data[1] == "toggleRemove" then
			ctoggle = math.clamp(ctoggle - 1,0,1)
		elseif data[1] == "Reset" then
			destroy(h.Main)
			destroy(t.Main)
			destroy(hrp.Main)
			destroy(ra.Main)
			destroy(la.Main)
			destroy(rl.Main)
			destroy(ll.Main)
		end
	end
end)
owner.Chatted:Connect(function(msg)
	local smsg = string.split(msg," ")
	if smsg[1] == "/e" then
		anims.Emoting = true
		anims.Emote = smsg[2]
		table.remove(smsg,1)
	end
end)
owner.CharacterAdded:Connect(function()
	owner.Character = nil
end)
RunService.PostSimulation:Connect(function(delta)
	local filtertab = {
		h.Main,
		t.Main,
		hrp.Main,
		ra.Main,
		la.Main,
		rl.Main,
		ll.Main
	}
	ray.FilterDescendantsInstances = filtertab
	if cf.Position.Y < -40 then
		force = 0
		cf = cfn(0,10,0) * cf.Rotation
	end
	local sfx = hrp.Main:FindFirstChild("WalkSfx")
	if ctoggle ~= 1 then
		fly = false
		if standingPart then
			cf = cf + standingPart.Position - lastStandingPartPosition
			lastStandingPartPosition = standingPart.Position
		end
		local result = workspace:Raycast(cf.Position + cf.upVector * 3, cf.upVector * (-force - 6), ray)
		if result == nil then
			standingPart = nil
			force = force + (0.0050968400385032 * workspace.Gravity) / 15 + delta
			cf = cf * cfn(0, -force, 0)
			fall = true
		elseif result then
			standingPart = result.Instance
			lastStandingPartPosition = standingPart.Position
			fv = 0
			cf = cfn(cf.Position.X,result.Position.Y + 3,cf.Position.Z) * cf.Rotation
			fall = false
			if anims.State == "Walking" then
				local split = string.split(tostring(result.Material),".")
				local tsmat = split[#split]
				local mat = sounds[tsmat]
				if mat then
					if not sfx then
						local s = lib.Create("Sound",hrp.Main,{Name = "WalkSfx",
						PlaybackSpeed = .8,
						SoundId = mat,
						Looped = true,
						Playing = true})
					end
				else
					if sfx then
						lib.Destroy(sfx)
					end
				end
			else
				if sfx then
					lib.Destroy(sfx)
				end
			end
		else
			if sfx then
				lib.Destroy(sfx)
			end
		end
	else
		fall = false
		fly = true
		if sfx then
			lib.Destroy(sfx)
		end
	end
	if new_local then
		new_local:SetAttribute("Head", h.Main.Name)
	end
	hrp.Main.CFrame = cf
	owner.Character = nil
	local modespeed = ctoggle == 1 and calc_alpha(speed, delta) * 3 or calc_alpha(speed, delta)
	if hw then
		cf = cf + cf.lookVector * modespeed
	end
	if ha then
		cf = cf - cf.rightVector * modespeed
	end
	if hs then
		cf = cf - cf.lookVector * modespeed
	end
	if hd then
		cf = cf + cf.rightVector * modespeed
	end
	if not fall and not fly then
		if not hw and not ha and not hs and not hd then
			anims.State = "Breathing"
		else
			anims.State = "Walking"
		end
	elseif not fly then
		anims.State = "Falling"
	else
		anims.State = "Flying"
	end
	if anims.State == "Breathing" and anims.Emoting then
		local emote = anims.Emotes[anims.Emote]
		if emote and string.sub(anims.Emote, 0, 1) ~= "-" then
			emote(delta)
		else
			warn(anims.Emote.." is not a valid emote name")
		end
	else
		anims.Emoting = false
	end
	anims[anims.State](delta)
end)