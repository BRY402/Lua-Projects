local http = game:GetService("HttpService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true))()
local Instance = {new = function(Class,Parent)
	return lib.Create(Class,Parent)
end}
loadstring(http:GetAsync("https://github.com/fofl12/sc/raw/main/src/ct.lua",true))()