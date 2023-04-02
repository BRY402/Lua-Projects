cr = {}
function cr:MakeConnection(userid)
--default is empty
--general
local connection = {id = userid,
channel = "default",
cc = Services.MessagingService:SubscribeAsync("comradio:default",function(msg)
local mr = Services.HttpService:JSONDecode(msg.Data)
sprint("["..Service.Players:GetNameFromUserIdAsync(mr.Author).."]: "..mr.Contents)
end)}
function connection:SetChannel(name)
if name ~= nil and typeof(name) == "string" then
self.channel = name
self.cc = Services.MessagingService:SubscribeAsync("comradio:"..name,function(msg)
local mr = Services.HttpService:JSONDecode(msg.Data)
sprint(mr.Contents)
end)
else
self.channel = "default"
self.cc = Services.MessagingService:SubscribeAsync("comradio:default",function(msg)
local mr = Services.HttpService:JSONDecode(msg.Data)
sprint(mr.Contents)
end)
end
end
function connection:Chat(rawmsg)
local mi = Services.HttpService:JSONEncode({
	Type = "text",
	Contents = rawmsg,
	Comment = "",
	Author = self.id
})
Services.MessagingService:PublishAsync("comradio:"..self.channel,mi)
end
return connection
end