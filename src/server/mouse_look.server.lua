-- mouselook
local r = Instance.new("RemoteEvent",owner)
NLS([==[local r = owner.RemoteEvent
while task.wait() do
	r:FireServer(workspace.CurrentCamera.CFrame)
end]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(plr,hit)
	local anglehrp = owner.Character.HumanoidRootPart.CFrame:ToObjectSpace(hit)
	joints.Neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(anglehrp.LookVector.Y + math.rad(90),math.rad(180),0)
end)
-- UP TO DATE.