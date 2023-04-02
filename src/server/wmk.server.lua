-- wmk
local tool = Instance.new("Tool",owner.Backpack)
local handle = Instance.new("Part",tool)
local remote = Instance.new("RemoteEvent",handle)
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local params = OverlapParams.new()
params.FilterDescendantsInstances = {owner.Character}
tool:SetAttribute("Cooldown",false)
remote.Name = HttpService:GenerateGUID()
handle.Size = Vector3.new(1,1,1)
handle.Name = "Handle"
NLS([==[local remote = script.Parent.Handle:FindFirstChild("]==]..remote.Name..[==[")
local tool = script.Parent
local mouse = owner:GetMouse()
tool.Activated:Connect(function()
	--if mouse.Target then
		remote:FireServer(mouse.Hit.Position)
	--end
end)]==],tool)
remote.OnServerEvent:Connect(function(plr,pos)
	if tool:GetAttribute("Cooldown") == false then
		tool:SetAttribute("Cooldown",true)
		local posi = handle.Position
		repeat
			local mag = (posi - pos).magnitude
			local num = math.clamp(mag / 15, 2, 5)
			local part = Instance.new("Part", script)
			part.Anchored = true
			part.Size = Vector3.new(.45,.45,num)
			--part.Material = "Neon"
			part.CanCollide = false
			part.Color = Color3.new(1,1,1)
			part.CFrame = CFrame.lookAt(posi, pos + Vector3.new(math.random(-25, 25), math.random(-17.5, 25), math.random(-25, 25)) * mag / 15):Lerp(CFrame.lookAt(posi, pos), math.random()) * CFrame.new(0, 0, -(part.Size.Z / 2))
			posi = part.Position + part.CFrame.lookVector * num / 2
			task.wait()
		until (posi - pos).magnitude <= 1
		local attack = Instance.new("SpawnLocation",script)
		attack.Enabled = false
		attack.Anchored = true
		attack.Size = Vector3.new(5,5,5)
		attack.Shape = "Ball"
		attack.Material = "Neon"
		attack.CanCollide = false
		attack.Color = Color3.new(1,1,1)
		attack.Position = pos
	end
end)
tool:GetAttributeChangedSignal("Cooldown"):Connect(function()
	if tool:GetAttribute("Cooldown") == true then
		task.wait(1.5)
		tool:SetAttribute("Cooldown",false)
	end
end)