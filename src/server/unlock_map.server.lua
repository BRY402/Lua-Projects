local map = workspace:FindFirstChild("Map")
if map then
	for i, v in pairs(map:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Locked = false
		end
		if i % 10 == 0 then
			task.wait()
		end
	end
	print("Finished unlocking map.")
else
	warn("No map found.")
end