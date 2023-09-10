local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua",true))()
local World = lib.Create("WorldModel", script)
local PART_VisualHandler = lib.Create("Part", World, {
	Size = Vector3.new(0,0,0),
	Transparency = 1,
	CanCollide = false,
	CanQuery = false,
	Anchored = false
})
local DEFAULT_GRAVITY = 196.1999969482422
local Physics = {
	Gravity = DEFAULT_GRAVITY,
	subSteps = 1
}
local Simulation = {
	MaxSimulationX = 100,
	MaxSimulationY = 100,
	MaxSimulationZ = 100,
	Cells = {}
}
function Simulation:CheckCellColliding(cell1, cell2, deltaTime)
	if cell1 ~= cell2 then
		for i, object1 in pairs(cell1) do
			for i, object2 in pairs(cell2) do
				object1:CheckColliding(object2)
				object1:UpdatePosition(deltaTime)
			end
		end
	end
end
function Simulation:FindCollisions(deltaTime)
	for x = 1, Simulation.MaxSimulationX do
		if not Simulation.Cells[x] then
			Simulation.Cells[x] = {}
		end
		if x % 10 == 0 then
			task.wait()
		end
		for y = 1, Simulation.MaxSimulationY do
			if not Simulation.Cells[x][y] then
				Simulation.Cells[x][y] = {}
			end
			if y % 10 == 0 then
				task.wait()
			end
			for z = 1, Simulation.MaxSimulationZ do
				if not Simulation.Cells[x][y][z] then
					Simulation.Cells[x][y][z] = {Objects = {}}
				end
				if z % 10 == 0 then
					task.wait()
				end
				local cell = Simulation.Cells[x][y][z]
				for dx = -1, 1 do
					for dy = -1, 1 do
						for dz = -1, 1 do
							local cell2 = Simulation.Cells[math.clamp(x + dx, 1, Simulation.MaxSimulationX)][math.clamp(y + dy, 1, MaxSimulationY)][math.clamp(z + dz, 1, MaxSimulationZ)]
							if cell ~= cell2 then
								--function Simulation:CheckCellColliding(cell, cell2, deltaTime)
								Simulation:CheckCellColliding(cell, cell2, deltaTime)
							end
						end
					end
				end
			end
		end
	end
end
local RawObj = {new = function()
	local instance = lib.Create("BoxHandleAdornment", PART_VisualHandler)
	instance = Vector3.one
	local object = {
		Position = Vector3.zero,
		LastPosition = Vector3.zero,
		Acceleration = Vector3.zero,
		Radius = 1
	}
	function object:Update(deltaTime)
		object:UpdateGravity()
		object:UpdatePosition(deltaTime)
		local lastPosition = object.LastPosition
		local position = object.Position
		if Simulation.Cells[lastPosition.X] then
			local x = Simulation.Cells[lastPosition.X]
			if x[lastPosition.Y] then
				local y = x[lastPosition.Y]
				if y[lastPosition.Z] then
					local z = y[lastPosition.Z]
					table.remove(z.Objects, table.find(z.Objects, object))
				end
			end
		end
		if not Simulation.Cells[position.X] then
			Simulation.Cells[position.X] = {}
			local x = Simulation.Cells[position.X]
			if not x[position.Y] then
				x[position.Y] = {}
				local y = x[position.Y]
				if not y[position.Z] then
					y[position.Z] = {}
					local z = y[position.Z]
					z.Objects = {}
					table.insert(z.Objects, object)
				end
			end
		end
	end
	function object:UpdatePosition(deltaTime)
		instance.CFrame = CFrame.new(object.Position)
		local velocity = object.Position - object.LastPosition
		object.LastPosition = object.Position
		object.Position = object.Position + velocity + object.Acceleration * deltaTime ^ 2
		object.Acceleration = Vector3.zero
	end
	function object:ApplyAcceleration(direction)
		object.Acceleration = object.Acceleration + direction
	end
	function object:UpdateGravity()
		object:ApplyAcceleration(Vector3.new(0, Physics.Gravity / DEFAULT_GRAVITY, 0))
	end
	function object:CheckInBounds(radius, position)
		local direction = (object.Position - position)
		local distance = direction.Magnitude
		if distance > radius - object.Radius then
			local offset = direction / distance
			object.Position = position + offset * (distance - object.Radius)
		end
	end
	function object:CheckColliding(object2)
		local direction = (object.Position - object2.Position)
		local distance = direction.Magnitude
		local minimumDistance = object.Radius + object2.Radius
		if distance < minimumDistance then
			local offset = direction / distance
			local delta = minimumDistance - distance
			object.Position = object.Position + 0.5 * delta * offset
			object2.Position = object2.Position - 0.5 * delta * offset
		end
	end
	function object:Chain(object2, targetDistance)
		local targetDistance = targetDistance or (object.Radius + object2.Radius) / 2
		local direction = (object.Position - object2.Position)
		local distance = direction.Magnitude
		local offset = direction / distance
		local delta = targetDistance - distance
		object.Position = object.Position + 0.5 * delta * offset
		object2.Position = object2.Position - 0.5 * delta * offset
	end
	return object
end}
local object = RawObj.new()
object.Position = Vector3.new(0, 15, 0)
object:UpdatePosition(0)
while true do
	local time = task.wait()
	
	--[[for _ = 1, Physics.subSteps do
		object:UpdateGravity()
		object:CheckInBounds(6, Vector3.new(0, 10, 0))
		object:CheckColliding()
		object:Update(time)
	end]]
end