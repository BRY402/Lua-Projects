for i,v in pairs(owner.Character:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Massless = true
	end
end