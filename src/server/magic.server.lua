local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local random = math.random
local rad = math.rad
local attack_shoot_fadetime = 2.5
local fadetime = 1.5
local deleteinfo = TweenInfo.new(fadetime,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local deleteinfo2 = TweenInfo.new(attack_shoot_fadetime,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local deleteproperties = {Transparency = 1,
Color = Color3.new(0,0,0)}
local blocktargets = {}
local destroyed = {}
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local remote = lib.Create("RemoteEvent",owner,{Name = HttpService:GenerateGUID(false)})
local hrp
--local addanim = loadstring(HttpService:GetAsync("https://gist.github.com/BRY402/98b80c81dc0b1245d7b0ad75d978d02b/raw/leg%2520anims"))()
local filtertab = {script,
	owner.Character}
NLS([==[local uis = game:GetService("UserInputService")
local deb = game:GetService("Debris")
local mouse = owner:GetMouse()
local remote = owner:FindFirstChild("]==]..remote.Name..[==[")
local hrp,hum
mouse.Button1Down:Connect(function()
	hold = true
	local time = 0
	remote:FireServer({
		Data = mouse.Hit,
		Origin = (workspace.CurrentCamera or workspace.Terrain).CFrame,
		Type = "Click"
	})
	while hold do
		time = time + task.wait(.1)
		if time >= 1.5 then
			remote:FireServer({
				Data = mouse.Hit,
				Origin = (workspace.CurrentCamera or workspace.Terrain).CFrame,
				Type = "Click"
			})
		end
	end
end)
mouse.Button1Up:Connect(function()
	hold = false
end)
uis.InputBegan:Connect(function(inp,c)
	if inp.KeyCode == Enum.KeyCode.K and not c then
		remote:FireServer({Data = mouse.Hit,Type = "Teleport"})
	end
end)]==],owner.PlayerGui)
local function getInRange(filterlist, data)
	local params1 = OverlapParams.new()
	local params2 = OverlapParams.new()
	params1.FilterDescendantsInstances = filterlist
	params2.FilterDescendantsInstances = filterlist
	params1.RespectCanCollide = true
	local inrange = lib.Utilities.Pack(table.unpack(workspace:GetPartBoundsInRadius(data.Position, data.Radius, params1)), table.unpack(workspace:GetPartBoundsInRadius(data.Position, data.Radius, params2)))
	return inrange
end
local function teleport(cf,hrp)
	local originalcf = hrp.CFrame
	local offset = (originalcf.Position - cf.Position)
	for i,v in pairs(hrp.Parent:GetDescendants()) do
		if v:IsA("BasePart") then
			local partpos = lib.Clone(v)
			partpos:BreakJoints()
			partpos:ClearAllChildren()
			partpos.Anchored = true
			partpos.CanCollide = false
			partpos.Parent = script
			partpos.Material = "Neon"
			partpos.Color = Color3.new(1,1,1)
			TweenService:Create(partpos,deleteinfo,deleteproperties):Play()
			lib.Destroy(partpos,fadetime)
		end
	end
	hrp.Parent:PivotTo(cf)
	for i,v in pairs(hrp.Parent:GetDescendants()) do
		if v:IsA("BasePart") then
			local partpos = lib.Clone(v)
			partpos:BreakJoints()
			partpos:ClearAllChildren()
			partpos.Anchored = true
			partpos.CanCollide = false
			partpos.Parent = script
			partpos.Material = "Neon"
			partpos.Color = Color3.new(1,1,1)
			TweenService:Create(partpos,deleteinfo,deleteproperties):Play()
			lib.Destroy(partpos,fadetime)
		end
	end
end
local function destroy(part)
	if not table.find(destroyed, part) and part:IsDescendantOf(workspace) then
		table.insert(destroyed, part)
		part:ClearAllChildren()
		local partclone = lib.Clone(part)
		lib.Destroy(part)
		local n = 0
		partclone:BreakJoints()
		partclone.Anchored = true
		partclone.CanCollide = false
		partclone.Material = "Neon"
		partclone.Parent = script
		TweenService:Create(partclone,deleteinfo,{
			Transparency = 1,
			Color = Color3.new(0,0,0),
			Position = partclone.Position + Vector3.new(lib.Utilities.Random(-7, 7).Number, lib.Utilities.Random(-7, 7).Number, lib.Utilities.Random(-7, 7).Number),
			Orientation = partclone.Orientation + Vector3.new(lib.Utilities.Random(-180, 180).Number, lib.Utilities.Random(-180, 180).Number, lib.Utilities.Random(-180, 180).Number)
		}):Play()
		lib.Destroy(partclone, fadetime)
	end
end
remote.OnServerEvent:Connect(function(plr, data)
	if plr == owner then
		if data.Type == "Click" then
			local cf = data.Data
			local multiplier = 1.5
			local size = 5
			local up = data.Origin.upVector * math.random(3,7)
			local right = data.Origin.rightVector * math.random(-6,6)
			local mag = math.clamp((cf.Position - (data.Origin.Position + up + right)).Magnitude,0,1024)
			local hitbox = lib.Create("Part",script,{Position = cf.Position,
				Anchored = true,
				CanCollide = false,
				CanQuery = false,
				Size = Vector3.new(size,size,size),
				Shape = "Ball",
				Material = "Neon",
				Color = Color3.new(1,0,0)})
			local pole = lib.Create("Part",script,{CFrame = (CFrame.lookAt(data.Origin.Position + up + right,cf.Position) * CFrame.new(0,0,-mag / 2)) * CFrame.Angles(0,math.rad(90),0),
				Size = Vector3.new(mag,.75,.75),
				Anchored = true,
				CanCollide = false,
				CanQuery = false,
				Shape = "Cylinder",
				Material = "Neon",
				Color = Color3.new(1,0,0)})
			local poleback = lib.Create("Part",script,{Position = data.Origin.Position + up + right,
				Size = Vector3.new(.75,.75,.75),
				Anchored = true,
				CanCollide = false,
				CanQuery = false,
				Shape = "Ball",
				Material = "Neon",
				Color = Color3.new(1,0,0)})
			local s = lib.Create("Sound",hitbox,{
				SoundId = "rbxassetid://2648568095",
				Volume = multiplier,
				Playing = true})
			TweenService:Create(hitbox,deleteinfo2,{Size = Vector3.new(size,size,size) * multiplier,
				Transparency = 1,
				Color = Color3.new(0,0,0)}):Play()
			TweenService:Create(pole,deleteinfo2,deleteproperties):Play()
			TweenService:Create(poleback,deleteinfo2,deleteproperties):Play()
			lib.Destroy(hitbox,attack_shoot_fadetime)
			lib.Destroy(pole,attack_shoot_fadetime)
			lib.Destroy(poleback
			,attack_shoot_fadetime)
			lib.Destroy(s,attack_shoot_fadetime)
			while task.wait() do
				local inRangeParts = getInRange(filtertab,{Position = hitbox.Position,Radius = (hitbox.Size.X + hitbox.Size.Y + hitbox.Size.Z) / 6})
				for i,v in pairs(inRangeParts) do
					if v ~= workspace:FindFirstChild("Base") then
						destroy(v)
					end
				end
				if hitbox.Parent == nil then
					break
				end
			end
		elseif data.Type == "Teleport" then
			local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
			assert(hrp,"Missing humanoidrootpart")
			local cf = data.Data
			teleport(CFrame.new(cf.Position + Vector3.new(0,4.5,0)) * hrp.CFrame.Rotation,hrp)
		end
	end
end)
local function death()
	filtertab = {script,
		owner.Character}
	local char = owner.Character
	if char then
		local hrp = owner.Character:FindFirstChild("HumanoidRootPart")
		local hum = owner.Character:FindFirstChildOfClass("Humanoid")
		if hrp and hum then
			hum.Died:Connect(function()
				task.wait(.75)
				for i,v in pairs(owner.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						destroy(v)
					end
				end
			end)
		end
	end
end
death()
owner.CharacterAdded:Connect(death)
while task.wait() do
	local char = owner.Character
	if char then
		local hrp = char:FindFirstChild("HumanoidRootPart")
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hrp then
			local radius = 10
			local inRangeParts = getInRange(filtertab,{Position = hrp.Position,Radius = radius})
			for i,v in pairs(inRangeParts) do
				local enemychar = v:FindFirstAncestorOfClass("Model")
				local isenemy = enemychar and enemychar:FindFirstChildOfClass("Humanoid",true)
				if v ~= workspace:FindFirstChild("Base") and not isenemy then
					local lastpos = blocktargets[v.Name]
					if not lastpos then
						blocktargets[v.Name] = v.Position
					else
						local mag = (v.Position - lastpos).Magnitude
						if mag > .3 then
							
							blocktargets[v.Name] = v.Position
						end
					end
				end
			end
		end
	end
end