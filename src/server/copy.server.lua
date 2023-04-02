-- copy
local chat = game:GetService("Chat")
local pe = Instance.new("RemoteEvent",owner.PlayerGui)
NLS([==[local mouse = owner:GetMouse()
mouse.Button1Down:Connect(function()
if mouse.Target then
target = mouse.Target
if target.Parent:FindFirstChildOfClass("Humanoid") then
if target.Parent:FindFirstChild("Head") then
owner.PlayerGui.RemoteEvent:FireServer(player,target)
end
end
end
end)
while task.wait() do
workspace.Camera.CameraSubject = owner.Character.Humanoid
end]==],owner.PlayerGui)
pe.OnServerEvent:Connect(function(player,target)
anim = false
target.Parent.Archivable = true
char = target.Parent:Clone()
target.Parent.Archivable = false
char.Parent = script
if target.Parent:FindFirstChild("Animate") then
anim = target.Parent.Animate:Clone()
end
if char:FindFirstChild("Animate") then
char.Animate:Destroy()
end
owner.Character = char
local charn = game:GetService("Players"):GetPlayerFromCharacter(target.Parent)
if charn then
for i, a in pairs(charn.Backpack:GetChildren()) do
if a:IsA("Tool") then
local ac = a:Clone()
ac.Parent = owner.Backpack
end
end
end
if not anim then
success, failure = pcall(function()
anim = target.Parent.Animate:Clone()
anim.Parent = owner.Character
end)
end
if failure then
print("Error while getting "..target.Parent.Name.."'s animations.")
end
local success, failure = pcall(function()
anim.Parent = owner.Character
end)
if success then
print("Animations loaded successfully!")
end
end)

-- UPDATE!