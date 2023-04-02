local rs = game:GetService("RunService")
local function getlink(link)
if rs:IsClient() then
error("Script must be server side to run")
elseif rs:IsServer() then
loadstring(game:GetService("HttpService"):GetASync(link,true))()
end
end
getlink("https://gist.githubusercontent.com/BRY402/6ba9e8e37e59bf10dd76f4f70e43433b/raw/7b60143886c6237e234f744d810024c0196f8012/console.lua")