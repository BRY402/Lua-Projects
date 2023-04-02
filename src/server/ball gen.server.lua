local http = game:GetService("HttpService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true))()
local radius = 5
local volume = (4 / math.pi) * math.pi * (radius ^ 3)
local blockSize = 1
local mainPart = lib.Create("Part",script,{Anchored = true,
	CanCollide = false,
	Position = Vector3.new(-75,radius,0),
	Size = Vector3.new(blockSize,blockSize,blockSize),
	Color = Color3.new(0,0,0)})
local blockSize = mainPart.Size.X
local numBlocks = math.ceil(volume / (blockSize ^ 3))
local blocks = {}
for x = -radius, radius, blockSize do
	local distance = x
	if distance <= radius then
		lib.Utilities.fastSpawn(function()
			for y = -radius, radius, blockSize do
				local distance = math.sqrt(x ^ 2 + y ^ 2)
				if distance <= radius then
					lib.Utilities.fastSpawn(function()
						for z = -radius, radius, blockSize do
							local distance = math.sqrt(x ^ 2 + y ^ 2 + z ^ 2)
							if distance <= radius and distance >= radius / (4 / math.pi) then
								local block = lib.Create("BoxHandleAdornment",script,{
									Adornee = mainPart,
									Size = Vector3.new(blockSize,blockSize,blockSize),
									CFrame = CFrame.new(x,y,z),
									Color3 = Color3.new(x / radius, y / radius, z / radius)
								})
								table.insert(blocks, {
									Block = block,
									X = x,
									Y = y,
									Z = z,
									Color = block.Color3
									})
							end
							task.wait()
						end
					end)
					task.wait()
				end
			end
		end)
		task.wait()
	end
end
lib.Loops.forever(function()
	mainPart.Orientation = Vector3.new(0,(os.clock() % 360) * radius,0)
end)