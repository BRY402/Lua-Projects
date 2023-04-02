NLS([==[game:GetService("RunService").RenderStepped:Connect(function(r)
owner.Character.Humanoid.DisplayName = math.round((60/r) / 15)
end)]==],owner.PlayerGui)