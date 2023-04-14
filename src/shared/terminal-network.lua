outputmsg("Network&gt; Joining network...")
local MessagingService = Services.MessagingService
local HttpService = Services.HttpService
local encrypt = import("encrypt")
local newEvent = import("lib").Utilities.newEvent
local storage = {
    Token = HttpService:GenerateGUID(true),
    Password = "Terminal@User"..owner.UserId
}
local networks = {}
local getValidInput = setmetatable({}, {__index = function(self, index)
    if index == "Y" then
        return true
    elseif index == "N" then
        return false
    else
        terminal.error("Invalid input")
        return self[io.read()]
    end
end})
local byteToken = string.gsub(storage.Token, ".", function(char)
    return string.byte(char)
end)
encrypt(byte)
storage.Key = encrypt.encrypt(owner.Name).."."..byte
local function post(Name, Type, Content, Password)
    MessagingService:PublishAsync("Terminal-Network:"..tostring(Name or owner.Name), HttpService:JSONEncode({
        Author = owner.UserId,
        Type = Type,
        Content = Content,
        Password = Password or ""
    }))
end
local function validateId(id)
	return math.clamp(tonumber(id) or 1, 1, math.huge)
end
local function getPlayer(id)
	local success, user = pcall(function()
		return Players:GetNameFromUserIdAsync(validateId(id))
	end)
	if not success then
		return "Unknown"
	else
		return user
	end
end
local chatSignal = newEvent("Chatted")
--local network = {}
network = {
    Chatted = chatSignal.Chatted,
    Users = {[owner.Name] = math.huge}
}
local types_guest = {
    ConnectAccepted = function(data)
        local author = getPlayer(data.Content)
        local host = getPlayer(data.Author)
        if author.Name == owner.Name then
            networks[host] = {
                Chat = function(self, msg)
                    encrypt(data.Author)
                    post(host, "SendMessage", encrypt.encrypt(msg), data.Password)
                end,
                Chatted = chatSignal.Chatted,
                exec = function(source)
                    encrypt(data.Author)
                    post(host, "RunCode", encrypt.encrypt(source), data.Password)
                end
            }
        end
    end,
    ExecutionAllowed = function(data)
        outputmsg(os.time("%X").." - The host has accepted your remote code request.", Color3.new(0, 1, 0))
    end
}
local types_host = {
    Connect = function(data)
        local author = getPlayer(data.Author)
        if "Terminal@User"..data.Password == storage.Password and not data.Users[author] then
            terminal.newlog(author.." wants to join your network, allow? (Y/N)")
            local allow = getValidInput[io.read()]
            if allow then
                post(owner.Name, "ConnectAccepted", data.Author)
                network.Users[author] = 0
            end
        end
    end,
    SendMessage = function(data)
        encrypt(data.Author)
        chatSignal:Fire(encrypt.decrypt(data.Content), owner.Name)
    end,
    RunCode = function(data)
        local author = getPlayer(data.Author)
        if network.Users[author] < 1 then
            terminal.newlog(getPlayer(data.Author).." wants the permission to run code, allow? (Y/N)")
            local allow = getValidInput[io.read()]
            if allow then
                encrypt(data.Author)
                local code = encrypt.decrypt(data.Content)
                network.Users[author] = 1
                outputmsg("<font color = rgb(255, 255, 0)>"..author.."/&gt;</font> "..code)
                terminal.exec(code)
            end
        end
    end
}
MessagingService:SubscribeAsync("Termina-Network:"..owner.Name, function(msgData)
    local data = HttpService:JSonDecode(msgData.Data)
    local key = string.split(storage.Key, ".")
    encrypt(key[2])
    if "Terminal@User"..data.Password == storage.Password then
        if owner.Name == encrypt.decrypt(key[1]) then
            local func = types_host[data.Type]
            if func then
                func(data)
            end
        else
            local func = types_guest[data.Type]
            if func then
                func(data)
            end
        end
    end
end)
function network:GetPassword()
    return storage.Password
end
function network:GetKey()
    terminal.warn("DO NOT SHOW OR SHARE YOUR KEY")
    return storage.Key
end
function network:Connect(username, password)
    post(username, "Connect", "", password)
end
outputmsg("Network&gt; finished.")
--return network