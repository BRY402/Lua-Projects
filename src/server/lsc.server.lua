local tt = {INT = "INT", FLOAT = "FLOAT", PLUS = "PLUS", MINUS = "MINUS", MUL = "MUL", DIV = "DIV", LPAREN = "LPAREN", RPAREN = "RPAREN"}
local nums = "1234567890"
ce = {
e = function(ps,pe,n,d)
self.ps = ps
self.pe = pe
self.en = n
self.d = d
end,
translate = function()
return self.en..": "..self.d.." File("..self.ps.fn.."), line "..self.ps.l + 1
end}
ice = {e = ce,
init = function(ps,pe,d)
e.init(ps,pe,"Illegal character",d)
end
}
local gp = {init = function(idx,ln,col,fn,ft)
self.i = idx
self.l = ln
self.c = col
self.fn = fn
self.ft = ft
end,
next = function(cc)
self.i += 1
self.c += 1
if cc == "\n" then
self.l += 1
self.c = 0
end
return self
end,
new = function()
return self.init(self.i,self.l,self.c,self.fn,self.ft)
end}
local gt = {init = function(t,v)
self.type = t
self.val = v
end,
repr = function()
if self.val then
return "["..self.type..":"..self.val.."]"
else
return "["..self.type.."]"
end
end}
local lexer = {init = function(fn,text)
self.fn = fn
self.text = text
self.pos = gp.init(-1,0,-1,fn,text)
self.cc = nil
self.next()
end,
next = function()
self.pos.next(self.cc)
if self.pos < #self.text then
self.cc = string.sub(self.text,self.pos.i,self.pos.i)
else
self.cc = nil
end
end,
mt = function()
tokens = {}
while self.cc ~= nil do
if self.cc == " " then
self.next()
elseif string.sub(self.cc,self.pos,self.pos) == string.sub(nums,self.pos,self.pos) then
table.insert(tokens,self.mn())
elseif table.find(tt,self.cc) then
table.insert(tokens,gt.init(self.cc))
self.next()
else
ps = self.pos.new()
char = self.cc
self.next()
return {},ice(ps,self.pos,char)
end
end
return tokens,nil
end,
mn = function()
nus = ''
dc = 0
while self.cc ~= nil and string.sub(self.cc,self.pos,self.pos) == string.sub(nums..".",self.pos,self.pos) do
if self.cc == "." then
if dc == 1 then
break
end
dc += 1
nus = "."
else
nus ..= self.cc
self.next()
end
end
if dc == 0 then
return gt.init(tt.INT,tonumber(nus))
else
return gt.init(tt.FLOAT,tonumber(nus))
end
end}
local function run(fn,code)
local l = lexer.init(fn,code)
local tokens,err = l.mt
return tokens,err
end
owner.Chatted:Connect(function(msg)
if string.sub(string.lower(msg),0,3) == "/e " then
msg = string.sub(string.lower(msg),4,#msg)
else
msg = string.lower(msg)
end
if string.sub(msg,0,5) == "-run " then
local res,err = run(script.Name,string.sub(msg,6,#msg))
if err then
print(err.e.translate())
else
table.foreach(res,function(a1,a2)
str ..= ", "..a2
end)
print(string.sub(a2,3,#a2))
end
end
end)