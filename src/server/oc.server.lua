local r = Instance.new("RemoteEvent",owner.PlayerGui)
local chat = game:GetService("Chat")
local rems = game.ReplicatedStorage.DefaultChatSystemChatEvents
--[[local NAME_COLORS =
	{
		Color3.new(253/255, 41/255, 67/255), -- BrickColor.new("Bright red").Color,
		Color3.new(1/255, 162/255, 255/255), -- BrickColor.new("Bright blue").Color,
		Color3.new(2/255, 184/255, 87/255), -- BrickColor.new("Earth green").Color,
		BrickColor.new("Bright violet").Color,
		BrickColor.new("Bright orange").Color,
		BrickColor.new("Bright yellow").Color,
		BrickColor.new("Light reddish violet").Color,
		BrickColor.new("Brick yellow").Color,
	}

	local function GetNameValue(pName)
		local value = 0
		for index = 1, #pName do
			local cValue = string.byte(string.sub(pName, index, index))
			local reverseIndex = #pName - index + 1
			if #pName%2 == 1 then
				reverseIndex = reverseIndex - 1
			end
			if reverseIndex%4 >= 2 then
				cValue = -cValue
			end
			value = value + cValue
		end
		return value
	end

	local color_offset = 0
	local function ComputeNameColor(pName)
		return NAME_COLORS[((GetNameValue(pName) + color_offset) % #NAME_COLORS) + 1]
	end
r.Name = "OCE"]]
NLS([==[local input = owner.PlayerGui.SB_OutputGUI.Task.InputBar
local chat = game:GetService("Chat")
--local r = owner.PlayerGui.OCE
local rems = game.ReplicatedStorage.DefaultChatSystemChatEvents
input.FocusLost:Connect(function()
local msg = chat:FilterStringForBroadcast(input.Text,owner)
local s,f = pcall(function()
rems.SB_10:FireServer(msg,"SERVER")
end)
if f then
warn("Error while sending message.")
end
warn("(Output) ["..owner.Name.."]: "..msg)
end)]==],owner.PlayerGui)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:Connect(function(msg)
if string.sub(msg,0,3 + #owner.Name) == "/e "..owner.Name then
wh = true
else
wh = false
end
if wh == false and string.sub(msg,0,3) ~= "/e " then
if string.sub(msg,0,3) ~= "/w " then
local s,f = pcall(function()
warn("["..v.Name.."]: "..chat:FilterStringForBroadcast(msg,owner))
end)
if f then
warn("["..v.Name.."]: (Unfiltered character)")
end
else
local s,f = pcall(function()
warn("["..v.Name.."]: "..chat:FilterStringForBroadcast(string.sub(msg,4 + #owner.Name,#msg),owner))
end)
end
if f then
warn("["..v.Name.."]: (Unfiltered character)")
end
end
end)
end
game.Players.PlayerAdded:Connect(function(plr)
plr.Chatted:Connect(function(msg)
if string.sub(msg,0,3 + #owner.Name) == "/e "..owner.Name then
wh = true
else
wh = false
end
if wh == false and string.sub(msg,0,3) ~= "/e " then
if string.sub(msg,0,3) ~= "/w " then
local s,f = pcall(function()
warn("["..plr.Name.."]: "..chat:FilterStringForBroadcast(msg,owner))
end)
if f then
warn("["..plr.Name.."]: (Unfiltered character)")
end
else
local s,f = pcall(function()
warn("["..plr.Name.."]: "..chat:FilterStringForBroadcast(string.sub(msg,4 + #owner.Name,#msg),owner))
end)
end
if f then
warn("["..plr.Name.."]: (Unfiltered character)")
end
end
end)
end)
r.OnServerEvent:Connect(function(plr,msg)
local m1 = {MessageRaw=msg,
MessageLength=#msg,
SpeakerUserId=owner.UserId,
OriginalChannel="SERVER",
Message=string.sub(msg,0,200),
Time=tick(),
FromSpeaker=owner.Name,
ID=math.huge,
IsFiltered=true,
ExtraData={NameColor = ComputeNameColor(owner.Name),
tags = {},
E = true},
MessageType="Message",
}
rems["1"]:FireAllClients(m1,"SERVER")
task.wait()
rems["2"]:FireAllClients(m1,"SERVER")
end)