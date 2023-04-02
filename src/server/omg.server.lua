NLS([==[local rf = string.format
local re = error
local function error(msg,level)
task.spawn(function()
re({match = function(t,s)
string = {format = function(...)
string.format = rf
local t = {...}
return tostring(msg)
--return string.format(unpack(t))
end}
end},level)
end)
end
error("Script ended")
task.wait(3.5)
error("Or did it?")
]==],owner.PlayerGui)