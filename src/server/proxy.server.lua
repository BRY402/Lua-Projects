-- proxy
NLS([==[local m = owner:GetMouse()
local uis = game:GetService("UserInputService")
local real = owner.Character
owner.Character.Archivable = true
local char = owner.Character:Clone()
owner.Character.Archivable = false
owner.Character = char
char.Parent = workspace.proxy
uis.InputBegan:Connect(function(input, cant)
if input.KeyCode == Enum.KeyCode.Q and not cant then
owner.Character = real
workspace.CurrentCamera.CameraSubject = real:FindFirstChildOfClass("Humanoid")
end
if input.KeyCode == Enum.KeyCode.E and not cant then
owner.Character = char
workspace.CurrentCamera.CameraSubject = char:FindFirstChildOfClass("Humanoid")
end
end)]==],owner.PlayerGui)
-- UP TO DATE.