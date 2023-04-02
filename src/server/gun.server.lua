-- gun
-- Variables --
local deb = game:GetService("Debris")
local ray = RaycastParams.new()
local r = Instance.new("RemoteEvent",owner.PlayerGui)
local gun = Instance.new("Tool",owner.Backpack)
local handle = Instance.new("Part",gun)
local s = Instance.new("Sound",handle)
local mesh = Instance.new("SpecialMesh",handle)
local function sub(target,pos,size,vu,vm)
	local t = {}
	for i = 1,7 do
		local mathp = Instance.new("Part",script)
		local rs = (size * 1.75) / (3 * (vm / (target:GetMass() / 200)))
		mathp.Size = Vector3.new(rs,rs,rs)
		mathp.Transparency = .75
		mathp.Anchored = true
		mathp.CanCollide = false
		mathp.Orientation = Vector3.new(math.random(0,360),math.random(0,360),math.random(0,360))
		mathp.Position = pos
		table.insert(t,mathp)
		deb:AddItem(mathp,0)
		task.wait()
	end
	local res = target:SubtractAsync(t,PreciseConvexDecomposition)
	res.Parent = target.Parent
	if res.Anchored == false then
		res.AssemblyLinearVelocity = (vu * 100) / (vm / 3)
	end
	deb:AddItem(target,0)
end
local function addhole(target,color,pos,ori)
	local hole = Instance.new("Part",script)
	local weld = Instance.new("Weld",hole)
	local v = (target.Position - pos)
	local vu = v.Unit
	local vm = v.Magnitude
	hole.BrickColor = BrickColor.new(color)
	hole.Material = "SmoothPlastic"
	hole.CanCollide = false
	hole.Size = Vector3.new(0,.3,.3)
	hole.Shape = "Cylinder"
	weld.C0 = CFrame.new(vu * vm) * CFrame.Angles(ori.X,ori.Y,math.rad(90) + ori.Z)
	weld.Part0 = hole
	weld.Part1 = target
end
-- Properties --
script.Name = "GS"
r.Name = "S"
gun.Name = "Gun"
gun.Grip = CFrame.new(0,-.25,-.5) * CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))
handle.Name = "Handle"
mesh.MeshType = "FileMesh"
mesh.MeshId = "rbxassetid://7790905770"
handle.Size = Vector3.new(1,1,1)
handle.Color = Color3.new(0,0,0)
ray.FilterType = Enum.RaycastFilterType.Blacklist
ray.FilterDescendantsInstances = {owner.Character, gun}
ray.IgnoreWater = true
-- Script --
NLS([==[local t = script.Parent local m = owner:GetMouse()
local r = owner.PlayerGui.S t.Activated:Connect(function()
local hit = m.Hit
r:FireServer(hit, owner)
end)]==],gun)
r.OnServerEvent:Connect(function(player, hit)
	s.SoundId = "rbxassetid://4328605927"
	s.Volume = 1.5
	s:Play()
	local hp = (hit.Position - handle.Position)
	local vu = hp.Unit
	local vm = hp.magnitude
	local result = workspace:Raycast(handle.Position,hp * 5000,ray)
	if result then
		if result.Instance.Parent:FindFirstChildOfClass("Humanoid") then
			if result.Instance.Name == "Head" then
				result.Instance.Parent:FindFirstChildOfClass("Humanoid"):TakeDamage(result.Instance.Parent:FindFirstChildOfClass("Humanoid").MaxHealth)
			elseif result.Instance.Name == "Torso" or result.Instance.Name == "UpperTorso" then
				result.Instance.Parent:FindFirstChildOfClass("Humanoid"):TakeDamage(50)
			else
				result.Instance.Parent:FindFirstChildOfClass("Humanoid"):TakeDamage(10)
			end
		end
		addhole(result.Instance,"Black",result.Position,result.Normal)
		if result.Instance.Material == Enum.Material.Glass then
			local mag = result.Instance.Size.magnitude
			sub(result.Instance,result.Position,mag,vu,vm)
		else
			if result.Instance.Anchored == false then
				result.Instance.AssemblyLinearVelocity = (vu * 100) / (vm / 3)
			end
		end
	end
end)
-- UP TO DATE.
--[[meshid = 6618852305 texture = 6618906249 meshid2 = 6618851335 meshid3 = 6618850751 meshid4 = 6618851033 meshid5 = 6618852600 mesh6 = 6618850751 mesh7 = 66188???05]]