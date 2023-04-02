local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
if RunService:IsServer() then
	local func, fail = loadstring(HttpService:GetAsync("https://gist.github.com/BRY402/b81f2790715c4b26686e4196e16fcfdb/raw"), "injector")
	if func then
		func()
	else
		error(fail)
	end
else
	error("Script must be ran on server to work.")
end