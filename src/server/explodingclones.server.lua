print("ExplodingClonesV1 by MatheusAntunesBr and BRY402")
print("Controls: E - Spawn clone")
print("LeftClick - Clone moves to your mouse position")

local HttpService = game:GetService("HttpService")
local Debris = game:GetService("Debris")
local animate = loadstring(HttpService:GetAsync("https://glot.io/snippets/gfd1olk1x8/raw/main.lua"))()
owner.Character.Archivable = true
local remote = Instance.new("RemoteEvent", owner)
remote.Name = HttpService:GenerateGUID(false)
local touched = false
local cloned = false
local Humanoid
local nls_source = [==[
local UserInputService = game:GetService("UserInputService")
local debounce = false
local remote = owner:FindFirstChild("]==]..remote.Name..[==[")
local mouse = owner:GetMouse()
mouse.Button1Down:Connect(function()
	remote:FireServer("MoveClone", mouse.Hit.Position)
end)
UserInputService.InputBegan:Connect(function(Input, IsTyping)
	if not IsTyping then
		if not debounce then
			debounce = true
			if Input.KeyCode == Enum.KeyCode.E then
				remote:FireServer("CreateClone")
			end
			task.wait(.01)
			debounce = false
		end
	end
end)
]==]
NLS(nls_source, owner:FindFirstChildOfClass("PlayerGui"))
owner.CharacterAdded:Connect(function()
	NLS(nls_source, owner:FindFirstChildOfClass("PlayerGui"))
end)
remote.OnServerEvent:Connect(function(player, type_, ...)
	if player == owner then
		if type_ == "MoveClone" and cloned then
			Humanoid:MoveTo(...)
		elseif type_ == "CreateClone" and not cloned then
			local touched = false
			cloned = true
			print("Cloning..")
			owner.Character.Archivable = true
			local clone = owner.Character:Clone()
			local HumanoidRootPart = clone:FindFirstChild("HumanoidRootPart")
			clone:PivotTo(HumanoidRootPart.CFrame + HumanoidRootPart.CFrame.lookVector * 6)
			Humanoid = clone:FindFirstChildOfClass("Humanoid")
			animate(clone)
			clone.Parent = workspace
			for i, v in pairs(clone:GetDescendants()) do
				if v:IsA("BasePart") then
					v:SetNetworkOwner(owner)
				end
				if i % 10 == 0 then
					task.wait()
				end
			end
			HumanoidRootPart.CanTouch = true
			print("Cloned")
			local connection = HumanoidRootPart.Touched:Connect(function(part)
				if not part:IsDescendantOf(owner.Character) and part.Parent ~= workspace and not touched then
					local explosion = Instance.new("Explosion", part)
					local soundPart = Instance.new("Part", script)
					explosion.Position = part.Position
					soundPart.Position = part.Position
					soundPart.Size = Vector3.zero
					soundPart.Transparency = 1
					soundPart.Anchored = true
					soundPart.CanCollide = false
					soundPart.CanTouch = false
					local sound = Instance.new("Sound", soundPart)
					sound.SoundId = "rbxassetid://5801257793"
					sound.Playing = true
					sound.PlaybackSpeed = Random.new():NextNumber(.8, 1.2)
					sound.Volume = 1.5
					explosion.Hit:Connect(function(part)
						if not part:IsDescendantOf(owner.Character) and part.Parent ~= workspace then
							Debris:AddItem(part:FindFirstAncestorOfClass("Model"), 3)
						end
					end)
					Debris:AddItem(clone, 3)
					Debris:AddItem(part:FindFirstAncestorOfClass("Model"), 3)
					Debris:AddItem(soundPart, sound.TimeLength)
					touched = true
					cloned = false
				end
			end)
		end
	end
end)