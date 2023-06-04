-- @stick
local nls_source = [==[local RunService = game:GetService("RunService")
local lastPart = nil
local lastCFrame = CFrame.identity
local params = RaycastParams.new()
params.RespectCanCollide = true
params.FilterDescendantsInstances = {owner.Character}
RunService.PreSimulation:Connect(function(delta)
	local Character = owner.Character
	local Camera = workspace.CurrentCamera
	if Character then
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		if HumanoidRootPart then
			if lastPart then
				local currentCFrame = lastPart.CFrame
				local difference = currentCFrame:Inverse() * lastCFrame
				HumanoidRootPart.CFrame = difference:ToObjectSpace(HumanoidRootPart.CFrame) - Vector3.new(currentCFrame.Position.X, 0, currentCFrame.Position.Z)
				if Camera then
					Camera.CFrame = difference.Rotation:ToObjectSpace(Camera.CFrame)
				end
			end
			local result = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -15, 0), params)
			if result then
				lastPart = result.Instance
				lastCFrame = lastPart.CFrame
			else
				lastPart = nil
			end
		end
	end
	params.FilterDescendantsInstances = {owner.Character}
end)]==]
NLS(nls_source, owner:FindFirstChildOfClass("PlayerGui"))
owner.CharacterAdded:Connect(function()
	NLS(nls_source, owner:FindFirstChildOfClass("PlayerGui"))
end)
local part = Instance.new("Part")
local part2 = Instance.new("Part")
local part3 = Instance.new("Part")
part.Anchored = true
part2.Anchored = true
part3.Anchored = true
part.Size = Vector3.new(50, 1, 50)
part2.Size = Vector3.new(50, 1, 50)
part3.Size = Vector3.new(50, 1, 50)
part.Parent = script
part2.Parent = script
part3.Parent = script
local n = 0
while true do
	n = n + .25
	part.CFrame = CFrame.new(-100, 2 + math.sin(os.clock()), 0) * CFrame.Angles(0, math.rad(n), 0)
	part2.CFrame = CFrame.new(0, 2 + math.sin(os.clock()), 0) * CFrame.Angles(0, math.rad(n), 0)
	part3.CFrame = CFrame.new(100, 2 + math.sin(os.clock()), 0) * CFrame.Angles(0, math.rad(n), 0)
	task.wait()
end