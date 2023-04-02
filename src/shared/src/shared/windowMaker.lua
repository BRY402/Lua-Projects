local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true), "lib")()
local ReplicatorRemote = lib.Create("RemoteEvent", owner)
local window = {}
return window