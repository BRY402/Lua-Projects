local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
if RunService:IsServer() then
	local func, fail = loadstring(HttpService:GetAsync("https://gist.github.com/BRY402/d248cda89f1c3551e1bbd4f1a80c0ed0/raw"), "terminal")
	if func then
		func()
	else
		error(fail)
	end
else
	error("Script must be ran on server to work.")
end