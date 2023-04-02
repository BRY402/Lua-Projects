local http = game:GetService("HttpService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true))()
local Instance = {new = function(Class,Parent)
	return lib.Create(Class,Parent)
end}
loadstring(game:GetService("HttpService"):GetAsync("https://pastebin.com/raw/rLxpNtpb",true))()