-- track
ts = game:GetService("TweenService")
info = TweenInfo.new(.01,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
f = Instance.new("RemoteEvent",owner.Character)
owner.Character.Humanoid.RequiresNeck = false
owner.Character.Torso.Neck:Destroy()
h = owner.Character.Head
h.Anchored = true
NLS([==[local mouse = owner:GetMouse() local char = owner.Character while wait() do hit = mouse.Hit owner.Character.RemoteEvent:FireServer(hit,owner) end]==],owner.Character)
f.OnServerEvent:Connect(function(player,hit)
pos = owner.Character.Torso.Position + Vector3.new(0,1.5,0)
cf = {CFrame = CFrame.new(pos,hit.Position)}
cfc = ts:Create(h,info,cf)
cfc:Play()
end)
-- UP TO DATE.