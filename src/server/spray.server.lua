-- spray
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local model = lib.Create("Model", script, {Name = "SprayModel"})
local sprayevent = lib.Create("RemoteEvent", owner, {Name = "SprayEvent"})
local wetinfo = TweenInfo.new(.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local wet = {Reflectance = 0}
local prefix = "-"
NLS([==[mouse = owner:GetMouse()
local caller = workspace:FindFirstChild("]==]..script.Name..[==[")
local remote = owner.SprayEvent
local model = caller.SprayModel
local ray = RaycastParams.new()
ray.FilterType = Enum.RaycastFilterType.Blacklist
ray.IgnoreWater = true
ray.FilterDescendantsInstances = {model}
mouse.Button1Down:Connect(function()
	hold = true
end)
mouse.Button1Up:Connect(function()
	hold = false
end)
while task.wait() do
	if hold then
		local result = workspace:Raycast(workspace.CurrentCamera.CFrame.Position,(mouse.Hit.Position - workspace.CurrentCamera.CFrame.Position) * 5000,ray)
		local mousedata = {
			target = mouse.Target,
			hit = result.Position,
			normal = result.Normal
		}
		remote:FireServer(mousedata)
	end
end]==],owner.PlayerGui)
sprayevent.OnServerEvent:Connect(function(player, data)
	if player == owner then
		local norm = data.normal
		local SprayPaint = lib.Create("Part", model, {
			Reflectance = .1,
			Color = Color3.new(0,0,0),
			Size = Vector3.new(.5,0,.5),
			CFrame = CFrame.new(data.hit) * CFrame.Angles(norm.X, norm.Y, norm.Z),
			Locked = true,
			Anchored = true,
			CanCollide = false,
			CanTouch = false
		})
		dry = ts:Create(SprayPaint,wetinfo,wet)
		dry:Play()
	end
end)
owner.Chatted:Connect(function(msg)
	local smsg = string.split(msg," ")
	if smsg[1] == "/e" then
		table.remove(smsg,1)
	end
	if string.lower(smsg[1]) == prefix.."clear" then
		table.foreach(model:GetChildren(),function(i,v)
			lib.Destroy(v)
		end)
	end
end)
-- UP TO DATE.