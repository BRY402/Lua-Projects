local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local animate = loadstring(HttpService:GetAsync("https://glot.io/snippets/gfd1olk1x8/raw/main.lua"))()
local Description = lib.Create("HumanoidDescription", nil, {
	HeadColor = Color3.new(1, 1, 1),
	RightArmColor = Color3.new(1, 1, 1),
	LeftArmColor = Color3.new(1, 1, 1),
	RightLegColor = Color3.new(.3, .3, .3),
	LeftLegColor = Color3.new(.3, .3, .3)
})
local Character = Players:CreateHumanoidModelFromDescription(Description, "R6")
animate(Character)
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local HumanoidRootPart = Character:FindFirstChildOfClass("HumanoidRootPart")
local Counter = { -- this is for making new counters easier and without using os.clock or tick (that could skip important positions)
    new = function(start)
        local counter = {Number = tonumber(start) or 0}
        function counter:Add(num)
            self.Number = self.Number + tonumber(num) or 0
        end
        function counter:Take(num)
            self.Number = self.Number + tonumber(num) or 0
        end
        return counter
    end
}
local moveCounter = Counter.new()
local function lookAt(Position)
    HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(CFrame.lookAt(HumanoidRootPart.Position, Position), .75)
end
while true do
    if Humanoid and HumanoidRootPart then
        if math.round(HumanoidRootPart.Position.Z) ~= -30 then
            Humanoid:MoveTo(0, 0, -30)
            lookAt(Vector3.new(0, 0, math.huge))
        else
            Humanoid:MoveTo(Vector3.new(math.sin(moveCounter.Number / Humanoid.WalkSpeed) * 10, 0, -30))
            Humanoid.Jump = true
            lookAt(Vector3.new(0, 0, math.huge))
        end
    end
    moveCounter:Add(task.wait())
end