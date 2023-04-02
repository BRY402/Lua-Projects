local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"), "lib")()
local terminal = {debug = {Call = function(func, metatable)
			local func = debug.info(func, "f")
			local env = {}
			env.getfenv = function(level)
				return env
			end
			local success, func = pcall(setfenv, func, setmetatable(env, {
				__index = function(self, i)
					if metatable.__index then
						return metatable.__index(self, i)
					else
						return rawget(self, i) or getfenv()[i]
					end
				end,
				__newindex = function(self, i, v)
					if metatable.__newindex then
						metatable.__newindex(self, i, v)
					else
						rawset(self, i, v)
					end
				end
			}))
			if metatable.__call then
				return function(...)
					return metatable.__call(func, ...)
				end
			else
				return func
			end
		end}}
decompile = function(func)
	local storage = {result = ""}
	local function getArgs(...)
		local args = lib.Utilities.Pack(...)
		lib.Loops.read(args, function(i, v)
			if typeof(v) == "string" then
				args[i] =  "'"..v.."'"
			elseif typeof(v) == "Vector3" or typeof(v) == "CFrame" or typeof(v) == "Color3" then
				args[i] = typeof(v)..".new("..tostring(v)..")"
			else
				args[i] = tostring(v)
			end
		end)
		return table.concat(args, ", ")
	end
	local function callIndex(self, index, fromTable)
		local value = rawget(self, index) or getfenv()[index]
		if typeof(value) == "function" then
			return function(...)
				storage.result = storage.result..(not fromTable and "\n" or "")..index.."("..getArgs(...)..")"
				return value(...)
			end
		elseif typeof(value) == "table" then
			return setmetatable({}, {__index = function(self, index2)
				storage.result = storage.result.."\n"..index.."."
				return callIndex(value, index2, true)
			end})
		end
		return value
	end
	local func = terminal.debug.Call(func, {
		__index = function(self, index)
			return callIndex(self, index)
		end,
		__call = function(func, ...)
			storage.result = storage.result.."function("..getArgs(...)..")"
			return func(...)
		end
	})
	return function(...)
		local args = lib.Utilities.Pack(func(...))
		storage.result = storage.result.."\nend"
		return storage.result, table.unpack(args)
	end
end
display(decompile(function(...)
	print(...)
	print("b")
end)("a"))