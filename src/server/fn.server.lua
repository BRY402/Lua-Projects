owner.Character.Humanoid.RequiresNeck = false
if owner.Character:FindFirstChild("Head") then
owner.Character.Head:Destroy()
end
local part = Instance.new("Part",owner.Character)
local part2 = Instance.new("Part",part)
local mesh = Instance.new("SpecialMesh",part)
local mesh2 = Instance.new("SpecialMesh",part2)
local weld = Instance.new("Weld",part)
local s = Instance.new("Sound",part)
local laugh = true
part.CanCollide = false
part.Size = Vector3.new(1.5,1.5,1.5)
part2.Size = Vector3.new(0.5,0.5,0.5)
part2.CanCollide = false
s.SoundId = "rbxassetid://474545527"
s.Volume = 10
mesh.MeshId = "rbxassetid://5005179259"
mesh.TextureId = "rbxassetid://7577054872"
mesh.VertexColor = Vector3.new(240/255, 229/255, 197/255)
mesh2.MeshId = "rbxassetid://5057130453"
mesh2.TextureId = "rbxassetid://7577054872"
mesh2.VertexColor = Vector3.new(240/255, 229/255, 197/255)
mesh2.Scale = Vector3.new(0.75,0.75,0.7)
weld.Part0 = part2
weld.Part1 = part
weld.C1 = CFrame.new(0.125,-0.25,0) * CFrame.Angles(0,math.rad(90),0)
weld.C0 = CFrame.new(0,0.5,-0.125) * CFrame.Angles(math.rad(0),0,0)
owner.Character.Torso.Neck.Part1 = part2
owner.Character.Torso.Neck.C0 = CFrame.new(0,.75,-.25) * CFrame.Angles(-math.rad(90),0,0)
s:Play()
s.Ended:Connect(function()
local pos = owner.Character.WorldPivot
owner:LoadCharacter()
owner.Character:PivotTo(pos)
laugh = false
end)
while laugh do
weld.C0 = CFrame.new(0,0.5,-0.125) * CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
owner.Character.Torso.Neck.C0 = CFrame.new(0,.75,-.25) * CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
task.wait()
end