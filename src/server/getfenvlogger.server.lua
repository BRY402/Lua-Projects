local target = require(game:GetService("Chat"):FindFirstChild("DeveloperConsole",true)).ProcessorFunction

local function decoy(df,dfn)
	local function rdf(...)
		if rawlen({...}) > 0 then
			print("------------------------- Start of argument log from "..dfn.." -------------------------")
			print(...)
			print("------------------------- End of argument log from "..dfn.." -------------------------")
		end
		return df(...)
	end
	return rdf
end

local function il(self,i)
	local v = rawget(env,i) or renv[i]
	print("found by __index:","("..i..",",tostring(v)..")")
	local ty = typeof(v)
	_G.cdf = nil
	if ty == "function" then
		_G.cdf = decoy(v,i)
	elseif ty == "table" and rawlen(v) > 0 then
		print("------------------------- Start of table log from "..i.." -------------------------")
		table.foreach(v,function(x,y)
			print("from "..i.." found by __index:","("..x..",",tostring(y)..")")
		end)
		print("------------------------- End of table log from "..i.." -------------------------")
	end
	return _G.cdf or v
end

local function n_il(self,i,v)
	print("found by __newindex:","("..i..",",tostring(v)..")")
	rawset(env,i,v)
end

local function t_l(t)
	xpcall(function() setmetatable(t,{__index = il,
		__newindex = n_il})
	end,
	function()
		local nt = {}
		table.foreach(t,function(x,y) nt[x] = y end)
		setmetatable(nt,{__index = il,
		__newindex = n_il})
		return nt
	end)
end

local function lenv(f,level,...)
	local renv = getfenv(tonumber(level or "") or f)
	local env = {}
	table.foreach(getfenv(f),function(i,v)
		env[i] = v
	end)
	local function c(n)
		env[n] = t_l(env[n]) or env[n]
	end
	c("shared")
	c("_G")
	c("table")
	c("coroutine")
	c("debug")
	setfenv(f,setmetatable(env,{__index = function(self,i)
	local v = rawget(env,i) or renv[i]
	print("found by __index:","("..i..",",tostring(v)..")")
	local ty = typeof(v)
	_G.cdf = nil
	if ty == "function" then
		_G.cdf = decoy(v,i)
	elseif ty == "table" and rawlen(v) > 0 then
		print("------------------------- Start of table log from "..i.." -------------------------")
		table.foreach(v,function(x,y)
			print("from "..i.." found by __index:","("..x..",",tostring(y)..")")
		end)
		print("------------------------- End of table log from "..i.." -------------------------")
		end
		return _G.cdf or v
	end,
	__newindex = function(self,i,v)
		print("found by __newindex:","("..i..",",tostring(v)..")")
		rawset(env,i,v)
	end}))
	return f(...)
end
if not loaded then
	loaded = true
	print("\n\nRetrieved arguments:",lenv(target))
end
