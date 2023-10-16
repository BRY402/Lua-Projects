local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local DEFAULT_GRAVITY = 196.1999969482422
local workspace = lib.Create("Part", script, {
    Name = "Workspace",
    Anchored = true,
    CanCollide = false,
    CanTouch = false,
    CanQuery = false,
    Transparency = 1,
    Size = Vector3.zero
})
local obj = {new = function()
    local newObj = lib.Create("BoxHandleAdornment", workspace)
    return newObj
end}
local test = obj.new()
test.CFrame = CFrame.new(0, 10, 0) --[[ 11 studs above if in lsb, 9.5 in vsb
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
this is from your old attempt that i should go back to making so don't worry]]
local storage = {lastPosition = test.CFrame.Position, Acceleration = Vector3.zero}
while true do
    local delta = task.wait()
    local velocity = test.CFrame.Position - storage.lastPosition
    storage.lastPosition = test.CFrame.Position
    test.CFrame = test.CFrame * CFrame.new(velocity + storage.Acceleration * delta ^ 2)
    storage.Acceleration = Vector3.new(0, Physics.Gravity / DEFAULT_GRAVITY, 0) -- remem
end