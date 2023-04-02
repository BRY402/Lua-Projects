local http = game:GetService("HttpService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local remote = lib.Create("RemoteEvent",owner,{Name = http:GenerateGUID(false)})
NLS([==[local mouse = owner:GetMouse()
local remote = owner:FindFirstChild("]==]..remote.Name..[==[")
mouse.Button1Down:Connect(function()
	local cam = workspace.CurrentCamera
	local target = mouse.Target
	if target and target ~= workspace:FindFirstChild("Base") then
		local unit = (cam.CFrame.Position - mouse.Hit.Position).Unit
		remote:FireServer(target,vec)
	end
end)]==],owner.PlayerGui)
local function split(target,angle)
	task.wait()
	local angle = angle or Vector3.zero
	local p = lib.Create("Part",nil,{Anchored = true,
	CanCollide = false,
	Transparency = 1,
	Size = Vector3.new(1024,1024,1024),
	Orientation = angle})
	local p2 = lib.Clone(p)
	p.Position = target.Position + p.CFrame.upVector * (p.Size.Y / 2)
	p2.Position = target.Position - p2.CFrame.upVector * (p2.Size.Y / 2)
	local result = target:SubtractAsync({p})
	local result2 = target:SubtractAsync({p2})
	result.Parent = target.Parent
	result.Anchored = false
	result2.Parent = target.Parent
	result2.Anchored = false
	lib.Destroy(target)
	return result,result2
end
local function getsplitparts(target,angle)
	local data = {}
	pcall(function()
		local splitp1,splitp2 = split(target,angle)
		table.insert(data,splitp1)
		table.insert(data,splitp2)
	end)
	return data
end
remote.OnServerEvent:Connect(function(plr,target,angle)
	if plr == owner then
		getsplitparts(target,angle)
	end
end)