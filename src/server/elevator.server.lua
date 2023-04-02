script.Parent = workspace
local http = game:GetService("HttpService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true))()
local Force = 0
local Floor = lib.Create("Part",script, {
	Name = "Floor",
	Material = "Concrete",
	Anchored = true,
	Size = Vector3.new(50,1,50),
	Position = Vector3.new(0,0,-75),
	Color = Color3.new(.3,.3,.3),
	CustomPhysicalProperties = PhysicalProperties.new(math.huge,math.huge,math.huge,math.huge,math.huge)
})
local function MakeWall(offsetPos,offsetRot,size)
	local offsetPos, offsetRot, size = offsetPos and offsetPos or Vector3.zero, offsetRot and offsetRot or Vector3.zero, size and size or Vector3.one
	local Wall = lib.Create("Part",script, {
		CanPropertyYield = true,
		Name = "Wall",
		Material = "Concrete",
		Size = size,
		Position = Floor.Position + offsetPos,
		Orientation = Floor.Orientation + offsetRot,
		Color = Color3.new(1,1,0)})
		local Weld = lib.Create("Weld",Wall,{Part0 = Floor,
		Part1 = Wall
	})
	Weld.C0 = (CFrame.new(offsetPos) * CFrame.Angles(math.rad(offsetRot.X),math.rad(offsetRot.Y),math.rad(offsetRot.Z)))
	return Wall
end
local Roof = MakeWall(Vector3.new(0,20,0),Vector3.zero,Floor.Size)
Roof.Name = "Roof"
Roof.Color = Floor.Color
MakeWall(Vector3.new(0,10,-(Floor.Size.Z / 2) + .5),Vector3.zero,Vector3.new(50,19,1))
MakeWall(Vector3.new(0,10,(Floor.Size.Z / 2) - .5),Vector3.zero,Vector3.new(50,19,1))
MakeWall(Vector3.new(-(Floor.Size.X / 2) + .5,10,0),Vector3.zero,Vector3.new(1,19,50))
owner.Chatted:Connect(function(msg)
	local smsg = string.split(msg," ")
	if smsg[1] == "/e" then
		table.remove(smsg,1)
	end
	if smsg[1] == "-vel" then
		Force = tonumber(smsg[2]) or 0
	end
end)
while task.wait() do
	Floor.Position = Floor.Position + Vector3.new(0, Force / 10, 0)
end