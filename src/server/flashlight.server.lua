local d = game:GetService("Debris")
function newfl()
local f = Instance.new("Tool",owner.Backpack)
local h = Instance.new("Part",f)
local m = Instance.new("SpecialMesh",h)
local l = Instance.new("SpotLight",h)
f.Name = "Flashlight"
f.Grip = CFrame.new(.1,-.25,1)
h.Name = "Handle"
h.Size = Vector3.new(1,1,1)
l.Range = 50
l.Brightness = 2.5
l.Enabled = false
m.MeshType = "FileMesh"
m.MeshId = "rbxassetid://115955313"
m.TextureId = "rbxassetid://115984370"
local onClick = f.Activated:Connect(function()
l.Enabled = not l.Enabled
end)
return f,h,m,l,onClick
end
local f,h,m,l,onClick = newfl()
owner.CharacterAdded:Connect(function()
d:AddItem(f,0)
d:AddItem(h,0)
d:AddItem(m,0)
d:AddItem(l,0)
onClick:Disconnect()
f,h,m,l,onClick = newfl()
end)