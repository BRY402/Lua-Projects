local http = game:GetService("HttpService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local refill = loadstring(http:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/refill.lua",true))()
local pr = refill(owner.Character)
table.foreach(owner.Character:GetDescendants(),function(i,v)
	refill(v)
end)
pr.OnDestroy:Connect(function(nc)
	owner.Character = nc
	local hum = nc:FindFirstChildOfClass("Humanoid")
	hum:SetStateEnabled("Dead",false)
	table.foreach(nc:GetDescendants(),function(i,v)
		refill(v)
	end)
	local a = nc:FindFirstChild("Animate")
	if a then
		local ac = lib.Clone(a)
		lib.Destroy(a)
		ac.Parent = nc
	end
	if oc then
		local hrp = oc:FindFirstChild("HumanoidRootPart")
		if hrp then
			nc:PivotTo(hrp.CFrame)
		end
	end
end)
NLS([==[while task.wait() do
	local char = owner.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum:SetStateEnabled("Dead",false)
			workspace.CurrentCamera.CameraSubject = hum
			hum.DisplayName = " "
		end
	end
end]==],owner.PlayerGui)
lib.Loops.forever(function()
	local char = owner.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		local hrp = char:FindFirstChild("HumanoidRootPart")
		char:MakeJoints()
		if hum then
			hum:SetStateEnabled("Dead",false)
			hum.RequiresNeck = false
			hum.BreakJointsOnDeath = false
			hum:BuildRigFromAttachments()
			hum.HipHeight = .001
			hum.Health = hum.Health + 1
		end
		if hrp then
			local rj = hrp:FindFirstChild("RootJoint")
			local t = char:FindFirstChild("Torso") or char:FindFirstChild("LowerTorso")
			if rj and t then
				rj.Part0 = hrp
				rj.Part1 = t
			end
		end
	end
end)