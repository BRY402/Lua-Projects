local http = game:GetService("HttpService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local r = lib.Create("RemoteEvent",owner,{Name = "ParachuteRemote"})
NLS([==[local r = owner.ParachuteRemote
local par = false
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
uis.InputBegan:Connect(function(inp,c)
	if inp.KeyCode == Enum.KeyCode.P and not c then
		par = not par
	end
end)
rs.RenderStepped:Connect(function()
	if par then
		local vel = owner.Character.HumanoidRootPart.AssemblyLinearVelocity
		owner.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(vel.X,math.clamp(vel.Y,-30,math.huge),vel.Z)
		if vel.Y >= -30 and vel.Y < 1 then
			r:FireServer(true)
		else
			r:FireServer(false)
		end
	end
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(plr,isparachuting)
	if plr == owner then
		print(isparachuting)
		if isparachuting then
			if not parachute or parachute.Parent == nil then
				local char = owner.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				parachute = lib.Create("Part",owner.Character,{Name = "Parachute",
				Color = Color3.new(25,25,25),
				CanCollide = false,
				Position = hrp and hrp.Position or Vector3.zero})
				local w = lib.Create("Weld",p,{Part0 = p,
				Part1 = hrp})
				local m = lib.Create("SpecialMesh",parachute,{MeshType = "FileMesh",
				MeshId = "rbxassetid:/*/5199112771"})
			end
		elseif parachute then
			lib.Destroy(parachute)
		end
	end
end)