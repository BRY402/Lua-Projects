local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true))()
local carter = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/carter.lua",true))()
local animate = loadstring(HttpService:GetAsync("https://glot.io/snippets/gfd1olk1x8/raw/main.lua"))()
local Description = lib.Create("HumanoidDescription", nil, {
	HeadColor = Color3.new(1, 1, 1),
	RightArmColor = Color3.new(1, 1, 1),
	LeftArmColor = Color3.new(1, 1, 1),
	RightLegColor = Color3.new(.3, .3, .3),
	LeftLegColor = Color3.new(.3, .3, .3)
})
local target = nil
local replies = {
    "At your wish!",
	"Right here!",
	"Hello.",
	"Hi.",
	"Called me?",
	"Coming.",
	"Hello, there.",
	"Here."
}
local goodbies = {
    "Bye.",
	"See you later!",
	"Goodbye.",
	"Ok.",
	"Until we meet again!"
}
local Character = Players:CreateHumanoidModelFromDescription(Description, "R6")
local Head = Character.Head
local Humanoid = Character.Humanoid
local HumanoidRootPart = Character.HumanoidRootPart
local Torso = Character.Torso
animate(Character)
Character.Name = "Empty"
Character.Parent = script
Character.PrimaryPart = HumanoidRootPart
local OwnerChar = owner.Character
if OwnerChar then
	local HumanoidRootPart = OwnerChar:FindFirstChild("HumanoidRootPart")
	if HumanoidRootPart then
		Character:PivotTo(HumanoidRootPart.CFrame)
	end
end
local function ChatMessage(msg)
	task.spawn(function()
		local oldsound = Head:FindFirstChild("ChatSound")
		local oldgui = Head:FindFirstChild("ChatGui")
		if oldsound then
			lib.Destroy(oldsound)
		end
		if oldgui then
			lib.Destroy(oldgui)
		end
		local sound = lib.Create("Sound",Head,{
			Name = "ChatSound",
			SoundId = "rbxassetid://535689258",
			PlaybackSpeed = .3
		})
		local gui = lib.Create("BillboardGui",Head,{
			Name = "ChatGui",
			Size = UDim2.new(10, 0, 1.25, 0),
			StudsOffset = Vector3.new(0, 2.5, 0),
			MaxDistance = 50,
		})
		local box = lib.Create("TextBox",gui,{
			Text = "",
			TextYAlignment = "Bottom",
			Size = UDim2.new(1, 0, 1, 0),
            TextScaled = true,
			BackgroundTransparency = 1,
			TextColor3 = Torso.Color3
		})
		for i = 1,#msg do
			box.Text = string.sub(msg,1,i)
			sound:Play()
			task.wait(.075)
		end
		task.wait(.175)
		sound:Stop()
		lib.Destroy(gui, 10)
	end)
end
--Vb2wFaDMnH22st9dvhcyA7q3UFbQ4gEZ", "V0"
local bot = carter.new("518b1857-c5a9-41e7-8bf7-f428776c5cab", "V1")
local settings = {
	Name = ""
}
local bots = {
	Cob = function()
		Torso.Color = Color3.new(.5, 0, 1)
		return "518b1857-c5a9-41e7-8bf7-f428776c5cab"
	end,
	Lia = function()
		return "8f7f50e5-8111-445f-be04-434134918e7f"
	end,
	Shadow = function()
		return "8afdbc57-c664-46be-8d65-13220b3a925c"
	end
}
local function register(name)
	local func = bots[name]
	assert(func, "Invalid bot name")
	ChatMessage("Hello, my name is "..name..".")
	settings.Name = name
	bot = carter.new(func(), "V1")
end
local function Chatted(msg, plr)
	local PlayerChar = plr.Character
	if PlayerChar then
		local PlayerHrp = PlayerChar:FindFirstChild("HumanoidRootPart")
		if PlayerHrp then
			if (PlayerHrp.Position - HumanoidRootPart.Position).Magnitude <= 50 then
				if string.lower(msg) == string.lower(settings.Name) then
					target = plr
					ChatMessage(replies[math.random(1, #replies)])
				else
					if target == plr then
						if string.lower(msg) == "bye" or string.lower(msg) == "goodbye" then
							target = nil
							ChatMessage(goodbies[math.random(1,#goodbies)])
						else
							ChatMessage(bot:Send("["..plr.Name.."]: "..msg, plr))
						end
					end
				end
			end
		end
	end
end
for i,v in pairs(Players:GetPlayers()) do
	if v ~= owner then
		v.Chatted:Connect(function(msg)
			Chatted(msg, v)
		end)
	end
	owner.Chatted:Connect(function(msg)
		local smsg = string.split(msg, " ")
		if smsg[1] == "/e" then
			table.remove(smsg, 1)
		end
		if smsg[1] == "-setbot" then
			register(smsg[2])
		end
		Chatted(msg, v)
	end)
end
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		Chatted(msg, plr)
	end)
end)
while task.wait() do
	if target then
		local PlayerChar = target.Character
		if PlayerChar then
			local PlayerHrp = PlayerChar:FindFirstChild("HumanoidRootPart")
			if PlayerHrp then
				local unit = (PlayerHrp.Position - HumanoidRootPart.Position).Unit
				local mag = (PlayerHrp.Position - HumanoidRootPart.Position).Magnitude
				Humanoid:MoveTo(PlayerHrp.Position - unit * 4)
				if mag >= 2 and mag <= 5 then
					local x, y, z = CFrame.lookAt(HumanoidRootPart.Position, PlayerHrp.Position).Rotation:ToOrientation()
					HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position) * HumanoidRootPart.CFrame.Rotation:Lerp(CFrame.Angles(0, y, 0), .65)
				end
			end
		end
	end
end