local loadstring = loadstring
local HttpService, RunService = game:GetService("HttpService"), game:GetService("RunService")
if RunService:IsServer() then
    local func, fail = loadstring(HttpService:GetAsync("https://gist.github.com/BRY402/077b16a705609fa7596a650d04e405b1/raw"), "Terminal2")
    if func then
        func()
    else
        error(fail)
    end
else
    error("Script must be ran on server to work.")
end
