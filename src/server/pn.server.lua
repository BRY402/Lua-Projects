-- pn
-- Variables --
local d = game:GetService("Debris")
local ts = game:GetService("TweenService")
local uniont = {}
local info = TweenInfo.new(.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0)
local info2 = TweenInfo.new(.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local info3 = TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local nn = false
local x = 0
local z = 0
local ps = Instance.new("NumberValue",script)
local seed = Instance.new("NumberValue",script)
local res = Instance.new("NumberValue",script)
local freq = Instance.new("NumberValue",script)
local size = Instance.new("NumberValue",script)
local amp = Instance.new("NumberValue",script)
local shape = Instance.new("StringValue",script)
local portal = Instance.new("SpawnLocation",ps)
local gui = Instance.new("ScreenGui",owner.PlayerGui)
local box = Instance.new("TextBox",gui)
local resiz1 = {Size = Vector3.new(0,0,5)}
local resiz2 = {Size = Vector3.new(5,0,5)}
local goresiz1 = ts:Create(portal,info3,resiz1)
local goresiz2 = ts:Create(portal,info3,resiz2)
-- Properties --
ps.Value = 1
ps.Name = "ps"
seed.Value = 0
res.Value = 75 * ps.Value
freq.Value = .5 * ps.Value
size.Value = 25
amp.Value = 10
shape.Value = "Block"
box.PlaceholderText = "Part position."
box.Text = "Part position."
box.TextSize = 16
box.BackgroundColor3 = Color3.new(0,0,0)
box.TextColor3 = Color3.new(1,1,1)
box.Size = UDim2.new(1,0,0,20)
portal.Position = Vector3.new((size.Value / 2) * ps.Value,amp.Value + 10,(size.Value / 2) * ps.Value)
portal.Color = Color3.new(0,0,0)
portal.Size = Vector3.new(0,0,0)
portal.Material = "Neon"
portal.CastShadow = false
portal.CanCollide = false
portal.CanTouch = false
portal.Anchored = true
portal.CanQuery = false
-- Script --
local function geth(x,z)
local nheight = math.noise((x + seed.Value) / res.Value * amp.Value,(z + seed.Value) / res.Value * amp.Value) -- Gets next height + uses optional seed.
return math.clamp(nheight,-.5,.5) + .5 -- Makes sure the height is within the limit.
end
goresiz1:Play()
task.wait(1)
goresiz2:Play()
task.wait(1)
local function ns()
local reposport = {Position = Vector3.new((size.Value / 2) * ps.Value,amp.Value + 10,(size.Value / 2) * ps.Value)}
local goreposport = ts:Create(portal,info3,reposport)
goreposport:Play()
task.wait(.15)
for x = 0, size.Value do
for z = 0, size.Value do
if not nn then
local p = Instance.new("SpawnLocation",script)
for i, v in pairs(p:GetChildren()) do
d:AddItem(v,0)
end
p.Enabled = false
p.Material = "SmoothPlastic"
p.Anchored = true
p.Transparency = 1
p.Size = Vector3.new(ps.Value,ps.Value,ps.Value)
p.Shape = shape.Value
local h = geth(x,z)
p.Color = Color3.new(h,h,h)
box.Text = "\n X: = "..x.."\n Z: = "..z.."\n Position = "..tostring(x * ps.Value)..", "..tostring(h * amp.Value * freq.Value)..", "..tostring(z * ps.Value)
p.Position = Vector3.new(portal.Position.X,portal.Position.Y - ps.Value + .001,portal.Position.Z)
-- local vol = size.Value * math.pi * math.rad(h * amp.Value * freq.Value) / res.Value -- Gets the size of the sphere you want * math.pi (sphere) * radius / resolution
-- local turnt = {Orientation = Vector3.new(vol,0,0)}
local post = {Position = Vector3.new(x * ps.Value,h * amp.Value * freq.Value,z * ps.Value)}
local tran = {Transparency = 0}
-- local turntc = ts:Create(p,info,turnt)
local postc = ts:Create(p,info,post)
local tranc = ts:Create(p,info2,tran)
--turntc:Play()
postc:Play()
tranc:Play()
if h * amp.Value * freq.Value >= portal.Position.Y then
local reposport = {Position = Vector3.new((size.Value / 2) * ps.Value,10 + amp.Value,(size.Value / 2) * ps.Value)}
local goreposport = ts:Create(portal,info3,reposport)
goreposport:Play()
end
game:GetService("RunService").Stepped:Wait()
end
end
end
end
function clear()
repeat nn = true for i, v in pairs(script:GetChildren()) do if v:IsA("NumberValue") or v:IsA("StringValue") then
else d:AddItem(v,0) end if i <= 250 then task.wait() end end task.wait() until #script:GetChildren() == 7
nn = false
spawn(ns)
end
function new(v1,v2,v3,v4,v5,v6,v7)
if v1 then
ps.Value = v1
else
ps.Value = 1
end
if v2 then
seed.Value = v2
else
seed.Value = 0
end
if v3 then
size.Value = v3
else
size.Value = 25
end
if v4 then
res.Value = v4 * ps.Value
else
res.Value = 75 * ps.Value
end
if v5 then
freq.Value = v5 * ps.Value
else
freq.Value = .5 * ps.Value
end
if v6 then
amp.Value = v6
else
amp.Value = 10
end
if v7 then
shape.Value = v7
else
shape.Value = "Block"
end
end
spawn(ns)
owner.Chatted:Connect(function(msg)
if string.sub(msg,0,#"-new(") == "-new(" then
loadstring(string.sub(msg,2,#msg))()
spawn(clear)
elseif string.sub(msg,0,#"/e -new(") == "/e -new(" then
loadstring(string.sub(msg,5,#msg))()
spawn(clear)
elseif string.sub(msg,0,#"-refresh  ") == "-refresh" then
ps.Value = math.random(1,3)
res.Value = math.random(50,100) * ps.Value
freq.Value = math.random(.5,1) * ps.Value
size.Value = math.random(25,75)
amp.Value = math.random(1,10)
spawn(clear)
elseif string.sub(msg,0,#"/e -refresh  ") == "/e -refresh" then
ps.Value = math.random(1,3)
res.Value = math.random(50,100) * ps.Value
freq.Value = math.random(.5,1) * ps.Value
size.Value = math.random(25,75)
amp.Value = math.random(1,10)
spawn(clear)
elseif string.sub(msg,0,#"-refresh old") == "-refresh old" then
spawn(clear)
elseif string.sub(msg,0,#"/e -refresh old") == "/e -refresh old" then
spawn(clear)
elseif string.sub(msg,0,#"-reset") == "-reset" then
ps.Value = 1
res.Value = 75 * ps.Value
freq.Value = .5 * ps.Value
size.Value = 25
amp.Value = 10
shape.Value = "Block"
elseif string.sub(msg,0,#"/e -reset") == "/e -reset" then
ps.Value = 1
res.Value = 75 * ps.Value
freq.Value = .5 * ps.Value
size.Value = 25
amp.Value = 10
shape.Value = "Block"
elseif string.sub(msg,0,#"-union") == "-union" then
for i, v in pairs(script:GetDescendants()) do
if v:IsA("SpawnLocation") then
table.insert(uniont,v)
end
end
repeat nn = true for i, v in pairs(script:GetChildren()) do if v:IsA("NumberValue") or v:IsA("StringValue") then
else d:AddItem(v,0) end if i <= 250 then task.wait() end end task.wait() until #script:GetChildren() == 7
nn = false
local handler = Instance.new("SpawnLocation",script)
handler.Name = "UnionHandler"
handler.Size = Vector3.new(0,0,0)
handler.Anchored = true
local u = handler:UnionAsync(uniont)
u.Parent = script
table.clear(uniont)
elseif string.sub(msg,0,#"/e -union") == "/e -union" then
for i, v in pairs(script:GetDescendants()) do
if v:IsA("SpawnLocation") then
table.insert(uniont,v)
end
end
repeat nn = true for i, v in pairs(script:GetChildren()) do if v:IsA("NumberValue") or v:IsA("StringValue") then
else d:AddItem(v,0) end if i <= 250 then task.wait() end end task.wait() until #script:GetChildren() == 7
nn = false
local handler = Instance.new("SpawnLocation",script)
handler.Name = "UnionHandler"
handler.Size = Vector3.new(0,0,0)
handler.Anchored = true
local u = handler:UnionAsync(uniont)
u.Parent = script
table.clear(uniont)
elseif string.sub(msg,0,#"-clear") == "-clear" then
repeat nn = true for i, v in pairs(script:GetChildren()) do if v:IsA("NumberValue") or v:IsA("StringValue") then
else d:AddItem(v,0) end if i <= 250 then task.wait() end end task.wait() until #script:GetChildren() == 7
nn = false
elseif string.sub(msg,0,#"/e -clear") == "/e -clear" then
repeat nn = true for i, v in pairs(script:GetChildren()) do if v:IsA("NumberValue") or v:IsA("StringValue") then
else d:AddItem(v,0) end if i <= 250 then task.wait() end end task.wait() until #script:GetChildren() == 7
nn = false
end
end)
print("cmds: -refresh, -refresh old, -new, -reset, -union, -clear new help: -new(part size, seed, grid, resolution, frequency, amplitude, shape)")
-- UP TO DATE.
