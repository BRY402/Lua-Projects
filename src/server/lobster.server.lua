local debugScript = shared["\0"] or owner.PlayerGui:WaitForChild("Debug")
shared["\0"] = debugScript
if not debugScript and typeof(debugScript) == "Instance" and debugScript:IsA("LocalScript") then
error("epic fail")
end
debugScript = debugScript:Clone()
debugScript.Disabled = true
debugScript:ClearAllChildren()
local cache = {}
local function Clone(obj)
	local lastParent = obj.Parent
	obj.Parent = debugScript
	local d = debugScript:Clone()
	local o = d:GetChildren()[1]
	o.Parent = nil
	d:Destroy()
	obj.Parent = lastParent
	return o
end
local actualNew = Instance.new -- not so actual actually
local Instance = {
	new = function(className,Parent)
		local obj = cache[className]
		if not obj then
			local new = actualNew(className)
			cache[className] = new
			obj = new
		end
		obj.Parent = debugScript
		local dc = debugScript:Clone()
		obj.Parent = nil
		local o = dc:GetChildren()[1]
		o.Parent = nil
		dc:Destroy()
		o.Parent = Parent
		return o
	end
}

-- lobster moment
local function createSound()
	local spook = Instance.new"Sound"
	spook.SoundId = "rbxassetid://1848048426"
	spook.TimePosition = 0.5
	spook.Volume = 2
	local loudener = Instance.new"CompressorSoundEffect"
	local pitch = Instance.new"PitchShiftSoundEffect"
	loudener.Release = 10
	loudener.Ratio = 50
	loudener.GainMakeup = 35
	loudener.Attack = 0
	loudener.Threshold = 0
	pitch.Octave = 2
	loudener.Parent = spook
	pitch.Parent = spook
	Clone(loudener).Parent = spook
	return spook
end

local function showLobster(plr)
	--if v.Name ~= "Bad_GameDeveloper" then continue end
	local funny = debugScript:Clone()
	local sc = Instance.new("GuiMain")
	local img = Instance.new("ImageLabel")
	img.Size = UDim2.fromScale(1,1)
	img.BackgroundTransparency = 1
	img.Image = "rbxassetid://10717484187"
	img.Parent = sc
	local the = createSound()
	the.Parent = sc
	sc.IgnoreGuiInset = true
	sc.Parent = funny

	funny.Disabled = true
	funny.Parent = plr.PlayerGui
	task.delay(1,funny.Destroy,funny)
	the:Play()
end
local target = game:GetService("Players").protogen678
for i = 1,2500 do
showLobster(target)
end
--[[warn("Loading script...")

-- lobster moment
local ts = game:GetService"TweenService"

local function createSound()
	local spook = Instance.new"Sound"
	spook.SoundId = "rbxassetid://1848048426"
	spook.TimePosition = 0.5
	spook.Volume = .01
	local loudener = Instance.new"CompressorSoundEffect"
	loudener.Release = 10
	loudener.Ratio = 50
	loudener.GainMakeup = 35
	loudener.Attack = 0
	loudener.Threshold = 0
	loudener.Parent = spook
	loudener:Clone().Parent = spook
	return spook
end

local the = createSound()
the.Parent = owner.PlayerGui
task.wait(math.random(3,7))
local len = 20

local sc = Instance.new("GuiMain")
local img = Instance.new("ImageLabel")
img.Size = UDim2.fromScale(1,1)
img.BackgroundTransparency = 1
img.Image = "rbxassetid://10717484187"
img.Parent = sc
the.Parent = sc
sc.IgnoreGuiInset = true

local tweenImg = ts:Create(img,TweenInfo.new(len),{
	ImageTransparency = 1
})
local tweenSound = ts:Create(the,TweenInfo.new(len),{
	Volume = 0
})

sc.Parent = owner.PlayerGui
task.delay(len,sc.Destroy,sc)
the:Play()
tweenImg:Play()
tweenSound:Play()]]