-- trails found in Ninja215215 (steal more :troll:)
local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local ParticleRate = .25
local TrailMoveRate = 1
local Character = owner.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local Torso = Character:FindFirstChild("Torso")
local trails = {}
local particles = {}
local trailIds = {
	"7151778302",
	"7151842823",
	"7151777149"
}
local particleIds = {
	"7150932717",
	"8515876977"
}
local function newTrail(Part)
	local Attachment0 = lib.Create("Attachment", Part, {Position = Vector3.new(0, 5, 0)})
	local Attachment1 = lib.Create("Attachment", Part, {Position = Vector3.new(0, -5, 0)})
	local trail = lib.Create("Trail", Part, {
		Texture = "https://www.roblox.com/asset/?id="..trailIds[lib.Utilities.Random(1, #trailIds).Integer],
		TextureMode = "Static",
		Attachment0 = Attachment0,
		Attachment1 = Attachment1,
		Lifetime = .5,
		TextureLength = 35,
		Transparency = NumberSequence.new(0, .05, .1, .25, 1),
		WidthScale = NumberSequence.new(1, 0),
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.new(1, .2, 0))
		})
	})
	table.insert(trails, trail)
end
local function newParticle(Part)
	local id = particleIds[lib.Utilities.Random(1, #particleIds).Integer]
	local particle = lib.Create("ParticleEmitter", Part, {
		__self = function(particle)
			local index = table.find(particleIds, id)
			if index == 2 then
				particle.LightInfluence = 0
				particle.LightEmission = .25
				particle.Brightness = 4
			end
		end,
		Texture = "https://www.roblox.com/asset/?id="..id,
		LockedToPart = true,
		Lifetime = 1.5,
		Rate = 0,
		Rotation = NumberRange.new(-35, 35),
		RotSpeed = NumberRange.new(-15, 15),
		SpreadAngle = Vector2.new(-180, 180),
		Transparency = NumberSequence.new(1, 0, .6, .2, .75, 0, 1),
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.new(1, .2, 0))
		})
	})
	table.insert(particles, particle)
end
--Humanoid.WalkSpeed = 160
for i, Part in pairs(Torso:GetConnectedParts()) do
	if Part.Name ~= "Head" and Part.Transparency ~= 1 then
		newTrail(Part)
	end
end
--[[local num = 0
local num1 = 0
while true do
	local delta = task.wait()
	num = num + delta
	num1 = num1 + delta
	if num >= 1 / ParticleRate then
		num = 0
		lib.Loops.read(particles, function(i, particle)
			local roll = lib.Utilities.Random(1, 6).Integer
			if roll == 1 then
				particle:Emit()
			end
		end)
	end
	if num1 >= 1 / TrailMoveRate then
		num1 = 0
		lib.Loops.read(trails, function(i, trail)
			
		end)
	end
	for i,v in pairs(trails) do
		if i % 10 == 0 then
			task.wait()
		end
	end
end]]