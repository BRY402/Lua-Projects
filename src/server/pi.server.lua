-- pi
-- Variables --
local http = game:GetService("HttpService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true))()
local size = 10
local res = 25
local rs = game:GetService("RunService")
local d = game:GetService("Debris")
-- Script --
owner.Chatted:Connect(function(msg)
	local smsg = string.split(msg," ")
	if smsg[1] == "/e" then
		table.remove(smsg,1)
	end
	if smsg[1] == "-res" then
		local pos = owner.Character.HumanoidRootPart.CFrame.Position + owner.Character.HumanoidRootPart.CFrame.lookVector * 4
		res = tonumber(smsg[2])
		for i,v in pairs(script:GetChildren()) do
			d:AddItem(v,0)
		end
		for r = 1,360 / res do
			local vol = size * math.pi * r / res -- Gets the size of the sphere you want * math.pi (sphere) * radius / resolution
			local p = lib.Create("Part",script,{
				Size = Vector3.new(size,size,size),
				Anchored = true,
				CanCollide = false,
				CanQuery = false,
				Position = pos,
				Orientation = Vector3.new(vol,vol,vol)})
			rs.Stepped:wait()
		end
		warn("Finished building.")
	end
end)
