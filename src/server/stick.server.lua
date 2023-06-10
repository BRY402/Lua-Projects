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
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if HumanoidRootPart and Humanoid and not Humanoid.SeatPart then
            if lastPart then
                local currentCFrame = lastPart.CFrame
                local difference = currentCFrame * lastCFrame:Inverse()
                HumanoidRootPart.CFrame = difference:ToWorldSpace(HumanoidRootPart.CFrame)
                if Camera then
                    Camera.CFrame = difference.Rotation:ToWorldSpace(Camera.CFrame)
                end
            end
            local result = workspace:Spherecast(HumanoidRootPart.Position, 1, Vector3.new(0, -15, 0), params)
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
