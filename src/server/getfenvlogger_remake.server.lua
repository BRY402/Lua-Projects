local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"), "lib")()
local function Call(func, metatable)
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
end
local function find(table, value)
	return select(2, lib.Loops.read(table, function(i, v)
		return value == v, i
	end))
end
local function decompile(func)
	local result = {}
	local variables = {}
	local types = {
		string = function(value)
			local value = value:gsub("'", "\\'"):gsub('"', '\\"')
			return string.find(value, "\n") and "[["..value.."]]" or "'"..value.."'"
		end,
		Vector3 = function(value)
			return typeof(value)..".new("..tostring(value)..")"
		end
	}
	types.CFrame = types.Vector3
	types.Color3 = types.Vector3
	local function getArgs(...)
		local args = lib.Utilities.Pack(...)
		lib.Loops.read(args, function(i, v)
			local formatvalue = types[typeof(v)]
			local variable = find(variables, v)
			if variable then
				args[i] = variable
			elseif formatvalue then
				args[i] = formatvalue(v)
			else
				args[i] = tostring(v)
			end
		end)
		return table.concat(args, ", ")
	end
	local function setVars(...)
		local args = lib.Utilities.Pack(...)
		local storage = {
			result = "",
			count = 0
		}
		lib.Loops.read(args, function(i, v)
			variables[i] = v
			storage.count = storage.count + 1
			storage.result = storage.result.."arg"..storage.count..", "
		end)
		return string.sub(storage.result, 1, #storage.result - 2)
	end
	local function callIndex(self, index, fromTable)
		local value = rawget(self, index) or getfenv()[index]
		if not variables[index] or variables[index] ~= value then
			variables[index] = value
		end
		if typeof(value) == "function" then
			return function(...)
				if not fromTable then
					table.insert(result, index.."("..getArgs(...)..")")
				else
					result[#result] = result[#result]..index.."("..getArgs(...)..")"
				end
				return value(...)
			end
		elseif typeof(value) == "table" then
			return setmetatable({}, {__index = function(self, index2)
				table.insert(result, index..".")
				return callIndex(value, index2, true)
			end})
		end
		return value
	end
	local func = Call(func, {
		__index = function(self, index)
			return callIndex(self, index)
		end,
		__call = function(func, ...)
			table.insert(result, "(function("..setVars(...)..")")
			return func(...)
		end
	})
	return function(...)
		local args = lib.Utilities.Pack(func(...))
		table.insert(result, "end)("..getArgs(...)..")")
		return table.concat(result, "\n"), table.unpack(args)
	end
end
print(decompile(function(...)
	print(...)
	print("b")
end)("a"))
-- expected output:
--[[
(function(vars)
	print(vars)
	print('b')
end)(argsTheUserInput)
]]