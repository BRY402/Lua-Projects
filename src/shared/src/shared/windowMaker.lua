local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true), "lib")()
local ReplicatorRemote = lib.Create("RemoteEvent", owner, {Name = HttpService:GenerateGUID()})
local nls_source = [==[local ReplicatorRemote = owner:FindFirstChild(")]==]..ReplicatorRemote.Name..[==[")
]==]
NLS(nls_source, owner:FindFirstChildOfClass("PlayerGui"))
owner.CharacterAdded:Connect(function()
    NLS(nls_source, owner:FindFirstChildOfClass("PlayerGui"))
end)
local window = {}
return window