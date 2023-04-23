local HttpService = game:GetService("HttpService")
local func, fail = loadstring(HttpService:GetAsync("https://gist.github.com/BRY402/b81f2790715c4b26686e4196e16fcfdb/raw"), "injector")
if func then
	func()
else
	error(fail)
end