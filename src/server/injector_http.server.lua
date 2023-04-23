local HttpService = game:GetService("HttpService")
local func, fail = loadstring(HttpService:GetAsync("https://gist.github.com/BRY402/4fcfd631cbb1bc33223172271e9167ce/raw"), "injector")
if func then
	func()
else
	error(fail)
end