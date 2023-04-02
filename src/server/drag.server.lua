local r = Instance.new("RemoteEvent",script)
script.Name = "Drag"
NLS([==[local run = game:GetService("RunService")
local drag = workspace.Drag
local r = drag.RemoteEvent
local m = owner:GetMouse()
local hold = false
local box = Instance.new("SelectionBox",script)
box.LineThickness = .001
local t = {}
local a = false
m.Button1Down:Connect(function()
	local s, f = pcall(function()
		if m.Target and m.Target.Name ~= "Base" and not m.Target.Anchored then
			a = false
			hold = true
			t = {
				hit = m.Hit,
				target = m.Target,
				b = Instance.new("BodyPosition",m.Target)
			}
			m.TargetFilter = t.target.Parent
			if t.target:FindFirstAncestorOfClass("Accessory") or t.target:FindFirstAncestorOfClass("Tool") then
				t.target.Parent.Parent = workspace
			end
			t.b.Position = t.hit.Position
			t.b.MaxForce = Vector3.one*math.huge
			r:FireServer(t)
			repeat 
				t.hit = m.Hit
				t.b.Position = t.hit.Position
				r:FireServer(t)
				task.wait()
			until not hold
		else
			a = true
		end
	end)
end)
m.Button1Up:Connect(function()
	hold = false
	if a then return end
	m.TargetFilter = owner.Character
	if t.b.Parent ~= nil then -- error line
		t.b.Parent = owner
	else
		local b = Instance.new("BodyPosition",owner)
		t.b = b
	end
	r:FireServer(t,true)
end)
m.Move:Connect(function()
	box.Adornee = m.Target
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(owner,t,a)
	if not a then
		t.target:SetNetworkOwner(owner)
	else
		if game:GetService("Players"):GetPlayerFromCharacter(t.target:FindFirstAncestorOfClass("Model")) then
			t.target:SetNetworkOwner(game:GetService("Players"):GetPlayerFromCharacter(t.target:FindFirstAncestorOfClass("Model")))
		else
			t.target:SetNetworkOwnershipAuto()
		end
	end
end)
-- UP TO DATE.