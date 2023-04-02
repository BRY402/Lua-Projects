local Utilities = {}
function Utilities.create(arg1,arg2)
local ins = Instance.new(arg1[1],arg1[2])
if not arg1[2] then
ins.Parent = script
end
if arg2 and arg2 ~= true then
for i,v in pairs(arg2) do
ins[tostring(i)] = v
end
end
return ins
end
function Utilities:setProperties(p,arg2)
if arg2 and arg2 ~= true then
for i,v in pairs(arg2) do
p[tostring(i)] = v
end
end
end
local char = owner.Character
local h = char.Head
local t = char.Torso
local la = char["Left Arm"]
local ra = char["Right Arm"]
local ll = char["Left Leg"]
local rl = char["Right Leg"]
char.HumanoidRootPart.CanCollide = true
local meshone = Utilities.create({"SpecialMesh",h},{
Scale = Vector3.new(1.25,1.25,1.25),
MeshType = "FileMesh",
MeshId = "rbxassetid://83001675"
})
local meshtwo = Utilities.create({"SpecialMesh",t},{
MeshType = "FileMesh",
MeshId = "rbxassetid://82907945"
})
local meshthree =Utilities.create({"SpecialMesh",la},{
MeshType = "FileMesh",
MeshId = "rbxassetid://82907977"
})
local meshfour = Utilities.create({"SpecialMesh",ra},{
MeshType = "FileMesh",
MeshId = "rbxassetid://82908019"
})
local meshfive = Utilities.create({"SpecialMesh",ll},{
MeshType = "FileMesh",
MeshId = "rbxassetid://81487640"
})
local meshsix = Utilities.create({"SpecialMesh",rl},{
MeshType = "FileMesh",
MeshId = "rbxassetid://81487710"
})
owner.Character.Humanoid:Destroy()
owner.Character.Hat1.Handle.CanCollide = true
owner.Character.Hat1.Handle.CanTouch = false
for i,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("BasePart") and not v:FindFirstAncestorOfClass("Tool") and not v:FindFirstAncestorOfClass("Accessory") then
v.Touched:Connect(function(p)
if p.Parent:IsA("Tool") and p.Parent.Parent == workspace then
p.Parent.Parent = owner.Character
end
end)
end
end
local nl = NLS([==[local hum = Instance.new("Humanoid",owner.Character)
local uis = game:GetService("UserInputService")
local d = game:GetService("Debris")
local deb = false
local hold = false
hum.Touched:Connect(function(part)
if part:IsA("Seat") then
if not deb then
hum.Sit = true
w = Instance.new("Weld",owner.Character.HumanoidRootPart)
w.Name = "SeatWeld"
w.Part0 = owner.Character.HumanoidRootPart
w.Part1 = part
w.C0 = CFrame.new(0,-2,0)
else
task.wait(6)
deb = false
end
end
end)
hum.Jumping:Connect(function()
if w then
d:AddItem(w,0)
end
end)
uis.InputBegan:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.Space and not c then
	hum.Jump = true
hold = true
while hold do
	hum.Jump = true
	task.wait()
end
end
end)
uis.InputEnded:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.Space and not c then
	hold = false
end
end)]==],owner.PlayerGui)
nl.Name = script.Name
local w = owner.PlayerGui:WaitForChild(script.Name)
if w then
	local anim = owner.Character.Animate
	local newa = anim:Clone()
	anim:Destroy()
	newa.Parent = owner.Character
end
while task.wait() do
for i,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("BasePart") and v:FindFirstAncestorOfClass("Tool") and v.Name == "Handle" then
v.CanTouch = false
end
end
end