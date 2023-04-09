local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua",true))()
local World = lib.Create("WorldModel",script)
local PART_VisualHandler = lib.Create("Part",World,{
	Size = Vector3.new(0,0,0),
	Transparency = 1,
	CanCollide = false,
	CanQuery = false,
	Anchored = false
})
local DEFAULT_GRAVITY = 196.1999969482422
local Physics = {
	Gravity = DEFAULT_GRAVITY
}
local function newRegion(min, max)
	local size = max + min
	local position = size / 2
	return {
		Size = size,
		Position = position,
		FilterInstances = {}
	}
end
local function IsInBounds(Position1, Position2, Size)
	local positionMag = (Position1 - Position2).Magnitude
	local sizeMag = (size / 2).Magnitude
	return positionMag <= sizeMag
end
local Object = {Objects = {}}
function Physics:SetGravity(Gravity)
	self.Gravity = Gravity or DEFAULT_GRAVITY
end
function Physics:UpdateObjectCFrame(obj)
	local X, Y, Z = obj.CFrame:ToOrientation()
	local X, Y, Z = X / 90, Y / 90, Z / 90
	obj.Position = obj.Position + Vector3.new((obj.Velocity.X / 3) + X, -(obj.Velocity.Y / 16) - Y, (obj.Velocity.Z / 3) + Z)
	obj.Orientation = obj.Orientation + Vector3.new(obj.RotVelocity.X / 3, obj.RotVelocity.Y / 3, obj.RotVelocity.Z / 3)
end
function Physics:UpdateGravity(obj)
	obj:ApplyForce(Vector3.yAxis * (Physics.Gravity / DEFAULT_GRAVITY) / 50)
end
function Physics:GetPartsInBounds(bounds)
	local inBounds = {}
	lib.Loops.read(Object.Objects, function(index, value)
		if value ~= bounds then
			if bounds.ClassName == "Object" then
				if IsInBounds(bounds.Position, value.Position, bounds.Size) and IsInBounds(value.Position, bounds.Position, value.Size) then
					table.insert(inBounds, value)
				end
			elseif not bounds.ClassName then
				if IsInBounds(bounds.Position, value.Position, bounds.Size) and IsInBounds(value.Position, bounds.Position, value.Size) and not table.find(bounds.Filter, value) then
					table.insert(inBounds, value)
				end
			end
		end
	end)
	return inBounds
end
function Physics:IsColliding(Part1, Part2)
	return IsInBounds(Part1.Position, Part2.Position, Part1.Size) and IsInBounds(Part2.Position, Part1.Position, Part2.Size)
end
function Physics:Raycast(startpos, endpos, ignorelist)
	local unit = (startpos - endpos).Unit
	local mag = (startpos - endpos).Magnitude
	local closest = nil
	local closestmag = math.huge
	lib.Loops.read(Object.Objects, function(index, value)
		local currentmag = (startpos - value.Position).Magnitude
		if currentmag < closestmag and IsInBounds(value.Position, startpos + unit * currentmag, value.Size) and not table.find(ignorelist, value) then
			closestmag = currentmag
			closest = value
		end
	end)
	if closest then
		return {
			Instance = closest,
			Position = startpos + unit * closestmag
		}
	end
end
function Physics:UpdateObject(obj)
	obj.RotVelocity = obj.RotVelocity - obj.RotVelocity / Physics.Gravity
	local collidingObjects = obj:GetCollidingObjects()
	if #collidingObjects > 0 then
		lib.Loops.read(collidingObjects, function(index, value)
			local unit = (value.Position + obj.Position).Unit
			local mag = (obj.Position - value.Position).Magnitude
			obj.Position = obj.Position + unit * mag
			obj.Velocity = Vector3.new(obj.Velocity.X, -math.abs(obj.Velocity.Y / 2), obj.Velocity.Z)
			Physics:UpdateObjectCFrame(obj)
		end)
	else
		Physics:UpdateGravity(obj)
		Physics:UpdateObjectCFrame(obj)
	end
end
local function checkValidType(Index, Value, Type)
	local value_type = typeof(Value)
	assert(value_type == Type, "Unable to assing property "..Index..". "..Type.." expected, got "..value_type)
end
Object.new = function()
	local Part = lib.Create("BoxHandleAdornment",World,{
		Adornee = PART_VisualHandler,
		CFrame = CFrame.new(-PART_VisualHandler.Position)
	})
	local extra_proterties = {
		Velocity = Vector3.zero,
		RotVelocity = Vector3.zero,
		ClassName = "Object"
	}
	function extra_proterties:GetCollidingObjects()
		local colliding = {}
		lib.Loops.read(Object.Objects, function(index, value)
			if value ~= Part then
				local isColliding = Physics:IsColliding(extra_proterties, value)
				if isColliding then
					table.insert(colliding, value)
				end
			end
		end)
		return colliding
	end
	function extra_proterties:ApplyForce(Force)
		checkValidType("Velocity", Force, "Vector3")
		extra_proterties.Velocity = extra_proterties.Velocity + Force
	end
	local New = setmetatable(extra_proterties,{
		__index = function(self, index)
			local value = rawget(self, index)
			if value then
				return value
			elseif index == "CFrame" then
				return Part.CFrame - PART_VisualHandler.Position
			elseif index == "Position" then
				return Part.CFrame.Position - PART_VisualHandler.Position
			elseif index == "Orientation" then
				local X, Y, Z = Part.CFrame.Rotation:ToOrientation()
				return Vector3.new(math.deg(X), math.deg(Y), math.deg(Z))
			elseif index == "Size" then
				return Part.Size
			end
		end,
		__newindex = function(self, index, value)
			if index == "CFrame" then
				Part.CFrame = value - PART_VisualHandler.Position
			elseif index == "Position" then
				Part.CFrame = CFrame.new(value - PART_VisualHandler.Position) * Part.CFrame.Rotation
			elseif index == "Orientation" then
				Part.CFrame = CFrame.new(Part.CFrame.Position) * CFrame.Angles(math.rad(value.X), math.rad(value.Y), math.rad(value.Z))
			elseif index == "Velocity" then
				checkValidType(index, value, "Vector3")
				rawset(self, index, value)
			elseif index == "Size" then
				Part.Size = value
			elseif index == "Color" then
				Part.Color3 = value
			elseif index == "BrickColor" then
				Part.Color = value
			end
		end
	})
	table.insert(Object.Objects, New)
	return New
end
Object.NewRegion = newRegion
--test is not a valid member of Player "Players.BRY402"
local YieldingFrame = lib.Utilities.newEvent("OnYield","Fire")
local OnNextFrame = lib.Utilities.newEvent("Updated","NextFrame")
local CustomWorkspace = {
	YieldingFrame = YieldingFrame.OnYield,
	OnNextFrame = OnNextFrame.Updated,
	GetPartsInBounds = Physics.GetPartsInBounds
}
local obj = Object.new()
obj.Size = Vector3.new(5, 5, 5)
obj.Position = Vector3.new(0, 30, 0)
local obj2 = Object.new()
obj2.Position = Vector3.new(0, .5, 0)
obj2.Size = Vector3.new(25, 1, 25)
obj2.Color = Color3.new(0,1,0)
lib.Loops.forever(function(yielding, delta)
	--OnNextFrame:NextFrame(delta)
	if yielding then
		--YieldingFrame:Fire(delta)
		Physics:UpdateObject(obj)
	end
end)
return CustomWorkspace