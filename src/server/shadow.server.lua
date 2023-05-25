local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local carter = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/carter.lua"))()
local Character = Players:CreateHumanoidModelFromUserId(119594951)
Character.Name = "XxShadow_GamerxX"
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true))()
local animate = loadstring(HttpService:GetAsync("https://glot.io/snippets/gfd1olk1x8/raw/main.lua"))()
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
local Head = Character.Head
local Humanoid = Character.Humanoid
local HumanoidRootPart = Character.HumanoidRootPart
animate(Character)
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
			TextColor3 = Color3.new(.1, .1, .1)
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
local bot = carter.new("8afdbc57-c664-46be-8d65-13220b3a925c", "V1")
local function Chatted(msg, plr)
	local PlayerChar = plr.Character
	if PlayerChar then
		local PlayerHrp = PlayerChar:FindFirstChild("HumanoidRootPart")
		if PlayerHrp then
			if (PlayerHrp.Position - HumanoidRootPart.Position).Magnitude <= 50 then
				if string.lower(msg) == "shadow" then
					target = plr
					ChatMessage(replies[math.random(1, #replies)])
				else
					if target == plr then
						if string.lower(msg) == "bye" or string.lower(msg) == "goodbye" then
							target = nil
							ChatMessage(goodbies[math.random(1, #goodbies)])
						else
							ChatMessage(bot:Send("["..plr.Name.."]: "..msg))
						end
					end
				end
			end
		end
	end
end
for i,v in pairs(Players:GetPlayers()) do
	v.Chatted:Connect(function(msg)
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