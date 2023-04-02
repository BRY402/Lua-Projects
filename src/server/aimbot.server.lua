NLS([==[
local max = 50
workspace.CurrentCamera.CameraType = "Track"
game:GetService("RunService").RenderStepped:Connect(function()
	local closest = nil
	local closemag = math.huge
	for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
		if v ~= owner and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and owner.Character and owner.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (v.Character.HumanoidRootPart.Position - owner.Character.HumanoidRootPart.Position).magnitude
			if mag < 50 and mag < closemag then
				closemag = mag
				closest = v
			end
		end
		if v ~= owner and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and workspace.CurrentCamera.CameraSubject and workspace.CurrentCamera.CameraSubject:IsA("BasePart") then
			local mag = (v.Character.HumanoidRootPart.Position - workspace.CurrentCamera.CameraSubject.Position).magnitude
			if mag < 50 and mag < closemag then
				closemag = mag
				closest = v
			end
		end
	end
	if closest then
		workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position,closest.Character.HumanoidRootPart.Position)
	end
end)]==],owner.PlayerGui)