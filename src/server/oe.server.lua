local c = workspace
local function r(str)
  if string.sub(str,0,3) == "/e " then
    return string.sub(str,4,#str)
  else
    return str
  end
end
print([[Commands:
w/gc - get children
w/gbi - get by id
w/gbn - get by name
w/gp - get parent]])
owner.Chatted:Connect(function(msg)
local msg = r(msg)
if msg == "w/gc" then
for i,v in pairs(c:GetChildren()) do
print(i.." - "..v.Name)
task.wait()
end
elseif string.gsub(msg,0,6) == "w/gbi/" then
local i = c:GetChildren()[string.gsub(msg,7,#msg)]
if i then
c = i
print(c)
else
warn("Instance id not found")
end
elseif string.gsub(msg,0,6) == "w/gbn/" then
local i = c:FindFirstChild(string.gsub(msg,7,#msg))
if i then
c = i
print(c)
else
warn("Instance not found")
end
elseif msg == "w/gp" then
if c ~= workspace then
c = c.Parent
else
warn("Cannot get workspace parent")
end
end
end)