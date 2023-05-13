local http = game:GetService("HttpService")
local deb = game:GetService("Debris")
local ts = game:GetService("TweenService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true))()
local info = TweenInfo.new(.25,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0)
local t = lib.Create("Tool",owner.Backpack,{Grip = CFrame.new(0,-.1,.5)})
local hold = false
local am = .5
local cooldown = 5
local bombs = 1
t.Name = "Tnt"
local h = lib.Create("Part",t,{Size = Vector3.new(1,1,1),
Name = "Handle",
CFrame = cf,
Material = Enum.Material.SmoothPlastic,
Color = Color3.new(1,1,1)})
local dt = {Size = h.Size * 3.5}
local side1 = lib.Create("Decal",h,{Face = Enum.NormalId.Front,
Texture = "rbxassetid://5063593771"})
local side2 = lib.Create("Decal",h,{Face = Enum.NormalId.Back,
Texture = "rbxassetid://5063593771"})
local side3 = lib.Create("Decal",h,{Face = Enum.NormalId.Left,
Texture = "rbxassetid://5063593771"})
local side4 = lib.Create("Decal",h,{Face = Enum.NormalId.Right,	
Texture = "rbxassetid://5063593771"})
local side5 = lib.Create("Decal",h,{Face = Enum.NormalId.Top,
Texture = "rbxassetid://2748239465"})
local side6 = lib.Create("Decal",h,{Face = Enum.NormalId.Bottom,
Texture = "rbxassetid://5522035153"})
local function newbomb(cf)
	local Bomb = lib.Create("Part",script,{Size = h.Size * 2.5,
	CFrame = cf,
	Material = Enum.Material.SmoothPlastic,
	Color = Color3.new(1,1,1)})
	local plant = lib.Create("Sound",Bomb,{SoundId = "rbxassetid://11565378",
	PlaybackSpeed = 1.25,
	Volume = 2})
	local explodesfx = lib.Create("Sound",Bomb,{SoundId = "rbxassetid://535689258",
	Volume = 3,
	PlayOnRemove = true,
	PlaybackSpeed = .7})
	plant:Play()
	local side1 = lib.Create("Decal",Bomb,{Face = Enum.NormalId.Front,
	Texture = "rbxassetid://5063593771"})
	local side2 = lib.Create("Decal",Bomb,{Face = Enum.NormalId.Back,
	Texture = "rbxassetid://5063593771"})
	local side3 = lib.Create("Decal",Bomb,{Face = Enum.NormalId.Left,
	Texture = "rbxassetid://5063593771"})
	local side4 = lib.Create("Decal",Bomb,{Face = Enum.NormalId.Right,	
	Texture = "rbxassetid://5063593771"})
	local side5 = lib.Create("Decal",Bomb,{Face = Enum.NormalId.Top,
	Texture = "rbxassetid://2748239465"})
	local side6 = lib.Create("Decal",Bomb,{Face = Enum.NormalId.Bottom,
	Texture = "rbxassetid://5522035153"})
	deb:AddItem(Bomb,cooldown)
	task.spawn(function()
		for i = 1,cooldown,am do
			if i ~= am then
				if i == cooldown - am then
					ts:Create(Bomb,info,dt):Play()
				end
				local st = side1.Transparency == 1 and 0 or 1
				side1.Transparency = st
				side2.Transparency = st
				side3.Transparency = st
				side4.Transparency = st
				side5.Transparency = st
				side6.Transparency = st
				task.wait(am)
			end
		end
		local exp = lib.Create("Explosion",script,{Position = Bomb.Position,
			Visible = true,
			BlastPressure = 2500000 + (100000 * h.Size.magnitude),
			BlastRadius = 10 + h.Size.magnitude / 7.5})
		exp.Hit:Connect(function(p)
			if p.Size.magnitude <= 10 then
				p.Anchored = false
			end
		end)
	end)
end
t.Activated:Connect(function()
	hold = true
	lib.Loops.range(1, bombs, 1, function(i)
		newbomb(h.CFrame)
	end)
end)
t.Deactivated:Connect(function()
	hold = false
end)
while task.wait() do
	local ff = owner.Character:FindFirstChildOfClass("ForceField")
	if not ff then
		lib.Create("ForceField",owner.Character,{Visible = false})
	end
	if hold then
		lib.Loops.range(1, bombs, 1, function(i)
			newbomb(h.CFrame)
		end)
	end
end