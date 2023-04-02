NLS([==[local rf = string.format
local function ferror(r,form,data)
task.spawn(function()
error({match = function(t,s)
string = {format = function(...)
string.format = rf
local t = {...}
t[6] = r
if form or form == nil then
t[3] = data[1]
t[4] = data[2]
t[5] = data[3]
return string.format(unpack(t))
else
return r
end
end}
end})
end)
end
ferror("VoidSB sandbox fail",true,{-69,"tuskor661",math.huge})]==],owner.PlayerGui)