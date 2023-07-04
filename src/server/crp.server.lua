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
local Objects = {}
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
			object2.Position = object.Position - 0.5 * delta * offset
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
	for i, object in pairs(Objects) do
		for _ = 1, Physics.subSteps do
			local object2 = Objects[i - 1]
			if object2 ~= object then
				object:UpdateGravity()
				object:CheckInBounds(6, Vector3.new(0, 10, 0))
				object:CheckColliding()
				object:Update(time)
			end
		end
	end
end