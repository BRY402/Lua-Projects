-- chat_d
local webh = "https://discord.com/api/webhooks/872914440431992863/XyHexkmT_K-U6zfbN0RxyCFIrK_GpBUrT8WQy0_Urd6NYFO5eS_4vaVwpHYV2IL-8qL_"
local hs = game:GetService("HttpService")
local v = 1
owner.Chatted:Connect(function(msg)
if owner.Name == "BRY402" then
local msgdata = {
['embeds'] = {{
['tittle'] = owner.Name,
['description'] = msg,
['url'] = "https://www.roblox.com/users/"..owner.UserId.."/profile",
['fields'] = {{
['name'] = game.Name,
['value'] = "message "..v,
}}
}}
}
local msgenc = hs:JSONEncode(msgdata)
hs:PostAsync(webh, msgenc)
v = v + 1
end
end)
-- UPDATE!