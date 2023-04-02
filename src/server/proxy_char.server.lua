-- proxy_char
-- Variables --
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
local d = game:GetService("Debris")
local world = Utilities.create({"WorldModel"})
local model = Utilities.create({"Model",world})
local r = Utilities.create({"RemoteEvent"},{
Name = "ProxyEvent"
})
local h = Utilities.create({"SpawnLocation",model},{
Anchored = true,
Enabled = false,
Size = Vector3.new(2,1,1),
Name = "Head",
BrickColor = BrickColor.new("New Yeller")
})
local t = Utilities.create({"SpawnLocation",model},{
Anchored = true,
Enabled = false,
Size = Vector3.new(2,2,1),
Name = "Torso",
BrickColor = BrickColor.new("CGA brown")
})
local la = Utilities.create({"SpawnLocation",model},{
Anchored = true,
Enabled = false,
Size = Vector3.new(1,2,1),
Name = "Left Arm",
BrickColor = BrickColor.new("Really red")
})
local ra = Utilities.create({"SpawnLocation",model},{
Anchored = true,
Enabled = false,
Size = Vector3.new(1,2,1),
Name = "Right Arm",
BrickColor = BrickColor.new("Toothpaste")
})
local ll = Utilities.create({"SpawnLocation",model},{
Anchored = true,
Enabled = false,
Size = Vector3.new(1,2,1),
Name = "Left Leg",
BrickColor = BrickColor.new("Dark green")
})
local rl = Utilities.create({"SpawnLocation",model},{
Anchored = true,
Enabled = false,
Size = Vector3.new(1,2,1),
Name = "Right Leg",
BrickColor = BrickColor.new("Deep orange")
})
local hat = Utilities.create({"Accessory",model},{
Name = "Hat1",
})
local handle = Utilities.create({"SpawnLocation",hat},{
Anchored = true,
Enabled = false,
Size = Vector3.new(1,1,2),
Name = "Handle"
})
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
local meshseven = Utilities.create({"SpecialMesh",handle},{
MeshId = "rbxassetid://81504052",
TextureId = "rbxassetid://81504106"
})
local face = Utilities.create({"Decal",h},{
Name = "face",
Face = "Front",
Texture = "rbxassetid://83017063"
})
local tshirt = Utilities.create({"Decal",t},{
Name = "roblox",
Face = "Front",
Texture = "rbxassetid://5473515576"
})
-- Properties --
Utilities:setProperties(script,{
Name = "pc"
})
-- Script --
while task.wait() do
pcall(function()
for i,v in pairs(model:GetChildren()) do
if v:IsA("BasePart") then
Utilities:setProperties(v,{
CFrame = owner.Character[v.Name].CFrame
})
Utilities:setProperties(handle,{
CFrame = owner.Character.Hat1.Handle.CFrame
})
end
end
end)
end
-- UP TO DATE.