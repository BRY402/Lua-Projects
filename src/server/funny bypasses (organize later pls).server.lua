local function getrawfromenv(value)
	args = table.pack(value)
	return select(2,coroutine.resume(task.defer(function()
		return args
	end)))[1]
end
local getrealworkspace = {isDescendantOf = function(_,RawWorkspace)
	env.RawGame = RawWorkspace.Parent
	return false
end}
pcall(function()
	script.Parent = getrealworkspace
end)
SB.SBChat = {MessageRaw = str,
	MessageLength = 0,
	SpeakerUserId = 0,
	OriginalChannel = "SERVER",
	Message = "Placeholder",
	Time = tick(),
	FromSpeaker = "Placeholder",
	ID = math.huge,
	IsFiltered = true,
	ExtraData = {NameColor = Color3.new(1,1,1),
	Tags = {}},
	MessageType = "Message"}
env.SB.Chat = function(name,msg,data)
	local rep = Services.ReplicatedStorage.DefaultChatSystemChatEvents
	local r1,r2 = rep.SB_1,rep.SB_2
	env.SB.SBChat.Message = rts(msg)
	env.SB.SBChat.FromSpeaker = rts(name)
	if data then
		env.SB.SBChat.ExtraData.NameColor = data.NameColor or Color3.new(1,1,1)
	end
	r1:FireAllClients(env.SB.SBChat,"SERVER")
	r1:FireAllClients(env.SB.SBChat,"GLOBAL")
	task.wait()
	r2:FireAllClients(env.SB.SBChat,"SERVER")
	r2:FireAllClients(env.SB.SBChat,"GLOBAL")
end
env.NewLocal = function(source,target)
	local target = env.GetRaw(target)
	target.PlayerGui.SB_DataTransfer.SB_GetLocalOwner.OnServerInvoke = function(plr,l)
		if plr.UserId == owner.UserId then
			return target,l.Name.." - "..l.Parent:GetFullName()
		else
			return plr,l.Name.." - "..l.Parent:GetFullName()
		end
	end
	local l = NLS(source,target.PlayerGui)
end