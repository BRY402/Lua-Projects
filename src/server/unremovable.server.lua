loadstring([==[
local killed = false
local Connection
local Part = Instance.new("Part")
Part.Anchored = true
Part.Archivable = true
Part.Size = Vector3.new(6, 7.5, 1)
Part.Position = Vector3.new(0, 4, 75)
Part.Name = "SB_Real"
local Properties = {
	Anchored = Part.Anchored,
	Size = Part.Size,
	Position = Part.Position,
	Name = Part.Name,
	Transparency = Part.Transparency,
	CanCollide = Part.CanCollide
}
local function protect(Property)
	if not killed then
		if Connection then
			Connection:Disconnect()
		end
		Part:Destroy()
		Part.Archivable = true
		Part = Part:Clone()
		Part[Property] = Properties[Property]
		Part.Parent = workspace
		Connection = Part.Changed:Connect(protect)
	else
		if Connection then
			Connection:Disconnect()
		end
	end
end
Part.Parent = workspace
Connection = Part.Changed:Connect(protect)
owner.Chatted:Connect(function(msg)
	killed = msg == "!kill"
end)
]==])