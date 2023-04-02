-- posess
NLS([==[local m = owner:GetMouse()
m.Button1Down:Connect(function()
if m.Target then
if m.Target.Parent:IsA("Model") then
if owner:FindFirstChildOfClass("Humanoid") then
if not game.Players:GetPlayerFromCharacter(m.Target.Parent) then
owner.Character = m.Target.Parent
workspace.Camera.CameraSubject = owner.Character:FindFirstChildOfClass("Humanoid")
end
end
end
end
end)]==],owner.PlayerGui)
-- UP TO DATE.